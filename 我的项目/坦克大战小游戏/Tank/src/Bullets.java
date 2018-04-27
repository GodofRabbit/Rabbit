import java.awt.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Bullets {
	
	//�ӵ����ٶȣ�ȫ�־�̬
	public static  int speedX = 10;
	public static  int speedY = 10;

	//�ӵ��Ĵ�С��ȫ�־�̬
	public static final int width = 10;
	public static final int length = 10;

	private int x, y;
	Direction diretion;

	private boolean good;
	private boolean live = true;

	private TankClient tc;

	private static Toolkit tk = Toolkit.getDefaultToolkit();
	private static Image[] bulletImages = null;
	//��ͬ�����Ӧ��ͬ���ӵ�
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

		//��������
		images.put("L", bulletImages[0]); 

		images.put("U", bulletImages[1]);

		images.put("R", bulletImages[2]);

		images.put("D", bulletImages[3]);
	}

	//���캯��1������������ͷ���
	public Bullets(int x, int y, Direction dir) {
		this.x = x;
		this.y = y;
		this.diretion = dir;
	}

	//���캯��2
	public Bullets(int x, int y, boolean good, Direction dir, TankClient tc) {
		this(x, y, dir);
		this.good = good;
		this.tc = tc;
	}

	//�����ӵ��ƶ��ĺ���
	private void move() {

		switch (diretion) {
		case L:
			x -= speedX; //�����ƶ�
			break;

		case U:
			y -= speedY;//�����ƶ�
			break;

		case R:
			x += speedX; //�����ƶ�
			break;

		case D:
			y += speedY;//�����ƶ�
			break;

		case STOP://��ֹ����
			break;
		}

		//����ӵ������߽磬������ӵ�
		if (x < 0 || y < 0 || x > TankClient.Frame_width
				|| y > TankClient.Frame_length) {
			live = false;
		}
	}

	//�����ӵ��ĺ���
	public void draw(Graphics g) {
		if (!live) {
			tc.bullets.remove(this);
			return;
		}

		//���ݷ���ѡ��ͬ���ӵ�
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
		//�����ӵ�move()����
		move(); 
	}

	//�ж��Ƿ����
	public boolean isLive() {
		return live;
	}

	//���س�����ʵ��
	public Rectangle getRect() {
		return new Rectangle(x, y, width, length);
	}

	//���ӵ����ез�̹��ʱ
	public boolean hitTanks(List<Tank> tanks) {
		for (int i = 0; i < tanks.size(); i++) {
			//��ÿ��̹�ˣ�����hitTank()
			if (hitTank(tanks.get(i))) {
				return true;
			}
		}
		return false;
	}

	//�ӵ��������̹��
	public boolean hitTank(Tank t) {
		
		if (this.live && this.getRect().intersects(t.getRect()) && t.isLive()
				&& this.good != t.isGood()) {

			BombTank e = new BombTank(t.getX(), t.getY(), tc);
			tc.bombTanks.add(e);
			if (t.isGood()) {
				//���̹�˱����в����������������ǵ�50Ѫ
				t.setLife(t.getLife() - 50); 
				if (t.getLife() <= 0)
					t.setLive(false);
			} else {
				t.setLive(false); 
			}
			this.live = false;
			//���У�����true
			return true;
		}
		//���򷵻�false
		return false; 
	}

	//�ӵ�������ͨǽCommonWall
	public boolean hitWall(CommonWall w) {
		if (this.live && this.getRect().intersects(w.getRect())) {
			this.live = false;
			//�����λ�õ�ǽ
			this.tc.otherWall.remove(w);
			this.tc.homeWall.remove(w);
			return true;
		}
		return false;
	}

	//�ӵ����н���ǽ
	public boolean hitWall(MetalWall w) {
		if (this.live && this.getRect().intersects(w.getRect())) {
			this.live = false;
			return true;
		}
		return false;
	}

	//�ӵ����м�
	public boolean hitHome() {
		if (this.live && this.getRect().intersects(tc.home.getRect())) {
			this.live = false;
			this.tc.home.setLive(false);
			return true;
		}
		return false;
	}

}
