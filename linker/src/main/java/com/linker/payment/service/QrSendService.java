/*
 * package com.linker.payment.service;
 * 
 * import java.awt.image.BufferedImage; import java.io.ByteArrayOutputStream;
 * import java.io.IOException; import java.util.HashMap; import java.util.Map;
 * 
 * import javax.imageio.ImageIO;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.mail.javamail.JavaMailSender; import
 * org.springframework.stereotype.Service;
 * 
 * import com.google.zxing.BarcodeFormat; import
 * com.google.zxing.EncodeHintType; import com.google.zxing.WriterException;
 * import com.google.zxing.common.BitMatrix; import
 * com.google.zxing.qrcode.QRCodeWriter; import
 * com.linker.payment.dao.QrSendDao;
 * 
 * @Service public class QrSendService {
 * 
 * @Autowired QrSendDao dao;
 * 
 * @Autowired JavaMailSender mail;
 * 
 * 
 * public byte[] generateQRCode(String userData) throws WriterException,
 * IOException { int width = 300; int height = 300; String format = "png";
 * 
 * Map<EncodeHintType, Object> hints = new HashMap<>();
 * hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
 * 
 * QRCodeWriter qrCodeWriter = new QRCodeWriter(); BitMatrix bitMatrix =
 * qrCodeWriter.encode(userData, BarcodeFormat.QR_CODE, width, height, hints);
 * 
 * ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
 * BufferedImage bufferedImage = new BufferedImage(width, height,
 * BufferedImage.TYPE_INT_RGB);
 * 
 * for (int x = 0; x < width; x++) { for (int y = 0; y < height; y++) { int rgb
 * = bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF; bufferedImage.setRGB(x, y,
 * rgb); } }
 * 
 * ImageIO.write(bufferedImage, format, byteArrayOutputStream); return
 * byteArrayOutputStream.toByteArray(); } }
 * 
 */