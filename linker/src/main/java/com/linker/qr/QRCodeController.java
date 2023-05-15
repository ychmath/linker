package com.linker.qr;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class QRCodeController {
	@GetMapping("/qrcode")
	public void generateQRCode(@RequestParam String product, @RequestParam int quantity, HttpServletResponse response)
			throws IOException, WriterException {
		String content = "product=" + product + "&quantity=" + quantity;
		int width = 200;
		int height = 200;
		String format = "png";
		Map<EncodeHintType, Object> hints = new HashMap<>();
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		BitMatrix bitMatrix = new QRCodeWriter().encode(content, BarcodeFormat.QR_CODE, width, height, hints);
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		MatrixToImageWriter.writeToStream(bitMatrix, format, outputStream);
		response.setContentType("image/png");
		response.getOutputStream().write(outputStream.toByteArray());
		response.getOutputStream().flush();
	}
}
