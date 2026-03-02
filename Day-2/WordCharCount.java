import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class WordCharCount extends JFrame implements ActionListener {

    JTextArea textArea;
    JButton countButton;
    JLabel wordLabel, charLabel;

    WordCharCount() {
        textArea = new JTextArea(5, 30);
        countButton = new JButton("Count");
        wordLabel = new JLabel("Words: 0");
        charLabel = new JLabel("Characters: 0");

            setLayout(new FlowLayout());

            add(new JScrollPane(textArea));
            add(countButton);
            add(wordLabel);
            add(charLabel);

            countButton.addActionListener(this);
        
        setTitle("Word & Character Counter");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {

        String text = textArea.getText();
        int characters = text.length();
        String trimmedText = text.trim();
        int words = 0;

        if (!trimmedText.isEmpty()) {
            words = trimmedText.split("\\s+").length;
        }

        wordLabel.setText("Words: " + words);
        charLabel.setText("Characters: " + characters);
    }

    public static void main(String[] args) {
        new WordCharCount();
    }
}
