import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

/**
 * 简单的图形化界面程序
 */
public class TestGUI {
    public static void main(String[] args) {
        final JFrame jFrame = new JFrame("主窗口");
        jFrame.setSize(480, 800);
        jFrame.setBackground(Color.white);
        TextArea ta_desc = new TextArea();
        ta_desc.addKeyListener(new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {
                System.out.println("键盘点击：" + e.getKeyChar());
            }

            @Override
            public void keyPressed(KeyEvent e) {
                System.out.println("键盘按下：" + e.getKeyCode());
            }

            @Override
            public void keyReleased(KeyEvent e) {

            }
        });
        ta_desc.setSize(300, 300);
        ta_desc.setBackground(Color.BLUE);
        jFrame.setLayout(new FlowLayout());
        JPanel panel = new JPanel();
        panel.add(ta_desc);
        JButton button = new JButton();
        button.setText("事件按钮");
        button.setBackground(Color.decode("#1976D2"));
        button.setForeground(Color.white);
        Font font = new Font("华文彩云", Font.BOLD, 38);
        button.setFont(font);
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                final Dialog dialog = new Dialog(jFrame);
                dialog.setTitle(e.getActionCommand());
                dialog.setVisible(true);
                JPanel dialog_panel = new JPanel();
                dialog_panel.setSize(500, 300);
                JLabel label = new JLabel();
                label.setText("简单的标签");
                dialog_panel.add(label);
                dialog.add(dialog_panel);
                dialog.addWindowListener(new WindowListener() {
                    @Override
                    public void windowOpened(WindowEvent e) {

                    }

                    @Override
                    public void windowClosing(WindowEvent e) {
                        dialog.setVisible(false);
                    }

                    @Override
                    public void windowClosed(WindowEvent e) {
                        dialog.setVisible(false);
                    }

                    @Override
                    public void windowIconified(WindowEvent e) {

                    }

                    @Override
                    public void windowDeiconified(WindowEvent e) {

                    }

                    @Override
                    public void windowActivated(WindowEvent e) {
                        System.out.println("窗口在活动状态----");
                    }

                    @Override
                    public void windowDeactivated(WindowEvent e) {
                        System.out.println("----窗口在不活动状态");
                    }
                });
                dialog.setSize(500, 300);
            }
        });
        panel.add(button);
        jFrame.setContentPane(panel);
        jFrame.setResizable(false);
        jFrame.setVisible(true);
        //  关闭窗口
        jFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }

    class RoundButton extends JButton {

    }
}
