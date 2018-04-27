import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;

public class BombTank {
	//��ըλ�õ�����
	private int x, y;
	//��ʼ״̬Ϊ���ŵ�
	private boolean live = true;
	private TankClient tc;
	private static Toolkit tk = Toolkit.getDefaultToolkit();

	//�洢��С����ı�ըЧ��ͼ
	private static Image[] images = {
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/1.gif")),
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/2.gif")),
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/3.gif")),
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/4.gif")),
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/5.gif")),
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/6.gif")),
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/7.gif")),
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/8.gif")),
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/9.gif")),
			tk.getImage(BombTank.class.getClassLoader().getResource(
					"images/10.gif")), };
	int step = 0;

	//���캯��
	public BombTank(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc;
	}

	//������ը�ĺ���
	public void draw(Graphics g) {
		
		if (!live) {
			tc.bombTanks.remove(this);
			return;
		}
		if (step == images.length) {
			live = false;
			step = 0;
			return;
		}
		g.drawImage(images[step], x, y, null);
		step++;
	}
}
