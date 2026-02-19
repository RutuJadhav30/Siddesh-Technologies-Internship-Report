import java.awt.*;
import java.awt.event.*;

public class MyInfoAWT extends Frame implements ActionListener {

    Button btnA, btnB;
    TextArea textArea;

    MyInfoAWT() {
        setLayout(new FlowLayout());
        btnA = new Button("A");
        btnB = new Button("B");
        textArea = new TextArea(5, 40);
        
        add(btnA);
        add(btnB);
        add(textArea);

        btnA.addActionListener(this);
        btnB.addActionListener(this);

        setTitle("AWT Button Example");
        setSize(400, 300);
        setVisible(true);

        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent we) {
                dispose();
            }
        });
    }

    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == btnA) {
            textArea.setText(
                "Name: Rutuja Jadhav\n" +
                "Course: Msc Computer Science\n" +
                "Roll No: 1272240056\n" +
                "College: MIT World Peace University"
            );
        }

        if (e.getSource() == btnB) {
            textArea.setText(
                "CGPA in Previous Semester: 8.34"
            );
        }
    }

    public static void main(String[] args) {
        new MyInfoAWT();
    }
}
