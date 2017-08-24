/*
    Copyright (C) 2017  Georg Schmidt <gs-develop@gs-sys.de>
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

package de.gs_sys.gpg.gui;

import de.gs_sys.basics.data.InputStreamToString;
import de.gs_sys.basics.file.StringAndFiles;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

/**
 * @author Georg Schmidt
 * @version 1.0 vom 30.04.2017
 */

public class KeyGen extends JFrame {
    private JTextField tf_name = new JTextField();
    private JLabel jLabel1 = new JLabel();
    private JLabel jLabel2 = new JLabel();
    private JTextField tf_mail = new JTextField();
    private JLabel jLabel3 = new JLabel();
    private JTextField tf_password = new JTextField();
    private JLabel jLabel4 = new JLabel();
    private JLabel jLabel5 = new JLabel();
    private JComboBox<String> cb_keysize = new JComboBox<String>();
    private DefaultComboBoxModel<String> cb_keysizeModel = new DefaultComboBoxModel<String>();
    private JButton b_save = new JButton();
    private JButton b_exit = new JButton();
    private JLabel jLabel6 = new JLabel();
    private JTextArea ta_log = new JTextArea("");
    private JScrollPane ta_logScrollPane = new JScrollPane(ta_log);

    public KeyGen() {
        super();
        setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        int frameWidth = 300;
        int frameHeight = 295;
        setSize(frameWidth, frameHeight);
        Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
        int x = (d.width - getSize().width) / 2;
        int y = (d.height - getSize().height) / 2;
        setLocation(x, y);
        setTitle("Generate a GPG Key");
        setResizable(false);
        Container cp = getContentPane();
        cp.setLayout(null);

        tf_name.setBounds(80, 16, 193, 25);
        cp.add(tf_name);
        jLabel1.setBounds(8, 16, 67, 25);
        jLabel1.setText("Name");
        cp.add(jLabel1);
        jLabel2.setBounds(8, 48, 67, 25);
        jLabel2.setText("E-Mail");
        cp.add(jLabel2);
        tf_mail.setBounds(80, 48, 193, 25);
        cp.add(tf_mail);
        jLabel3.setBounds(8, 80, 67, 25);
        jLabel3.setText("Password");
        cp.add(jLabel3);
        tf_password.setBounds(80, 80, 193, 25);
        cp.add(tf_password);
        jLabel4.setBounds(8, 112, 67, 25);
        jLabel4.setText("Key size");
        cp.add(jLabel4);

        jLabel5.setBounds(200, 112, 43, 25);
        jLabel5.setText("bits");
        cp.add(jLabel5);
        cb_keysize.setModel(cb_keysizeModel);
        cb_keysize.setBounds(80, 112, 113, 25);
        cp.add(cb_keysize);
        b_save.setBounds(72, 216, 145, 25);
        b_save.setText("Generate");
        b_save.setMargin(new Insets(2, 2, 2, 2));
        b_save.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                b_save_ActionPerformed(evt);
            }
        });
        cp.add(b_save);
        b_exit.setBounds(224, 216, 49, 25);
        b_exit.setText("Exit");
        b_exit.setMargin(new Insets(2, 2, 2, 2));
        b_exit.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                b_exit_ActionPerformed(evt);
            }
        });
        cp.add(b_exit);
        jLabel6.setBounds(8, 216, 51, 25);
        jLabel6.setText("Ver 1.0");
        cp.add(jLabel6);
        ta_logScrollPane.setBounds(8, 144, 265, 65);
        cp.add(ta_logScrollPane);

        cb_keysize.addItem("1024");
        cb_keysize.addItem("2048");
        cb_keysize.addItem("4096");
        /*
        cb_keysize.addItem("8192");
        cb_keysize.addItem("16384");
        cb_keysize.addItem("32768");
        cb_keysize.addItem("65536");
        */

        setVisible(true);
    } // end of public KeyGen

    public static void main(String[] args) {
        new KeyGen();
    } // end of main

    public void b_save_ActionPerformed(ActionEvent evt) {

        String keysize = cb_keysize.getSelectedItem().toString();

        String name = tf_name.getText();
        if (!name.isEmpty())
            name = "     Name-Real: " + name + "\n";

        String mail = tf_mail.getText();
        if (!mail.isEmpty())
            mail = "     Name-Email: " + mail + "\n";

        String password = tf_password.getText();
        if (!password.isEmpty()) {
            password = "     Passphrase: " + password + "\n";
        } else {
            password = "%no-protection\n%no-ask-passphrase\n";
        }
		
		if (name.isEmpty() && mail.isEmpty()) {
            ta_log.append("Name or Mail must be set! Try again!\n");
            return;
        }

        String config = "%echo Generating a basic OpenPGP key\n" +
                "     Key-Type: RSA\n" +
                "     Key-Length: " + keysize + "\n" +
                "     Subkey-Type: RSA\n" +
                "     Subkey-Length: " + keysize + "\n" +
                "     Preferences: SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed\n" +
                name +
                mail +
                "     Expire-Date: 10y\n" +
                password +
                "     # Do a commit here, so that we can later print \"done\"\n" +
                "     %commit\n" +
                "     %echo done";

        try {
            StringAndFiles.toFile("tmp5456.del", config);

            Process p = Runtime.getRuntime().exec("gpg2 --batch --gen-key tmp5456.del");

            while (p.isAlive()) ;

            if (p.exitValue() == 0)
                ta_log.append("Key for " + tf_name.getText() + " " + tf_mail.getText() + " successfully generated!\n");
            else
                ta_log.append("Key for " + tf_name.getText() + " " + tf_mail.getText() + " failed!\n" + InputStreamToString.toString(p.getErrorStream()) + "\n");


            new File("tmp5456.del").delete();
        } catch (IOException e) {
            e.printStackTrace();
        }
    } // end of b_save_ActionPerformed

    public void b_exit_ActionPerformed(ActionEvent evt) {
        System.exit(0);
    } // end of b_exit_ActionPerformed
} // end of class KeyGen
