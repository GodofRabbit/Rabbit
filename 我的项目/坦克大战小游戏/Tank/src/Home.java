import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Toolkit;

public class Home {
	private int x, y;
	private TankClient tc;
	
	//家的大小，全局静态
	public static final int width = 40; 
	public static final int length = 40;
	private boolean live = true;

	private static Toolkit tk = Toolkit.getDefaultToolkit(); // 全局静态变量
	private static Image[] homeImages = null;
	static {
		homeImages = new Image[] { 
				tk.getImage(CommonWall.class.getResource("Images/home.jpg")), };
	}

	//构造函数
	public Home(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc; // 获得控制
	}

	//游戏失败
	public void gameOver(Graphics g) {

		tc.tanks.clear();// 作清理页面工作
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
		g.drawString("你输了！", 220, 250);
		g.drawString(" 游戏结束！ ", 220, 300);
		g.setFont(f);
		g.setColor(c);
	}

	//绘制老家的函数
	public void draw(Graphics g) {
		if (live) { 
			g.drawImage(homeImages[0], 380, 543, null);
			}else {
				gameOver(g); // 调用游戏结束
				}
		}
	
	//判断是否还活着
	public boolean isLive() { 
		return live;
	}

	//设置生命
	public void setLive(boolean live) { 
		this.live = live;
	}

	//返回长方形实例
	public Rectangle getRect() {
		return new Rectangle(x, y, width, length);
	}

	public void clear() {
		// TODO Auto-generated method stub
		this.live = false;
	}
}
