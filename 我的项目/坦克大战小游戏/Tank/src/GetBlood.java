import java.awt.*;
import java.util.Random;

public class GetBlood {
	
	public static final int width = 30;
	public static final int length = 30;

	private int x, y;
	TankClient tc;
	private static Random r = new Random();

	int step = 0; 
	private boolean live = false;

	private static Toolkit tk = Toolkit.getDefaultToolkit();
	private static Image[] bloodImages = null;
	static {
		bloodImages = new Image[] { tk.getImage(CommonWall.class
				.getResource("Images/hp.png")), };
	}

	private int[][] position = { { 745, 66 }, { 700, 560 }, { 80, 320 },
			{ 50, 90 }, { 380, 460 }
			};

	public void draw(Graphics g) {
		if (r.nextInt(100) > 98) {
			this.live = true;
			move();
			//System.out.println("step =" + " " + step);
		}
		if (!live)
			return;
		g.drawImage(bloodImages[0], x, y, null);
	}

	private void move() {
		step++;
		if (step == position.length) {
			step = 0;
		}
		x = position[step][0];
		y = position[step][1];
	}

	public Rectangle getRect() { //���س�����ʵ��
		return new Rectangle(x, y, width, length);
	}

	public boolean isLive() {//�ж��Ƿ񻹻���
		return live;
	}

	public void setLive(boolean live) {  //��������
		this.live = live;
	}

	public void clear() {
		// TODO Auto-generated method stub
		this.live = false;
	}

}
