import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class Tank {
	//�ٶȶ���Ϊ��̬ȫ�ֱ���
	public static int speedX = 6;
	public static int speedY =6;
	
	//̹����Ŀ
	public static int count = 8;
	
	//̹�˵Ĵ�С
	public static final int width = 35;
	public static final int length = 35;
	
	// ��ʼ��״̬Ϊ��ֹ
	private Direction direction = Direction.STOP; 
	//��ʼ������Ϊ����
	private Direction Kdirection = Direction.U; 
	TankClient tc;

	private boolean good;
	private int x, y;
	private int oldX, oldY;
	
	//��ʼ��Ϊ����
	private boolean live = true;
	//��ʼ����ֵ����Ϊ200
	private int life = 200;
	
	// ����һ�������,���ģ��̹�˵��ƶ�·��,��̹�������ƶ�5������,����ƶ�14������
	private static Random r = new Random();
	private int step = r.nextInt(10)+5;
	
	private boolean bL = false, bU = false, bR = false, bD = false;
	
	private static Toolkit tk = Toolkit.getDefaultToolkit();// �������
	//ͼƬ�洢��ȫ�־�̬
	private static Image[] tankImages = null;
	static {
		tankImages = new Image[] {
				tk.getImage(BombTank.class.getResource("Images/tankD.gif")),
				tk.getImage(BombTank.class.getResource("Images/tankU.gif")),
				tk.getImage(BombTank.class.getResource("Images/tankL.gif")),
				tk.getImage(BombTank.class.getResource("Images/tankR.gif")), 
				};
	}

	//Tank�Ĺ��캯��1
	public Tank(int x, int y, boolean good) {
		this.x = x;
		this.y = y;
		this.oldX = x;
		this.oldY = y;
		this.good = good;
	}

	//Tank�Ĺ��캯��2
	public Tank(int x, int y, boolean good, Direction dir, TankClient tc) {
		this(x, y, good);
		this.direction = dir;
		this.tc = tc;
	}

	//����̹�˵ĺ���
	public void draw(Graphics g) {
		if (!live) {
			if (!good) {
				tc.tanks.remove(this); // ɾ����Ч��
			}
			return;
		}
		if (good)
			new DrawBlood().draw(g); // ����һ��Ѫ��

		switch (Kdirection) {
							//���ݷ���ѡ��̹�˵�ͼƬ
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
		//����move����
		move();
	}
	
	//̹���ƶ��ĺ���
	void move() {

		this.oldX = x;
		this.oldY = y;

		//ѡ���ƶ�����
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
		
		//Ϊ��ֹ�ƶ������߽磬�������޸�����
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
				//�������·��,5-14
				step = r.nextInt(10) + 5;
				int rn = r.nextInt(directons.length);
				//��������
				direction = directons[rn];
			}
			step--;
			
			//��������������Ƶ��˿���
			if (r.nextInt(40) > 37)
				this.fire();
		}	
	}
	
	private void changToOldDir() {  
		x = oldX;
		y = oldY;
	}

	//���ܼ����¼�
	public void keyPressed(KeyEvent e) {  
		int key = e.getKeyCode();
		switch (key) {
		case KeyEvent.VK_R: 
			tc.dispose();
			new TankClient();
			break;
		case KeyEvent.VK_D: //����D��
			bR = true;
			break;
			
		case KeyEvent.VK_A://����A��
			bL = true;
			break;
		
		case KeyEvent.VK_W:  //����W��
			bU = true;
			break;
		
		case KeyEvent.VK_S://����S��
			bD = true;
			break;
		}
		//���ú���ȷ���ƶ�����
		decideDirection();
	}

	//�����ƶ�����ĺ���
	void decideDirection() {
		if (!bL && !bU && bR && !bD) //����
			direction = Direction.R;

		else if (bL && !bU && !bR && !bD) //����
			direction = Direction.L;

		else if (!bL && bU && !bR && !bD) //����
			direction = Direction.U;

		else if (!bL && !bU && !bR && bD) //����
			direction = Direction.D;

		else if (!bL && !bU && !bR && !bD)
			direction = Direction.STOP;  //���ֲ���
	}

	//�����ͷż���
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

	//����
	public Bullets fire() {
		if (!live)
			return null;
		//����λ��
		int x = this.x + Tank.width / 2 - Bullets.width / 2;
		int y = this.y + Tank.length / 2 - Bullets.length / 2;
		//û�и�������ʱ����ԭ���ķ��򿪻�
		Bullets m = new Bullets(x, y + 2, good, Kdirection, this.tc);
		tc.bullets.add(m);                                                
		return m;
	}
	
	//�õ�̹������ĺ���������������ײ���
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
	
	//��ײ����ͨǽʱ
	public boolean knockAtWall(CommonWall w) {
		//���̹�˴������ǽ�ཻ�������
		if (this.live && this.getRect().intersects(w.getRect())) {
			 this.changToOldDir();
			return true;
		}
		return false;
	}
	
	//ײ������ǽ
	public boolean knockAtWall(MetalWall w) {
		if (this.live && this.getRect().intersects(w.getRect())) {
			this.changToOldDir();     
			return true;
		}
		return false;
	}
	
	//ײ���ҵ�ʱ��
	public boolean knockAtHome(Home h) {
		if (this.live && this.getRect().intersects(h.getRect())) {
			this.changToOldDir();
			return true;
		}
		return false;
	}

	//ײ��̹��ʱ
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

	//������ʾ���̹�˵�Ѫ��
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

	//��ҳԵ��Ĳ�Ѫ�ĺ���
	public boolean eat(GetBlood b) {
		if (this.live && b.isLive() && this.getRect().intersects(b.getRect())) {
			if(this.life<=100)
				//�Ե�������100������
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