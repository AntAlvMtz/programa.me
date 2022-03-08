package aid_windows;

//Generated by GuiGenie - Copyright (c) 2004 Mario Awad.
//Home Page http://guigenie.cjb.net - Check often for new versions!
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class fontchangeDialog extends JDialog{
    private JComboBox cmbFuente;
    private JComboBox cmbTamano;
    private JComboBox cmbEstilos;
    private JLabel jcomp4;
    private JLabel jcomp5;
    private JLabel jcomp6;
    private JButton btnAceptar;
    private JButton btnCancelar;
    private int[] respuesta;
    
    public int[] showDialog(){
        this.setVisible(true);
        return respuesta;
    }
    public void terminar(){
        setVisible(false);
        this.dispose();
    }
    public fontchangeDialog(JFrame padre) {
        super(padre,"Cambiar fuente",true);
        //construct preComponents
        String[] cmbFuenteItems = {"Arial", "Consolas", "Couriel New", "Lucida Console", "Tahoma", "Times New Roman", "Verdana"};
        String[] cmbTamanoItems = {"8", "10", "12", "14", "16", "18", "20", "22", "24", "26", "28", "30"};
        String[] cmbEstilosItems = {"Normal", "Negritas", "Cursiva", "Cusiva Negritas"};

        //construct components
        cmbFuente = new JComboBox (cmbFuenteItems);
        cmbTamano = new JComboBox (cmbTamanoItems);
        cmbEstilos = new JComboBox (cmbEstilosItems);
        jcomp4 = new JLabel ("Fuente:");
        jcomp5 = new JLabel ("Tamaño:");
        jcomp6 = new JLabel ("Estilo");
        btnAceptar = new JButton ("Aceptar");
        btnCancelar = new JButton ("Cancelar");
        //Añadir los ActionListener
        btnAceptar.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent arg0){
                respuesta[0] = cmbFuente.getSelectedIndex();
                respuesta[1] = cmbTamano.getSelectedIndex();
                respuesta[2] = cmbEstilos.getSelectedIndex();
            }
        });
        btnCancelar.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                respuesta = null;
            }
        });
        //adjust size and set layout
        this.setPreferredSize (new Dimension (667, 393));
        this.setLayout (null);

        //add components
        this.add (cmbFuente);
        this.add (cmbTamano);
        this.add (cmbEstilos);
        this.add (jcomp4);
        this.add (jcomp5);
        this.add (jcomp6);
        this.add (btnAceptar);
        this.add (btnCancelar);

        //set component bounds (only needed by Absolute Positioning)
        cmbFuente.setBounds (20, 50, 200, 25);
        cmbTamano.setBounds (235, 50, 100, 25);
        cmbEstilos.setBounds (355, 50, 122, 25);
        jcomp4.setBounds (20, 20, 100, 25);
        jcomp5.setBounds (235, 25, 100, 25);
        jcomp6.setBounds (355, 25, 100, 25);
        btnAceptar.setBounds (260, 115, 100, 25);
        btnCancelar.setBounds (375, 115, 100, 25);
        this.setLocationRelativeTo(padre);
    }


    /* public static void main (String[] args) {
        JFrame frame = new JFrame ("MyPanel");
        frame.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add (new MyPanel());
        frame.pack();
        frame.setVisible (true);
    } */
}
