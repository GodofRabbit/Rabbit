package com.tarena.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

import javax.imageio.ImageIO;

import com.tarena.dangdang.action.user.BaseAction;

public class CodeAction extends BaseAction{
	InputStream inputStream;
	public String execute(){
		BufferedImage image=new BufferedImage(60,20,BufferedImage.TYPE_INT_RGB);
		Graphics g=image.getGraphics();
		Random r=new Random();
		g.fillRect(0,0,60,20);
		String code=RandomString.getString();
		session.put("code", code);
		String[] fontStyles=new String[]{Font.DIALOG,Font.DIALOG_INPUT,Font.SANS_SERIF,Font.SERIF};
		int[] styles=new int[]{Font.BOLD,Font.ITALIC,Font.ROMAN_BASELINE,Font.TRUETYPE_FONT,Font.HANGING_BASELINE};
		g.setFont(new Font(Font.SERIF, Font.BOLD, 20));
		for(int i=0;i<4;i++){
			g.setFont(new Font(fontStyles[r.nextInt(fontStyles.length)], styles[r.nextInt(styles.length)],22));
			g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
			g.drawString(code.charAt(i)+"",5+10*i,16);
		}
		g.setColor(Color.black);
		g.drawLine(0, r.nextInt(20), 60,r.nextInt(20));
		g.drawLine(0, r.nextInt(20), 60,r.nextInt(20));
		
		//3Ñ¹ËõÍ¼Æ¬
		ByteArrayOutputStream bos=new ByteArrayOutputStream();
		try {
			ImageIO.write(image, "jpeg",bos);
		} catch (IOException e) {
			e.printStackTrace();
		}
		byte[] bytes=bos.toByteArray();
		inputStream=new ByteArrayInputStream(bytes);
		return "sucess";
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
