package emulator;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.TextArea;
import java.awt.List;
import java.awt.TextField;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import java.awt.Button;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;
import java.awt.event.ActionEvent;
import javax.swing.JList;
import java.awt.Label;
import java.awt.Color;
import java.awt.SystemColor;
import javax.swing.border.TitledBorder;
import javax.swing.border.BevelBorder;
import javax.swing.border.SoftBevelBorder;
import java.awt.Rectangle;

public class WriteRead{
	public Encode e=new Encode();
	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					WriteRead window = new WriteRead();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	DefaultListModel<String> listModel; 
	boolean flag;
	public WriteRead() {
		initialize();
		listModel = new DefaultListModel<>();
		flag = true;
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		
		frame = new JFrame();
		frame.getContentPane().setBackground(new Color(255, 250, 205));
		frame.getContentPane().setBounds(new Rectangle(5, 5, 5, 5));
		frame.getContentPane().setForeground(Color.BLACK);
		frame.setBounds(100, 100, 967, 725);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBorder(new SoftBevelBorder(BevelBorder.LOWERED, new Color(0, 0, 0), new Color(0, 0, 0), new Color(0, 0, 0), new Color(0, 0, 0)));
		panel.setBackground(new Color(255, 215, 0));
		panel.setToolTipText("");
		panel.setBounds(0, 0, 949, 45);
		frame.getContentPane().add(panel);
		
		JLabel lblEmu = new JLabel("Emu8086");
		lblEmu.setFont(new Font("Comic Sans MS", Font.BOLD, 30));
		panel.add(lblEmu);
		
		TextField textField = new TextField();
		textField.setBackground(new Color(240, 248, 255));
		textField.setFont(new Font("Comic Sans MS", Font.BOLD, 15));
		textField.setBounds(316, 112, 216, 89);
		frame.getContentPane().add(textField);
		
		JList<String> list = new JList<String>();
		list.setBorder(new TitledBorder(new BevelBorder(BevelBorder.LOWERED, new Color(148, 0, 211), new Color(148, 0, 211), new Color(148, 0, 211), new Color(148, 0, 211)), "", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		list.setBackground(new Color(216, 191, 216));
		list.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		list.setBounds(599, 65, 277, 578);
		frame.getContentPane().add(list);
		
		JButton btnNewButton = new JButton("Add instruction");
		btnNewButton.setFont(new Font("Comic Sans MS", Font.BOLD, 15));
		btnNewButton.setBackground(Color.MAGENTA);
		btnNewButton.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
				String str  = textField.getText();
				if(str.equals("")|| str.equalsIgnoreCase("Type Here")){
					textField.setText("Type Here");
				}
				else{
					listModel.addElement(str);
					list.setModel(listModel);
					textField.setText("");
					flag = true;
				}
			}
		});
		btnNewButton.setBounds(316, 217, 216, 37);
		frame.getContentPane().add(btnNewButton);
		JButton btnEmulate = new JButton("Load Data");
		btnEmulate.setFont(new Font("Comic Sans MS", Font.BOLD, 15));
		btnEmulate.setBackground(Color.MAGENTA);
		
		btnEmulate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				int val = list.getModel().getSize();
				PrintWriter writer = null;
				try{
					writer = new PrintWriter("list.txt");
					writer.println(val);//write size of Jlist to file first
					for(int i = 0 ; i < val ; i++){
						writer.println(list.getModel().getElementAt(i));
					}
				}
				catch(Exception e1){
					System.out.println("" + e1);
				}
				finally{
					writer.close();
				}
				
			}
			
		});
		btnEmulate.setBounds(316, 267, 216, 37);
		frame.getContentPane().add(btnEmulate);
		
		Label AX = new Label("AX = \r\n");
		AX.setFont(new Font("Dialog", Font.BOLD, 15));
		AX.setBounds(10, 87, 61, 24);
		frame.getContentPane().add(AX);
		
		Label H = new Label("H\r\n");
		H.setFont(new Font("Dialog", Font.BOLD, 15));
		H.setBounds(113, 51, 19, 24);
		frame.getContentPane().add(H);
		
		Label L = new Label("L\r\n");
		L.setFont(new Font("Dialog", Font.BOLD, 15));
		L.setBounds(199, 51, 19, 24);
		frame.getContentPane().add(L);
		Label BX = new Label("BX = \r\n");
		BX.setFont(new Font("Dialog", Font.BOLD, 15));
		BX.setBounds(10, 132, 61, 24);
		frame.getContentPane().add(BX);
		Label tfAH = new Label("0");
		tfAH.setBackground(new Color(255, 215, 0));
		tfAH.setFont(new Font("Dialog", Font.BOLD, 15));
		tfAH.setBounds(113, 87, 47, 24);
		frame.getContentPane().add(tfAH);
		
		Label tfAL = new Label("0");
		tfAL.setFont(new Font("Dialog", Font.BOLD, 15));
		tfAL.setBackground(new Color(216, 191, 216));
		tfAL.setBounds(199, 87, 48, 24);
		frame.getContentPane().add(tfAL);
		
		Label tfBH = new Label("0");
		tfBH.setBackground(new Color(255, 215, 0));
		tfBH.setFont(new Font("Dialog", Font.BOLD, 15));
		tfBH.setBounds(113, 132, 47, 24);
		frame.getContentPane().add(tfBH);
		
		Label tfBL = new Label("0");
		tfBL.setBackground(new Color(216, 191, 216));
		tfBL.setFont(new Font("Dialog", Font.BOLD, 15));
		tfBL.setBounds(199, 132, 48, 24);
		frame.getContentPane().add(tfBL);
		
		Label CX = new Label("CX = \r\n");
		CX.setFont(new Font("Dialog", Font.BOLD, 15));
		CX.setBounds(10, 177, 61, 24);
		frame.getContentPane().add(CX);
		
		Label tfCH = new Label("0");
		tfCH.setBackground(new Color(255, 215, 0));
		tfCH.setFont(new Font("Dialog", Font.BOLD, 15));
		tfCH.setBounds(113, 177, 47, 24);
		frame.getContentPane().add(tfCH);
		
		Label tfCL = new Label("0");
		tfCL.setBackground(new Color(216, 191, 216));
		tfCL.setFont(new Font("Dialog", Font.BOLD, 15));
		tfCL.setBounds(199, 177, 48, 24);
		frame.getContentPane().add(tfCL);
		
		Label DX = new Label("DX = \r\n");
		DX.setFont(new Font("Dialog", Font.BOLD, 15));
		DX.setBounds(10, 222, 61, 24);
		frame.getContentPane().add(DX);
		
		Label CS = new Label("CS = \r\n");
		CS.setFont(new Font("Dialog", Font.BOLD, 15));
		CS.setBounds(10, 267, 61, 24);
		frame.getContentPane().add(CS);
		
		Label IP = new Label("IP = \r\n");
		IP.setFont(new Font("Dialog", Font.BOLD, 15));
		IP.setBounds(10, 312, 61, 24);
		frame.getContentPane().add(IP);
		
		Label SS = new Label("SS = \r\n");
		SS.setFont(new Font("Dialog", Font.BOLD, 15));
		SS.setBounds(10, 357, 61, 24);
		frame.getContentPane().add(SS);
		
		Label SP = new Label("SP = \r\n");
		SP.setFont(new Font("Dialog", Font.BOLD, 15));
		SP.setBounds(10, 402, 61, 24);
		frame.getContentPane().add(SP);
		
		Label BP = new Label("BP = \r\n");
		BP.setFont(new Font("Dialog", Font.BOLD, 15));
		BP.setBounds(10, 447, 61, 24);
		frame.getContentPane().add(BP);
		
		Label SI = new Label("SI = \r\n");
		SI.setFont(new Font("Dialog", Font.BOLD, 15));
		SI.setBounds(10, 492, 61, 24);
		frame.getContentPane().add(SI);
		
		Label DI = new Label("DI = \r\n");
		DI.setFont(new Font("Dialog", Font.BOLD, 15));
		DI.setBounds(10, 537, 61, 24);
		frame.getContentPane().add(DI);
		
		Label DS = new Label("DS = \r\n");
		DS.setFont(new Font("Dialog", Font.BOLD, 15));
		DS.setBounds(10, 582, 61, 24);
		frame.getContentPane().add(DS);
		
		Label ES = new Label("ES = \r\n");
		ES.setFont(new Font("Dialog", Font.BOLD, 15));
		ES.setBounds(10, 627, 61, 24);
		frame.getContentPane().add(ES);
		
		Label tfDH = new Label("0");
		tfDH.setBackground(new Color(255, 215, 0));
		tfDH.setFont(new Font("Dialog", Font.BOLD, 15));
		tfDH.setBounds(113, 222, 47, 24);
		frame.getContentPane().add(tfDH);
		
		Label tfDL = new Label("0");
		tfDL.setBackground(new Color(216, 191, 216));
		tfDL.setFont(new Font("Dialog", Font.BOLD, 15));
		tfDL.setBounds(199, 222, 47, 24);
		frame.getContentPane().add(tfDL);
		
		Label tfCS = new Label("0");
		tfCS.setBackground(new Color(240, 248, 255));
		tfCS.setAlignment(Label.CENTER);
		tfCS.setFont(new Font("Dialog", Font.BOLD, 15));
		tfCS.setBounds(156, 267, 47, 24);
		frame.getContentPane().add(tfCS);
		
		Label tfIP = new Label("0");
		tfIP.setBackground(new Color(240, 248, 255));
		tfIP.setAlignment(Label.CENTER);
		tfIP.setFont(new Font("Dialog", Font.BOLD, 15));
		tfIP.setBounds(156, 312, 47, 24);
		frame.getContentPane().add(tfIP);
		
		Label tfSS = new Label("0");
		tfSS.setBackground(new Color(240, 248, 255));
		tfSS.setAlignment(Label.CENTER);
		tfSS.setFont(new Font("Dialog", Font.BOLD, 15));
		tfSS.setBounds(156, 357, 47, 24);
		frame.getContentPane().add(tfSS);
		
		Label tfSP = new Label("0");
		tfSP.setAlignment(Label.CENTER);
		tfSP.setFont(new Font("Dialog", Font.BOLD, 15));
		tfSP.setBackground(new Color(240, 248, 255));
		tfSP.setBounds(156, 402, 47, 24);
		frame.getContentPane().add(tfSP);
		
		Label tfBP = new Label("0");
		tfBP.setAlignment(Label.CENTER);
		tfBP.setFont(new Font("Dialog", Font.BOLD, 15));
		tfBP.setBackground(new Color(240, 248, 255));
		tfBP.setBounds(156, 447, 47, 24);
		frame.getContentPane().add(tfBP);
		
		Label tfSI = new Label("0");
		tfSI.setAlignment(Label.CENTER);
		tfSI.setFont(new Font("Dialog", Font.BOLD, 15));
		tfSI.setBackground(new Color(240, 248, 255));
		tfSI.setBounds(156, 492, 47, 24);
		frame.getContentPane().add(tfSI);
		
		Label tfDI = new Label("0");
		tfDI.setAlignment(Label.CENTER);
		tfDI.setFont(new Font("Dialog", Font.BOLD, 15));
		tfDI.setBackground(new Color(240, 248, 255));
		tfDI.setBounds(156, 537, 47, 24);
		frame.getContentPane().add(tfDI);
		
		Label tfDS = new Label("0");
		tfDS.setAlignment(Label.CENTER);
		tfDS.setFont(new Font("Dialog", Font.BOLD, 15));
		tfDS.setBackground(new Color(240, 248, 255));
		tfDS.setBounds(156, 582, 47, 24);
		frame.getContentPane().add(tfDS);
		
		Label tfES = new Label("0");
		tfES.setAlignment(Label.CENTER);
		tfES.setFont(new Font("Dialog", Font.BOLD, 15));
		tfES.setBackground(new Color(240, 248, 255));
		tfES.setBounds(156, 627, 47, 24);
		frame.getContentPane().add(tfES);
		
		Label CF = new Label("CF \r\n");
		CF.setFont(new Font("Dialog", Font.BOLD, 15));
		CF.setBounds(274, 492, 26, 24);
		frame.getContentPane().add(CF);
		
		Label ZF = new Label("ZF\r\n");
		ZF.setFont(new Font("Dialog", Font.BOLD, 15));
		ZF.setBounds(306, 492, 26, 24);
		frame.getContentPane().add(ZF);
		
		Label SF = new Label("SF");
		SF.setFont(new Font("Dialog", Font.BOLD, 15));
		SF.setBounds(338, 492, 26, 24);
		frame.getContentPane().add(SF);
		
		Label OF = new Label("OF");
		OF.setFont(new Font("Dialog", Font.BOLD, 15));
		OF.setBounds(369, 492, 26, 24);
		frame.getContentPane().add(OF);
		
		Label PF = new Label("PF");
		PF.setFont(new Font("Dialog", Font.BOLD, 15));
		PF.setBounds(401, 492, 26, 24);
		frame.getContentPane().add(PF);
		
		Label AF = new Label("AF");
		AF.setFont(new Font("Dialog", Font.BOLD, 15));
		AF.setBounds(433, 492, 26, 24);
		frame.getContentPane().add(AF);
		
		Label IF = new Label("IF");
		IF.setFont(new Font("Dialog", Font.BOLD, 15));
		IF.setBounds(467, 492, 26, 24);
		frame.getContentPane().add(IF);
		
		Label DF = new Label("DF");
		DF.setFont(new Font("Dialog", Font.BOLD, 15));
		DF.setBounds(499, 492, 26, 24);
		frame.getContentPane().add(DF);
		
		Label tfCF = new Label("0");
		tfCF.setBackground(new Color(123, 104, 238));
		tfCF.setAlignment(Label.CENTER);
		tfCF.setBounds(274, 516, 26, 24);
		frame.getContentPane().add(tfCF);
		
		Label tfZF = new Label("0");
		tfZF.setBackground(new Color(123, 104, 238));
		tfZF.setAlignment(Label.CENTER);
		tfZF.setBounds(306, 516, 26, 24);
		frame.getContentPane().add(tfZF);
		
		Label tfSF = new Label("0");
		tfSF.setBackground(new Color(123, 104, 238));
		tfSF.setAlignment(Label.CENTER);
		tfSF.setBounds(338, 516, 26, 24);
		frame.getContentPane().add(tfSF);
		
		Label tfOF = new Label("0");
		tfOF.setBackground(new Color(123, 104, 238));
		tfOF.setAlignment(Label.CENTER);
		tfOF.setBounds(369, 516, 26, 24);
		frame.getContentPane().add(tfOF);
		
		Label tfPF = new Label("0");
		tfPF.setBackground(new Color(123, 104, 238));
		tfPF.setAlignment(Label.CENTER);
		tfPF.setBounds(401, 516, 26, 24);
		frame.getContentPane().add(tfPF);
		
		Label tfAF = new Label("0");
		tfAF.setBackground(new Color(123, 104, 238));
		tfAF.setAlignment(Label.CENTER);
		tfAF.setBounds(433, 516, 26, 24);
		frame.getContentPane().add(tfAF);
		
		Label tfIF = new Label("0");
		tfIF.setBackground(new Color(123, 104, 238));
		tfIF.setAlignment(Label.CENTER);
		tfIF.setBounds(467, 516, 26, 24);
		frame.getContentPane().add(tfIF);
		
		Label tfDF = new Label("0");
		tfDF.setBackground(new Color(123, 104, 238));
		tfDF.setAlignment(Label.CENTER);
		tfDF.setBounds(499, 516, 26, 24);
		frame.getContentPane().add(tfDF);
	
		
		JButton btnRemove = new JButton("Emulate");
		btnRemove.setFont(new Font("Comic Sans MS", Font.BOLD, 15));
		btnRemove.setBackground(Color.MAGENTA);
		btnRemove.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e1) {
				listModel.removeAllElements();
				list.setModel(listModel);
				e.initial_in();
				byte[] data = {-1,-2,-3,-4,-5,-89,-98,123,4};
				int addr = (e.myState.getCS()<< 4 + e.myState.getIP());
				e.mem.loadData(addr, data);
				e.read();
				tfAH.setText(String.valueOf(e.myState.wordToHex(e.myState.getAH())));
				tfAL.setText(String.valueOf(e.myState.wordToHex(e.myState.getAL())));
				tfBH.setText(String.valueOf(e.myState.wordToHex(e.myState.getBH())));
				tfBL.setText(String.valueOf(e.myState.wordToHex(e.myState.getBL())));
				tfCH.setText(String.valueOf(e.myState.wordToHex(e.myState.getCH())));
				tfCL.setText(String.valueOf(e.myState.wordToHex(e.myState.getCL())));
				tfDH.setText(String.valueOf(e.myState.wordToHex(e.myState.getDH())));
				tfDL.setText(String.valueOf(e.myState.wordToHex(e.myState.getDL())));
				tfCS.setText(String.valueOf(e.myState.wordToHex(e.myState.getCS())));
				tfIP.setText(String.valueOf(e.myState.wordToHex(e.myState.getIP())));
				tfSS.setText(String.valueOf(e.myState.wordToHex(e.myState.getSS())));
				tfSP.setText(String.valueOf(e.myState.wordToHex(e.myState.getSP())));
				tfBP.setText(String.valueOf(e.myState.wordToHex(e.myState.getBP())));
				tfSI.setText(String.valueOf(e.myState.wordToHex(e.myState.getSI())));
				tfDI.setText(String.valueOf(e.myState.wordToHex(e.myState.getDI())));
				tfDS.setText(String.valueOf(e.myState.wordToHex(e.myState.getDS())));
				tfES.setText(String.valueOf(e.myState.wordToHex(e.myState.getES())));
				
				if(e.getSs1().equals("ADC") || e.myState.getCF())
					tfCF.setText(String.valueOf(1)); 
				else
					tfCF.setText(String.valueOf(0));
				if(e.myState.getZF())
					tfZF.setText(String.valueOf(1));
				else 
					tfZF.setText(String.valueOf(0));
				if(e.myState.getSF())
					tfSF.setText(String.valueOf(1));
				else 
					tfSF.setText(String.valueOf(0));
				if(e.myState.getOF())
					tfOF.setText(String.valueOf(1));
				else 
					tfOF.setText(String.valueOf(0));
				if(e.myState.getPF())
					tfPF.setText(String.valueOf(1));
				else 
					tfPF.setText(String.valueOf(0));
				if(e.myState.getAF())
					tfAF.setText(String.valueOf(1));
				else 
					tfAF.setText(String.valueOf(0));
				if(e.myState.getIF())
					tfIF.setText(String.valueOf(1));
				else 
					tfIF.setText(String.valueOf(0));
				if(e.myState.getDF())
					tfDF.setText(String.valueOf(1));
				else 
					tfDF.setText(String.valueOf(0));
			}
		});
		btnRemove.setBounds(316, 317, 216, 37);
		frame.getContentPane().add(btnRemove);
		
		JButton btnOpenFile = new JButton("Open file");
		btnOpenFile.setFont(new Font("Comic Sans MS", Font.BOLD, 15));
		btnOpenFile.setBackground(Color.MAGENTA);
		btnOpenFile.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(flag){
				BufferedReader br = null;
				try{
					br = new BufferedReader(new FileReader("list.txt"));
					int val = Integer.parseInt(br.readLine());
					for(int i = 0 ; i <val  ; i++){
						String ss = br.readLine();
						listModel.addElement(ss);
					}
					list.setModel(listModel);
					flag = false;
				}
				catch(Exception e2){
					System.out.println(""+e2);
				}
				finally{
					try{
					br.close();
					}
					catch(Exception e3){
						System.out.println(""+e3);
					}
				}
			}
			}
		});
		btnOpenFile.setBounds(316, 367, 216, 37);
		frame.getContentPane().add(btnOpenFile);
	}
}
