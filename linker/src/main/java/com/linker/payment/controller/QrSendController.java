/*
 * package com.linker.payment.controller;
 * 
 * 
 * import java.awt.PageAttributes.MediaType; import java.io.IOException;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PathVariable;
 * 
 * import com.google.zxing.WriterException; import
 * com.linker.payment.service.QrSendService;
 * 
 * 
 * 
 * @Controller public class QrSendController {
 * 
 * @Autowired private QrSendService service;
 * 
 * @GetMapping(value = "/qrcode/{userData}", produces = MediaType) public byte[]
 * generateQRCode(@PathVariable String userData) { try { return
 * service.generateQRCode(userData); } catch (WriterException | IOException e) {
 * // QR 코드 생성에 실패한 경우 예외 처리 e.printStackTrace(); return null; } }
 * 
 * 
 * }
 */