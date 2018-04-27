import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;

//树和丛林
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
	
	//Tree的构造方法，传递x，y和tc对象
	public Tree(int x, int y, TankClient tc) {
		this.x = x;
		this.y = y;
		this.tc = tc;
	}
	
	//画出树的函数
	public void draw(Graphics g) {
		g.drawImage(treeImages[0],x, y, null);
	}
	
}
