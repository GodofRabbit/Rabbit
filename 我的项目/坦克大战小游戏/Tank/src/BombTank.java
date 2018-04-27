import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;

public class BombTank {
	//爆炸位置的坐标
	private int x, y;
	//初始状态为活着的
	private boolean live = true;
	private TankClient tc;
	private static Toolkit tk = Toolkit.getDefaultToolkit();

	//存储从小到大的爆炸效果图
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

	//构造函数
	public BombTank(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc;
	}

	//画出爆炸的函数
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
