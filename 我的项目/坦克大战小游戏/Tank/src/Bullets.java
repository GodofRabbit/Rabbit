import java.awt.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Bullets {
	
	//子弹的速度，全局静态
	public static  int speedX = 10;
	public static  int speedY = 10;

	//子弹的大小，全局静态
	public static final int width = 10;
	public static final int length = 10;

	private int x, y;
	Direction diretion;

	private boolean good;
	private boolean live = true;

	private TankClient tc;

	private static Toolkit tk = Toolkit.getDefaultToolkit();
	private static Image[] bulletImages = null;
	//不同方向对应不同的子弹
	private static Map<String, Image> images = new HashMap<String, Image>(); 

	static {
		bulletImages = new Image[] {
				tk.getImage(Bullets.class.getClassLoader().getResource(
						"images/bulletL.gif")),

				tk.getImage(Bullets.class.getClassLoader().getResource(
						"images/bulletU.gif")),

				tk.getImage(Bullets.class.getClassLoader().getResource(
						"images/bulletR.gif")),

				tk.getImage(Bullets.class.getClassLoader().getResource(
						"images/bulletD.gif")),
		};

		//加入容器
		images.put("L", bulletImages[0]); 

		images.put("U", bulletImages[1]);

		images.put("R", bulletImages[2]);

		images.put("D", bulletImages[3]);
	}

	//构造函数1，参数是坐标和方向
	public Bullets(int x, int y, Direction dir) {
		this.x = x;
		this.y = y;
		this.diretion = dir;
	}

	//构造函数2
	public Bullets(int x, int y, boolean good, Direction dir, TankClient tc) {
		this(x, y, dir);
		this.good = good;
		this.tc = tc;
	}

	//控制子弹移动的函数
	private void move() {

		switch (diretion) {
		case L:
			x -= speedX; //向左移动
			break;

		case U:
			y -= speedY;//向上移动
			break;

		case R:
			x += speedX; //向右移动
			break;

		case D:
			y += speedY;//向下移动
			break;

		case STOP://静止不动
			break;
		}

		//如果子弹超过边界，清除此子弹
		if (x < 0 || y < 0 || x > TankClient.Frame_width
				|| y > TankClient.Frame_length) {
			live = false;
		}
	}

	//画出子弹的函数
	public void draw(Graphics g) {
		if (!live) {
			tc.bullets.remove(this);
			return;
		}

		//根据方向选择不同的子弹
		switch (diretion) {
		case L:
			g.drawImage(images.get("L"), x, y, null);
			break;

		case U:
			g.drawImage(images.get("U"), x, y, null);
			break;

		case R:
			g.drawImage(images.get("R"), x, y, null);
			break;

		case D:
			g.drawImage(images.get("D"), x, y, null);
			break;

		}
		//调用子弹move()函数
		move(); 
	}

	//判断是否活着
	public boolean isLive() {
		return live;
	}

	//返回长方形实例
	public Rectangle getRect() {
		return new Rectangle(x, y, width, length);
	}

	//当子弹击中敌方坦克时
	public boolean hitTanks(List<Tank> tanks) {
		for (int i = 0; i < tanks.size(); i++) {
			//对每辆坦克，调用hitTank()
			if (hitTank(tanks.get(i))) {
				return true;
			}
		}
		return false;
	}

	//子弹击中玩家坦克
	public boolean hitTank(Tank t) {
		
		if (this.live && this.getRect().intersects(t.getRect()) && t.isLive()
				&& this.good != t.isGood()) {

			BombTank e = new BombTank(t.getX(), t.getY(), tc);
			tc.bombTanks.add(e);
			if (t.isGood()) {
				//玩家坦克被击中不会立即死亡，而是掉50血
				t.setLife(t.getLife() - 50); 
				if (t.getLife() <= 0)
					t.setLive(false);
			} else {
				t.setLive(false); 
			}
			this.live = false;
			//命中，返回true
			return true;
		}
		//否则返回false
		return false; 
	}

	//子弹击中普通墙CommonWall
	public boolean hitWall(CommonWall w) {
		if (this.live && this.getRect().intersects(w.getRect())) {
			this.live = false;
			//清除该位置的墙
			this.tc.otherWall.remove(w);
			this.tc.homeWall.remove(w);
			return true;
		}
		return false;
	}

	//子弹击中金属墙
	public boolean hitWall(MetalWall w) {
		if (this.live && this.getRect().intersects(w.getRect())) {
			this.live = false;
			return true;
		}
		return false;
	}

	//子弹击中家
	public boolean hitHome() {
		if (this.live && this.getRect().intersects(tc.home.getRect())) {
			this.live = false;
			this.tc.home.setLive(false);
			return true;
		}
		return false;
	}

}
