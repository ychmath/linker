package com.linker.config;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import jakarta.servlet.http.HttpServletRequest;

@Configuration
@EnableWebSocket


public class alramonfig implements WebSocketConfigurer {
	
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new SocketHandler(), "/websocket")
		.setAllowedOrigins("*")
		.addInterceptors(new HttpSessionHandshakeInterceptor());
	}

	private static class SocketHandler extends TextWebSocketHandler {
		
		private final List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
		HashMap<String, String> socketMap = new LinkedHashMap<>();
		Set<String> keySet = socketMap.keySet();
					
		
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			
			sessions.add(session);
			String userId = (String) session.getAttributes().get("user");

			if (!socketMap.containsKey(userId)) {
				socketMap.put(userId, session.getId());
			} 

			if ((socketMap.get(userId) == "-")) {
				socketMap.put(userId, session.getId());
			} 

			System.out.println("conn   : " + session.getId());
			// 소켓 정보와 사용자 유저아이디 연결 출력 확인용 실사용시 삭제
			keySet = socketMap.keySet();
			for (String key : keySet) {
				System.out.println(socketMap);
				System.out.println(key + " : " + socketMap.get(key));
			}

		}

		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			String userId = (String) session.getAttributes().get("userid");
			System.out.println("remove : " + session.getId());
			if((socketMap.get(userId) != "-")) {
				socketMap.put(userId, "-");
			}//들어오고 나가는거 확인용 실사용은 밑에 문장으로 접속자 까지 삭제
			//socketMap.remove(userId);
			
			sessions.remove(session);

		}

		@Override
		public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

			String payload = message.getPayload();//클라이언트로부터 받은 메세지 

			
			//메세지 처리 부분
			
		}//text_send
		
		
	}// handler
	
	private class HttpSessionHandshakeInterceptor implements HandshakeInterceptor {//핸드쉐이크 기능으로 session정보를 web소켓으로 변환 
		@Override
		public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
				WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
			if (request instanceof ServletServerHttpRequest) {
				ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
				HttpServletRequest httpServletRequest = servletRequest.getServletRequest();

				// HttpSession으로부터 userid 값을 가져와 WebSocketSession의 attributes에 추가
				String userId = (String) httpServletRequest.getSession().getAttribute("user");
				attributes.put("user", userId);
			}
			return true;
		}

		@Override
		public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
				WebSocketHandler wsHandler, Exception exception) {
			
		}//핸드쉐이크 이후 작업 로직 할것 없으면 비워두면됨
	}
	
}
