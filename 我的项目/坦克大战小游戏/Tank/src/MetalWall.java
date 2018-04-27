import java.awt.Graphics;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Toolkit;

public class MetalWall {
	//���ý���ǽ�Ĵ�С��ȫ�־�̬
	public static final int width = 40;
	public static final int length = 40;

	//����ǽ����
	private int x, y;
	TankClient tc;
	private static Toolkit tk = Toolkit.getDefaultToolkit();
	private static Image[] wallImages = null;
	static {
		wallImages = new Image[] { 
				tk.getImage(CommonWall.class.getResource("Images/metalWall.gif"))
				};
	}

	//���캯��
	public MetalWall(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc;
	}

	//������ǽ�ĺ���
	public void draw(Graphics g) {
		g.drawImage(wallImages[0], x, y, null);
	}

	//���س�����ʵ��
	public Rectangle getRect() {
		return new Rectangle(x, y, width, length);
	}
}
