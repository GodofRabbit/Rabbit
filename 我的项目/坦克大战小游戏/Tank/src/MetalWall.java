import java.awt.Graphics;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Toolkit;

public class MetalWall {
	//设置金属墙的大小，全局静态
	public static final int width = 40;
	public static final int length = 40;

	//金属墙坐标
	private int x, y;
	TankClient tc;
	private static Toolkit tk = Toolkit.getDefaultToolkit();
	private static Image[] wallImages = null;
	static {
		wallImages = new Image[] { 
				tk.getImage(CommonWall.class.getResource("Images/metalWall.gif"))
				};
	}

	//构造函数
	public MetalWall(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc;
	}

	//画金属墙的函数
	public void draw(Graphics g) {
		g.drawImage(wallImages[0], x, y, null);
	}

	//返回长方形实例
	public Rectangle getRect() {
		return new Rectangle(x, y, width, length);
	}
}
