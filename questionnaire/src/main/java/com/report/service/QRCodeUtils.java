package com.report.service;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@Service
public class QRCodeUtils {
	public void QRcodeSet(String contents, int width, int height,OutputStream os) throws WriterException, IOException {
        BitMatrix bitMatrix = createBitMatrix(contents, width, height);
        MatrixToImageWriter.writeToStream(bitMatrix, "png", os);
    }

    private BitMatrix createBitMatrix(String contents, int width,int height) throws UnsupportedEncodingException, WriterException {
        contents = new String(contents.getBytes("UTF-8"), "ISO-8859-1");

        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(contents,BarcodeFormat.QR_CODE, width, height);
        return bitMatrix;
    }
}
