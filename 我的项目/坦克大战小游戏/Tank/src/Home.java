import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Toolkit;

public class Home {
	private int x, y;
	private TankClient tc;
	
	//�ҵĴ�С��ȫ�־�̬
	public static final int width = 40; 
	public static final int length = 40;
	private boolean live = true;

	private static Toolkit tk = Toolkit.getDefaultToolkit(); // ȫ�־�̬����
	private static Image[] homeImages = null;
	static {
		homeImages = new Image[] { 
				tk.getImage(CommonWall.class.getResource("Images/home.jpg")), };
	}

	//���캯��
	public Home(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc; // ��ÿ���
	}

	//��Ϸʧ��
	public void gameOver(Graphics g) {

		tc.tanks.clear();// ������ҳ�湤��
		tc.metalWall.clear();
		tc.otherWall.clear();
		tc.bombTanks.clear();
		tc.trees.clear();
		tc.bullets.clear();
		tc.homeTank.setLive(false);
		tc.blood.clear();
		Color c = g.getColor();
		g.setColor(Color.GRAY);
		Font f = g.getFont();
		g.setFont(new Font(" ", Font.BOLD, 40));
		g.drawString("�����ˣ�", 220, 250);
		g.drawString(" ��Ϸ������ ", 220, 300);
		g.setFont(f);
		g.setColor(c);
	}

	//�����ϼҵĺ���
	public void draw(Graphics g) {
		if (live) { 
			g.drawImage(homeImages[0], 380, 543, null);
			}else {
				gameOver(g); // ������Ϸ����
				}
		}
	
	//�ж��Ƿ񻹻���
	public boolean isLive() { 
		return live;
	}

	//��������
	public void setLive(boolean live) { 
		this.live = live;
	}

	//���س�����ʵ��
	public Rectangle getRect() {
		return new Rectangle(x, y, width, length);
	}

	public void clear() {
		// TODO Auto-generated method stub
		this.live = false;
	}
}
