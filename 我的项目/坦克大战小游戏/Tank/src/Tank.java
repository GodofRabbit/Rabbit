import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class Tank {
	//速度定义为静态全局变量
	public static int speedX = 6;
	public static int speedY =6;
	
	//坦克数目
	public static int count = 8;
	
	//坦克的大小
	public static final int width = 35;
	public static final int length = 35;
	
	// 初始化状态为静止
	private Direction direction = Direction.STOP; 
	//初始化方向为向上
	private Direction Kdirection = Direction.U; 
	TankClient tc;

	private boolean good;
	private int x, y;
	private int oldX, oldY;
	
	//初始化为活着
	private boolean live = true;
	//初始生命值设置为200
	private int life = 200;
	
	// 产生一个随机数,随机模拟坦克的移动路径,单坦克至少移动5个像素,最多移动14个像素
	private static Random r = new Random();
	private int step = r.nextInt(10)+5;
	
	private boolean bL = false, bU = false, bR = false, bD = false;
	
	private static Toolkit tk = Toolkit.getDefaultToolkit();// 控制面板
	//图片存储，全局静态
	private static Image[] tankImages = null;
	static {
		tankImages = new Image[] {
				tk.getImage(BombTank.class.getResource("Images/tankD.gif")),
				tk.getImage(BombTank.class.getResource("Images/tankU.gif")),
				tk.getImage(BombTank.class.getResource("Images/tankL.gif")),
				tk.getImage(BombTank.class.getResource("Images/tankR.gif")), 
				};
	}

	//Tank的构造函数1
	public Tank(int x, int y, boolean good) {
		this.x = x;
		this.y = y;
		this.oldX = x;
		this.oldY = y;
		this.good = good;
	}

	//Tank的构造函数2
	public Tank(int x, int y, boolean good, Direction dir, TankClient tc) {
		this(x, y, good);
		this.direction = dir;
		this.tc = tc;
	}

	//绘制坦克的函数
	public void draw(Graphics g) {
		if (!live) {
			if (!good) {
				tc.tanks.remove(this); // 删除无效的
			}
			return;
		}
		if (good)
			new DrawBlood().draw(g); // 创造一个血包

		switch (Kdirection) {
							//根据方向选择坦克的图片
		case D:
			g.drawImage(tankImages[0], x, y, null);
			break;
		case U:
			g.drawImage(tankImages[1], x, y, null);
			break;
		case L:
			g.drawImage(tankImages[2], x, y, null);
			break;
		case R:
			g.drawImage(tankImages[3], x, y, null);
			break;
		}
		//调用move函数
		move();
	}
	
	//坦克移动的函数
	void move() {

		this.oldX = x;
		this.oldY = y;

		//选择移动方向
		switch (direction) {
		case L:
			x -= speedX;
			break;
		case U:
			y -= speedY;
			break;
		case R:
			x += speedX;
			break;
		case D:
			y += speedY;
			break;
		case STOP:
			break;
		}
		
		if (this.direction != Direction.STOP) {
			this.Kdirection = this.direction;
		}
		
		//为防止移动超出边界，超出则修改坐标
		if (x < 0)
			x = 0;	
		if (y < 40)
			y = 40;
		if (x + Tank.width > TankClient.Frame_width)
			x = TankClient.Frame_width - Tank.width;
		if (y + Tank.length > TankClient.Frame_length)
			y = TankClient.Frame_length - Tank.length;

		if (!good) {
			Direction[] directons = Direction.values();
			if (step == 0) {
				//产生随机路径,5-14
				step = r.nextInt(10) + 5;
				int rn = r.nextInt(directons.length);
				//产生方向
				direction = directons[rn];
			}
			step--;
			
			//产生随机数，控制敌人开火
			if (r.nextInt(40) > 37)
				this.fire();
		}	
	}
	
	private void changToOldDir() {  
		x = oldX;
		y = oldY;
	}

	//接受键盘事件
	public void keyPressed(KeyEvent e) {  
		int key = e.getKeyCode();
		switch (key) {
		case KeyEvent.VK_R: 
			tc.dispose();
			new TankClient();
			break;
		case KeyEvent.VK_D: //监听D键
			bR = true;
			break;
			
		case KeyEvent.VK_A://监听A键
			bL = true;
			break;
		
		case KeyEvent.VK_W:  //监听W键
			bU = true;
			break;
		
		case KeyEvent.VK_S://监听S键
			bD = true;
			break;
		}
		//调用函数确定移动方向
		decideDirection();
	}

	//决定移动方向的函数
	void decideDirection() {
		if (!bL && !bU && bR && !bD) //向右
			direction = Direction.R;

		else if (bL && !bU && !bR && !bD) //向左
			direction = Direction.L;

		else if (!bL && bU && !bR && !bD) //向上
			direction = Direction.U;

		else if (!bL && !bU && !bR && bD) //向下
			direction = Direction.D;

		else if (!bL && !bU && !bR && !bD)
			direction = Direction.STOP;  //保持不动
	}

	//键盘释放监听
	public void keyReleased(KeyEvent e) {  
		int key = e.getKeyCode();
		switch (key) {
		
		case KeyEvent.VK_J:
			fire();
			break;
			
		case KeyEvent.VK_D:
			bR = false;
			break;
		
		case KeyEvent.VK_A:
			bL = false;
			break;
		
		case KeyEvent.VK_W:
			bU = false;
			break;
		
		case KeyEvent.VK_S:
			bD = false;
			break;
		}
		decideDirection();
	}

	//开火
	public Bullets fire() {
		if (!live)
			return null;
		//开火位置
		int x = this.x + Tank.width / 2 - Bullets.width / 2;
		int y = this.y + Tank.length / 2 - Bullets.length / 2;
		//没有给定方向时，向原来的方向开火
		Bullets m = new Bullets(x, y + 2, good, Kdirection, this.tc);
		tc.bullets.add(m);                                                
		return m;
	}
	
	//得到坦克区域的函数，用来进行碰撞检测
	public Rectangle getRect() {
		return new Rectangle(x, y, width, length);
	}

	public boolean isLive() {
		return live;
	}

	public void setLive(boolean live) {
		this.live = live;
	}
	
	public boolean isGood() {
		return good;
	}
	
	//碰撞到普通墙时
	public boolean knockAtWall(CommonWall w) {
		//如果坦克存活且与墙相交的情况下
		if (this.live && this.getRect().intersects(w.getRect())) {
			 this.changToOldDir();
			return true;
		}
		return false;
	}
	
	//撞到金属墙
	public boolean knockAtWall(MetalWall w) {
		if (this.live && this.getRect().intersects(w.getRect())) {
			this.changToOldDir();     
			return true;
		}
		return false;
	}
	
	//撞到家的时候
	public boolean knockAtHome(Home h) {
		if (this.live && this.getRect().intersects(h.getRect())) {
			this.changToOldDir();
			return true;
		}
		return false;
	}

	//撞到坦克时
	public boolean knockAtTanks(java.util.List<Tank> tanks) {
		for (int i = 0; i < tanks.size(); i++) {
			Tank t = tanks.get(i);
			if (this != t) {
				if (this.live && t.isLive()
						&& this.getRect().intersects(t.getRect())) {
					this.changToOldDir();
					t.changToOldDir();
					return true;
				}
			}
		}
		return false;
	}


	public int getLife() {
		return life;
	}

	public void setLife(int life) {
		this.life = life;
	}

	//画出显示玩家坦克的血条
	private class DrawBlood {
		public void draw(Graphics g) {
			Color c = g.getColor();
			g.setColor(Color.RED);
			g.drawRect(382, 585, width, 10);
			int w = width * life / 200;
			g.fillRect(382, 585, w, 10);
			g.setColor(c);
		}
	}

	//玩家吃掉心补血的函数
	public boolean eat(GetBlood b) {
		if (this.live && b.isLive() && this.getRect().intersects(b.getRect())) {
			if(this.life<=100)
				//吃掉心增加100生命点
				this.life = this.life+100;
			else
				this.life = 200;
			b.setLive(false);
			return true;
		}
		return false;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}
	
	public void clear() {
		this.live = false;
	}
}