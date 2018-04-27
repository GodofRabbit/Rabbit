import java.awt.*;

public class CommonWall {
	//����ǽ�Ĵ�С��ȫ�־�̬
	public static final int width = 20;
	public static final int length = 20;
	//����ֵ
	int x, y;

	TankClient tc;
	private static Toolkit tk = Toolkit.getDefaultToolkit();
	private static Image[] wallImages = null;
	static {
		// ����CommonWall��ͼƬ
		wallImages = new Image[] {
		tk.getImage(CommonWall.class.getResource("Images/commonWall.gif")), };
	}

	//���캯��
	public CommonWall(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc;
	}

	//����ͨǽ�ĺ���
	public void draw(Graphics g) {
		g.drawImage(wallImages[0], x, y, null);
	}

	//���س�����ʵ��
	public Rectangle getRect() {
		return new Rectangle(x, y, width, length);
	}
}
