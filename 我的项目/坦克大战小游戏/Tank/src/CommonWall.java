import java.awt.*;

public class CommonWall {
	//设置墙的大小，全局静态
	public static final int width = 20;
	public static final int length = 20;
	//坐标值
	int x, y;

	TankClient tc;
	private static Toolkit tk = Toolkit.getDefaultToolkit();
	private static Image[] wallImages = null;
	static {
		// 储存CommonWall的图片
		wallImages = new Image[] {
		tk.getImage(CommonWall.class.getResource("Images/commonWall.gif")), };
	}

	//构造函数
	public CommonWall(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc;
	}

	//画普通墙的函数
	public void draw(Graphics g) {
		g.drawImage(wallImages[0], x, y, null);
	}

	//返回长方形实例
	public Rectangle getRect() {
		return new Rectangle(x, y, width, length);
	}
}
