import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;

//���ʹ���
public class Tree {
	public static final int width = 30;
	public static final int length = 30;
	int x, y;
	TankClient tc ;
	private static Toolkit tk = Toolkit.getDefaultToolkit();
	private static Image[] treeImages = null;
	static {
		treeImages = new Image[]{
				tk.getImage(CommonWall.class.getResource("Images/tree.gif")),
		};
	}
	
	//Tree�Ĺ��췽��������x��y��tc����
	public Tree(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc;
	}
	
	//�������ĺ���
	public void draw(Graphics g) {
		g.drawImage(treeImages[0],x, y, null);
	}
	
}
