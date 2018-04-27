import java.util.ArrayList;
import java.awt.*;
import java.awt.event.*;
import java.util.List;

import javax.swing.JOptionPane;

public class TankClient extends Frame implements ActionListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// ��̬ȫ�ִ��ڴ�С
	public static final int Frame_width = 800; 
	public static final int Frame_length = 600;
	
	//�����Ƿ������ʾ
	public static boolean printable = true;
	MenuBar jmb = null;
	Menu jm1 = null, jm2 = null, jm3 = null, jm4 = null, jm5 = null;
	MenuItem jmi1 = null, jmi2 = null, jmi3 = null, jmi4 = null, jmi5 = null,
			jmi6 = null, jmi7 = null, jmi8 = null, jmi9 = null, jmi10 = null,
			jmi11 = null;
	Image screenImage = null;
	
	//ʵ�������̹��
	Tank homeTank = new Tank(310, 560, true, Direction.STOP, this);
	//ʵ����Ѫ��
	GetBlood blood = new GetBlood();
	//ʵ������
	Home home = new Home(373, 543, this);
	
	List<Tank> tanks = new ArrayList<Tank>();
	List<BombTank> bombTanks = new ArrayList<BombTank>();
	List<Bullets> bullets = new ArrayList<Bullets>();
	List<Tree> trees = new ArrayList<Tree>();
	List<CommonWall> homeWall = new ArrayList<CommonWall>();
	List<CommonWall> otherWall = new ArrayList<CommonWall>();
	List<MetalWall> metalWall = new ArrayList<MetalWall>();

	//���½��溯��
	public void update(Graphics g) {

		screenImage = this.createImage(Frame_width, Frame_length);

		Graphics gps = screenImage.getGraphics();
		Color c = gps.getColor();
		gps.setColor(Color.BLACK);
		gps.fillRect(0, 0, Frame_width, Frame_length);
		gps.setColor(c);
		framPaint(gps);
		g.drawImage(screenImage, 0, 0, null);
	}

	//���ƺ���
	public void framPaint(Graphics g) {

		Color c = g.getColor();
		g.setColor(Color.green); // ����������ʾ����

		Font f1 = g.getFont();
		g.setFont(new Font("TimesRoman", Font.BOLD, 20));
		g.drawString("���ϻ��ез�̹��: ", 100, 70);
		g.setFont(new Font("TimesRoman", Font.BOLD, 30));
		g.drawString("" + tanks.size(), 300, 70);
		
		g.setFont(new Font("TimesRoman", Font.BOLD, 20));
		g.drawString("ʣ��Ѫ��: ", 500, 70);
		g.setFont(new Font("TimesRoman", Font.BOLD, 30));
		g.drawString("" + homeTank.getLife(), 650, 70);
		g.setFont(f1);

		//����home
		home.draw(g);
		//�������̹��
		homeTank.draw(g);
		//���̹�˳��Ĳ�Ѫ
		homeTank.eat(blood);
		
		//�ӵ����ͼ������Ԫ�ؽӴ�ʱ�Ĳ���
		for (int i = 0; i < bullets.size(); i++) {
			Bullets m = bullets.get(i);
			//���ез�̹��
			m.hitTanks(tanks);
			//�����ҷ�̹��
			m.hitTank(homeTank);
			//���м�
			m.hitHome();

			//���н���ǽ
			for (int j = 0; j < metalWall.size(); j++) { 
				MetalWall mw = metalWall.get(j);
				m.hitWall(mw);
			}

			//��������ǽ
			for (int j = 0; j < otherWall.size(); j++) {
				CommonWall w = otherWall.get(j);
				m.hitWall(w);
			}

			//����Χ�Ƽҵ�ǽ
			for (int j = 0; j < homeWall.size(); j++) {
				CommonWall cw = homeWall.get(j);
				m.hitWall(cw);
			}
			//����Ч��
			m.draw(g);
		}

		//�з�̹�����ͼԪ����ײʱ�Ĳ���
		for (int i = 0; i < tanks.size(); i++) {
			Tank t = tanks.get(i);

			//�з�̹��ײ��Χ�Ƽҵ�ǽ
			for (int j = 0; j < homeWall.size(); j++) {
				CommonWall cw = homeWall.get(j);
				t.knockAtWall(cw);
				cw.draw(g);
			}
			
			//�з�̹��ײ������ǽ
			for (int j = 0; j < metalWall.size(); j++) {
				MetalWall mw = metalWall.get(j);
				t.knockAtWall(mw);
				mw.draw(g);
			}
			
			//�з�̹��ײ������ǽ
			for (int j = 0; j < otherWall.size(); j++) {
				CommonWall cw = otherWall.get(j);
				t.knockAtWall(cw);
				cw.draw(g);
			}

			//ײ��ͬ��Ӫ̹��
			t.knockAtTanks(tanks);
			t.knockAtHome(home);

			t.draw(g);
		}

		blood.draw(g);

		//������ըЧ��
		for (int i = 0; i < bombTanks.size(); i++) {
			BombTank bt = bombTanks.get(i);
			bt.draw(g);
		}
		
		//��������
		for (int i = 0; i < trees.size(); i++) {
			Tree tr = trees.get(i);
			tr.draw(g);
		}

		//��������ǽ
		for (int i = 0; i < otherWall.size(); i++) {
			CommonWall cw = otherWall.get(i);
			cw.draw(g);
		}

		//��������ǽ
		for (int i = 0; i < metalWall.size(); i++) {
			MetalWall mw = metalWall.get(i);
			mw.draw(g);
		}

		homeTank.knockAtTanks(tanks);
		homeTank.knockAtHome(home);

		//���̹��ײ������ǽ
		for (int i = 0; i < metalWall.size(); i++) {
			MetalWall w = metalWall.get(i);
			homeTank.knockAtWall(w);
			w.draw(g);
		}

		//���̹��ײ������ǽ
		for (int i = 0; i < otherWall.size(); i++) {
			CommonWall cw = otherWall.get(i);
			homeTank.knockAtWall(cw);
			cw.draw(g);
		}

		//���̹��ײ����
		for (int i = 0; i < homeWall.size(); i++) {
			CommonWall w = homeWall.get(i);
			homeTank.knockAtWall(w);
			w.draw(g);
		}
		
		//���з�̹��ȫ���ҷ��Һ��ҷ�̹�˻��ڣ�����һ�ʤ
		if (tanks.size() == 0 && home.isLive() && homeTank.isLive()) {
				Font f = g.getFont();
				g.setFont(new Font("TimesRoman", Font.BOLD, 60)); //�ж��Ƿ�Ӯ�ñ���
				this.otherWall.clear();
				this.metalWall.clear();
				this.trees.clear();
				this.bullets.clear();
				g.drawString("��Ӯ��!", 310, 300);
				g.setFont(f);
			}
				
		if (homeTank.isLive() == false) {
			Font f = g.getFont();
				g.setFont(new Font("TimesRoman", Font.BOLD, 40));
				g.drawString("�����ˣ�", 220, 250);
				g.drawString(" ��Ϸ������ ", 220, 300);
				g.setFont(f);
				tanks.clear();
				bullets.clear();
				trees.clear();
				homeWall.clear();
				metalWall.clear();
				otherWall.clear();
				home.clear();
				}
			g.setColor(c);
	}

	public TankClient() {
		
		// printable = false;
		// �����˵����˵�ѡ��
		jmb = new MenuBar();
		jm1 = new Menu("��Ϸ");
		jm2 = new Menu("��ͣ/����");
		jm3 = new Menu("����");
		jm4 = new Menu("��Ϸ����");
		jm5 = new Menu("��ͼ");
		jm1.setFont(new Font("TimesRoman", Font.BOLD, 15));// ���ò˵���ʾ������
		jm2.setFont(new Font("TimesRoman", Font.BOLD, 15));// ���ò˵���ʾ������
		jm3.setFont(new Font("TimesRoman", Font.BOLD, 15));// ���ò˵���ʾ������
		jm4.setFont(new Font("TimesRoman", Font.BOLD, 15));// ���ò˵���ʾ������
		jm5.setFont(new Font("TimesRoman", Font.BOLD, 15));// ���ò˵���ʾ������
		

		jmi1 = new MenuItem("��ʼ����Ϸ");
		jmi2 = new MenuItem("�˳�");
		jmi3 = new MenuItem("��ͣ");
		jmi4 = new MenuItem("����");
		jmi5 = new MenuItem("��Ϸ˵��");
		jmi6 = new MenuItem("����1");
		jmi7 = new MenuItem("����2");
		jmi8 = new MenuItem("����3");
		jmi9 = new MenuItem("����4");
		jmi10 = new MenuItem("��ͼ1");
		jmi11 = new MenuItem("��ͼ2");
		
		jmi1.setFont(new Font("TimesRoman", Font.BOLD, 15));
		jmi2.setFont(new Font("TimesRoman", Font.BOLD, 15));
		jmi3.setFont(new Font("TimesRoman", Font.BOLD, 15));
		jmi4.setFont(new Font("TimesRoman", Font.BOLD, 15));
		jmi5.setFont(new Font("TimesRoman", Font.BOLD, 15));
		jmi10.setFont(new Font("TimesRoman", Font.BOLD, 15));
		jmi11.setFont(new Font("TimesRoman", Font.BOLD, 15));

		jm1.add(jmi1);
		jm1.add(jmi2);
		jm2.add(jmi3);
		jm2.add(jmi4);
		jm3.add(jmi5);
		jm4.add(jmi6);
		jm4.add(jmi7);
		jm4.add(jmi8);
		jm4.add(jmi9);
		jm5.add(jmi10);
		jm5.add(jmi11);

		jmb.add(jm1);
		jmb.add(jm2);
		jmb.add(jm4);
		jmb.add(jm3);
		jmb.add(jm5);
		
		jmi1.addActionListener(this);
		jmi1.setActionCommand("NewGame");
		jmi2.addActionListener(this);
		jmi2.setActionCommand("Exit");
		
		jmi3.addActionListener(this);
		jmi3.setActionCommand("Stop");
		jmi4.addActionListener(this);
		jmi4.setActionCommand("Continue");
		
		jmi5.addActionListener(this);
		jmi5.setActionCommand("help");
		jmi6.addActionListener(this);
		jmi6.setActionCommand("level1");
		jmi7.addActionListener(this);
		jmi7.setActionCommand("level2");
		jmi8.addActionListener(this);
		jmi8.setActionCommand("level3");
		jmi9.addActionListener(this);
		jmi9.setActionCommand("level4");
		
		jmi10.addActionListener(this);
		jmi10.setActionCommand("map1");
		jmi11.addActionListener(this);
		jmi11.setActionCommand("map2");
		
		this.setMenuBar(jmb);
		
		//���ý����С
		this.setSize(Frame_width, Frame_length);
		//���ý���ĳ���λ��
		this.setLocation(280, 50);
		this.setTitle("Java̹�˴�ս");
		
		this.setResizable(false);
		this.setBackground(Color.GRAY);
		this.setVisible(true);
		
		//Ĭ�ϻ��Ƶ�ͼ1
		drawMap1();
		//drawMap2();
		
		//���ڼ����ر�
		this.addWindowListener(new WindowAdapter() {
					public void windowClosing(WindowEvent e) {
						System.exit(0);
					}
				});
		
		//���̼���
		this.addKeyListener(new KeyMonitor());
		//�����߳�
		new Thread(new PaintThread()).start();
	}
	
	public static void main(String[] args) {
		new TankClient();
	}
	
	//������ͼ1�ĺ���
	public void drawMap1() {
		
		//����Χ��ǽ
		for (int i = 0; i < 12; i++) {
			if (i < 4)
				homeWall.add(new CommonWall(360, 580 - 20 * i, this));
			else if (i < 8)
				homeWall.add(new CommonWall(360 + 20 * (i - 4), 520, this));
			else
				homeWall.add(new CommonWall(420, 540 + (i - 8) * 20, this));
		}
		
		//����ͨǽ
		for(int i = 0; i < 10; i++) {
			otherWall.add(new CommonWall(340, 80 + 20 * i, this));
			otherWall.add(new CommonWall(360, 80 + 20 * i, this));
			otherWall.add(new CommonWall(420, 80 + 20 * i, this));
			otherWall.add(new CommonWall(440, 80 + 20 * i, this));
		}
		for(int i = 0; i < 12; i++) {
			otherWall.add(new CommonWall(260, 80 + 20 * i, this));
			otherWall.add(new CommonWall(280, 80 + 20 * i, this));
			
			otherWall.add(new CommonWall(500, 80 + 20 * i, this));
			otherWall.add(new CommonWall(520, 80 + 20 * i, this));
			
			otherWall.add(new CommonWall(180, 80 + 20 * i, this));
			otherWall.add(new CommonWall(200, 80 + 20 * i, this));
			
			otherWall.add(new CommonWall(580, 80 + 20 * i, this));
			otherWall.add(new CommonWall(600, 80 + 20 * i, this));
			
			otherWall.add(new CommonWall(100, 80 + 20 * i, this));
			otherWall.add(new CommonWall(120, 80 + 20 * i, this));
			
			otherWall.add(new CommonWall(660, 80 + 20 * i, this));
			otherWall.add(new CommonWall(680, 80 + 20 * i, this));
		}
		for(int i = 0; i < 4; i++) {
			otherWall.add(new CommonWall(340, 400 + 20 * i, this));
			otherWall.add(new CommonWall(360, 400 + 20 * i, this));
			otherWall.add(new CommonWall(420, 400 + 20 * i, this));
			otherWall.add(new CommonWall(440, 400 + 20 * i, this));
		}
		for(int i = 0; i < 2; i++) {
			otherWall.add(new CommonWall(340 + 20 * i, 320, this));
			otherWall.add(new CommonWall(340 + 20 * i, 340, this));
			otherWall.add(new CommonWall(420 + 20 * i, 320, this));
			otherWall.add(new CommonWall(420 + 20 * i, 340, this));
		}
		for(int i = 0; i < 10; i++) {
			otherWall.add(new CommonWall(140 + 20 * i, 360, this));
			otherWall.add(new CommonWall(140 + 20 * i, 380, this));
			otherWall.add(new CommonWall(460 + 20 * i, 360, this));
			otherWall.add(new CommonWall(460 + 20 * i, 380, this));
		}
		for(int i = 0; i < 6; i++) {
			otherWall.add(new CommonWall(100, 440 + 20 * i, this));
			otherWall.add(new CommonWall(120, 440 + 20 * i, this));
			
			otherWall.add(new CommonWall(180, 440 + 20 * i, this));
			otherWall.add(new CommonWall(200, 440 + 20 * i, this));
			
			otherWall.add(new CommonWall(260, 440 + 20 * i, this));
			otherWall.add(new CommonWall(280, 440 + 20 * i, this));
			
			otherWall.add(new CommonWall(500, 440 + 20 * i, this));
			otherWall.add(new CommonWall(520, 440 + 20 * i, this));
			
			otherWall.add(new CommonWall(580, 440 + 20 * i, this));
			otherWall.add(new CommonWall(600, 440 + 20 * i, this));
			
			otherWall.add(new CommonWall(660, 440 + 20 * i, this));
			otherWall.add(new CommonWall(680, 440 + 20 * i, this));
		}
		for(int i = 0; i < 7; i++) {
			otherWall.add(new CommonWall(0, 120 + 20 * i, this));
			otherWall.add(new CommonWall(20, 120 + 20 * i, this));
			otherWall.add(new CommonWall(780, 120 + 20 * i, this));
			otherWall.add(new CommonWall(760, 120 + 20 * i, this));
		}
		
		//������ǽ
		metalWall.add(new MetalWall(380, 200, this));
		metalWall.add(new MetalWall(0, 340, this));
		metalWall.add(new MetalWall(760, 340, this));
		metalWall.add(new MetalWall(380, 420, this));
		
		//����
		for(int i = 0; i < 2; i++) {
			trees.add(new Tree(40 * i, 300, this));
			trees.add(new Tree(40 * i, 380, this));
			trees.add(new Tree(720 + 40 * i, 300, this));
			trees.add(new Tree(720 + 40 * i, 380, this));
		}
		trees.add(new Tree(40, 340, this));
		trees.add(new Tree(720, 340, this));

		//��̹��
		for(int i = 0; i < Tank.count; i++) {
			tanks.add(new Tank(60 + 80 * i, 40, false, Direction.D, this));
		}
	}
	
	//������ͼ2�ĺ���
	public void drawMap2() {
		
		//Χ�Ƽҵ�ǽ
		for (int i = 0; i < 12; i++) {
			if (i < 4)
				homeWall.add(new CommonWall(360, 580 - 20 * i, this));
			else if (i < 8)
				homeWall.add(new CommonWall(360 + 20 * (i - 4), 520, this));
			else
				homeWall.add(new CommonWall(420, 540 + (i - 8) * 20, this));
		}
		
		//������
		for(int i = 0; i < 6; i++) {
			trees.add(new Tree(280 + 40 * i, 320, this));
		}
		for(int i = 0; i < 6; i++) {
			trees.add(new Tree(280 + 40 * i, 400, this));
		}
		for(int i = 0; i < 6; i++) {
			trees.add(new Tree(380, 40 * i, this));
		}
		for(int i = 0; i < 6; i++) {
			trees.add(new Tree(0, 160 + 40 * i, this));
			trees.add(new Tree(760, 160 + 40 * i, this));
		}
		
		//����ͨǽ
		for(int i = 0; i < 2; i++) {
			otherWall.add(new CommonWall(240 + 20 * i, 160, this));
			otherWall.add(new CommonWall(240 + 20 * i, 180, this));
			otherWall.add(new CommonWall(520 + 20 * i, 160, this));
			otherWall.add(new CommonWall(520 + 20 * i, 180, this));
			
			otherWall.add(new CommonWall(280 + 20 * i, 200, this));
			otherWall.add(new CommonWall(280 + 20 * i, 220, this));
			otherWall.add(new CommonWall(480 + 20 * i, 200, this));
			otherWall.add(new CommonWall(480 + 20 * i, 220, this));
			
			otherWall.add(new CommonWall(320 + 20 * i, 240, this));
			otherWall.add(new CommonWall(320 + 20 * i, 260, this));
			otherWall.add(new CommonWall(440 + 20 * i, 240, this));
			otherWall.add(new CommonWall(440 + 20 * i, 260, this));
			
			otherWall.add(new CommonWall(280 + 20 * i, 280, this));
			otherWall.add(new CommonWall(280 + 20 * i, 300, this));
			otherWall.add(new CommonWall(480 + 20 * i, 280, this));
			otherWall.add(new CommonWall(480 + 20 * i, 300, this));
			
			otherWall.add(new CommonWall(240 + 20 * i, 320, this));
			otherWall.add(new CommonWall(240 + 20 * i, 340, this));
			otherWall.add(new CommonWall(520 + 20 * i, 320, this));
			otherWall.add(new CommonWall(520 + 20 * i, 340, this));
			
			otherWall.add(new CommonWall(240 + 20 * i, 400, this));
			otherWall.add(new CommonWall(240 + 20 * i, 420, this));
			otherWall.add(new CommonWall(520 + 20 * i, 400, this));
			otherWall.add(new CommonWall(520 + 20 * i, 420, this));
			
			otherWall.add(new CommonWall(280 + 20 * i, 440, this));
			otherWall.add(new CommonWall(280 + 20 * i, 460, this));
			otherWall.add(new CommonWall(480 + 20 * i, 440, this));
			otherWall.add(new CommonWall(480 + 20 * i, 460, this));
			
			otherWall.add(new CommonWall(320 + 20 * i, 480, this));
			otherWall.add(new CommonWall(320 + 20 * i, 500, this));
			otherWall.add(new CommonWall(440 + 20 * i, 480, this));
			otherWall.add(new CommonWall(440 + 20 * i, 500, this));
		}
		for(int i = 0; i < 10; i++) {
			otherWall.add(new CommonWall(40 + 20 * i, 160, this));
			otherWall.add(new CommonWall(40 + 20 * i, 180, this));
			otherWall.add(new CommonWall(740 - (20 * i), 160, this));
			otherWall.add(new CommonWall(740 - (20 * i), 180, this));
			
			otherWall.add(new CommonWall(40 + 20 * i, 360, this));
			otherWall.add(new CommonWall(40 + 20 * i, 380, this));
			otherWall.add(new CommonWall(740 - (20 * i), 360, this));
			otherWall.add(new CommonWall(740 - (20 * i), 380, this));
		}
		for(int i = 0; i < 12; i++) {
			otherWall.add(new CommonWall(280 + 20 * i, 360, this));
			otherWall.add(new CommonWall(280 + 20 * i, 380, this));
		}
		
		//������ǽ
		for(int i = 0; i < 2; i++) {
			metalWall.add(new MetalWall(360 + 40 * i, 240, this));
			metalWall.add(new MetalWall(100 + 40 * i, 240, this));
			metalWall.add(new MetalWall(620 + 40 * i, 240, this));
			metalWall.add(new MetalWall(100 + 40 * i, 480, this));
			metalWall.add(new MetalWall(620 + 40 * i, 480, this));
		}
		metalWall.add(new MetalWall(240, 360, this));
		metalWall.add(new MetalWall(520, 360, this));
		
		//����̹��
		for (int i = 0; i < Tank.count; i++) {
			tanks.add(new Tank(120 + 70 * i, 40, false, Direction.D, this));
		}
	}
	
	private class PaintThread implements Runnable {
		public void run() {
			// TODO Auto-generated method stub
			while (printable) {
				repaint();
				//ÿ50�����ػ�һ�ν���
				try {
					Thread.sleep(50);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	}

	private class KeyMonitor extends KeyAdapter {

		//���������ͷ�
		public void keyReleased(KeyEvent e) {
			homeTank.keyReleased(e);
		}

		//�������̰���
		public void keyPressed(KeyEvent e) {
			homeTank.keyPressed(e);
		}
	}

	public void actionPerformed(ActionEvent e) {
		
		if (e.getActionCommand().equals("NewGame")) {
			printable = false;
			Object[] options = { "ȷ��", "ȡ��" };
			int response = JOptionPane.showOptionDialog(this, "ȷ��Ҫ��ʼ����Ϸ?", "",
					JOptionPane.YES_OPTION, JOptionPane.QUESTION_MESSAGE, null,
					options, options[0]);
			if (response == 0) {
				printable = true;
				this.dispose();
				Tank.count = 8;
				new TankClient();
			} else {
				printable = true;
				new Thread(new PaintThread()).start();
				}
		} else if (e.getActionCommand().endsWith("Stop")) {
			printable = false;
		} else if (e.getActionCommand().equals("Continue")) {

			if (!printable) {
				printable = true;
				new Thread(new PaintThread()).start();
			}
		} else if (e.getActionCommand().equals("Exit")) {
			printable = false;
			Object[] options = { "ȷ��", "ȡ��" };
			int response = JOptionPane.showOptionDialog(this, "��ȷ��Ҫ�˳���", "",
					JOptionPane.YES_OPTION, JOptionPane.QUESTION_MESSAGE, null,
					options, options[0]);
			if (response == 0) {
				System.out.println("�˳�");
				System.exit(0);
			} else {
				printable = true;
				new Thread(new PaintThread()).start();
			}

		} else if (e.getActionCommand().equals("help")) {
			printable = false;
			JOptionPane.showMessageDialog(null, "��W A S D�����Ʒ���J�����䣬R�����¿�ʼ��",
					"��ʾ��", JOptionPane.INFORMATION_MESSAGE);
			this.setVisible(true);
			printable = true;
			new Thread(new PaintThread()).start(); 
		} else if (e.getActionCommand().equals("level1")) {
			//Tank.count = 12;
			Tank.speedX = 6;
			Tank.speedY = 6;
			Bullets.speedX = 10;
			Bullets.speedY = 10;
			this.dispose();
			new TankClient();
		} else if (e.getActionCommand().equals("level2")) {
			//Tank.count = 14;
			Tank.speedX = 6;
			Tank.speedY = 6;
			Bullets.speedX = 11;
			Bullets.speedY = 11;
			this.dispose();
			new TankClient();
		} else if (e.getActionCommand().equals("level3")) {
			//Tank.count = 16;
			Tank.speedX = 8;
			Tank.speedY = 8;
			Bullets.speedX = 12;
			Bullets.speedY = 12;
			this.dispose();
			new TankClient();
		} else if (e.getActionCommand().equals("level4")) {
			//Tank.count = 20;
			Tank.speedX = 8;
			Tank.speedY = 8;
			Bullets.speedX = 13;
			Bullets.speedY = 13;
			this.dispose();
			new TankClient();
		} else if(e.getActionCommand().equals("map1")) {
			blood.clear();
			metalWall.clear();
			otherWall.clear();
			homeWall.clear();
			trees.clear();
			bullets.clear();
			tanks.clear();
			Tank.count = 8;
			homeTank = new Tank(310, 560, true, Direction.STOP, this);
			drawMap1();
		} else if(e.getActionCommand().equals("map2")) {
			blood.clear();
			metalWall.clear();
			otherWall.clear();
			homeWall.clear();
			trees.clear();
			bullets.clear();
			tanks.clear();
			Tank.count = 8;
			homeTank = new Tank(310, 560, true, Direction.STOP, this);
			drawMap2();
		}
	}
}
