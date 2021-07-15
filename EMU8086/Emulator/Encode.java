package emulator;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;

public class Encode {
	public String ss;
	public String ss1;
	public String ss2;
	public String ss3;
	private static final int CS_INIT = 256;
	private static final int IP_INIT = 0;
	private static final int SP_INIT = 0xfffe;
	private static final int SS_INIT = 256;
	private static final int DS_INIT = 256;
	private static final int ES_INIT = 256;
	public Cpu_bun cpu = new Cpu_bun();
	public State myState= new State();
	public Memory mem = new Memory(0x100000);

	public void initial_in(){
		myState.initial();
		myState.setCS(CS_INIT);
		myState.setIP(IP_INIT);
		myState.setSP(SP_INIT);
		myState.setSS(SS_INIT);
		myState.setDS(DS_INIT);
		myState.setES(ES_INIT);
		initial();
	}
	public int initial(){
		int addr = (myState.getCS()<< 4 );/*+ myState.getIP()*/
		return addr;
	}
	
	public String getSs1(){
		return ss1;
	}
	public String getSs2(){
		return ss2;
	}
	public String getSs3(){
		return ss3;
	}
	public void instrunction(){
		switch(cpu.getOpcode()){
			case "0101000"://ADD AX,BX 
				if(ss2.equals("AX" )){
					if(ss3.equals("BX")){
						myState.setAX(myState.getAX()+myState.getBX());
					}
					else if(ss3.equals("CX")){
						myState.setAX(myState.getAX()+myState.getCX());
					}
					else if(ss3.equals("DX")){
						myState.setAX(myState.getAX()+myState.getDX());
					}
					else if(ss3.length()>2){
						myState.setAX(myState.getAX() + mem.getByte((initial()+myState.getIP())));
					}
				}
				else if(ss2.equals("BX")){
					if(ss3.equals("AX")){
						myState.setBX(myState.getBX()+myState.getAX());
					}
					else if(ss3.equals("CX")){
						myState.setBX(myState.getBX()+myState.getCX());
					}
					else if(ss3.equals("DX")){
						myState.setBX(myState.getBX()+myState.getDX());
					}
					else if(ss3.length()>2){
						myState.setBX(myState.getBX() + mem.getByte((initial()+myState.getIP())));
					}
				}
				else if(ss2.equals("CX")){
					if(ss3.equals("AX")){
						myState.setCX(myState.getCX()+myState.getAX());
					}
					else if(ss3.equals("BX")){
						myState.setCX(myState.getCX()+myState.getBX());
					}
					else if(ss3.equals("DX")){
						myState.setCX(myState.getCX()+myState.getDX());
					}
					else if(ss3.length()>2){
						myState.setCX(myState.getCX() + mem.getByte((initial()+myState.getIP())));
					}
				}
				else if(ss2.equals("DX")){
					if(ss3.equals("AX")){
						myState.setDX(myState.getDX()+myState.getAX());
					}
					else if(ss3.equals("CX")){
						myState.setDX(myState.getDX()+myState.getCX());
					}
					else if(ss3.equals("BX")){
						myState.setDX(myState.getDX()+myState.getBX());
					}
					else if(ss3.length()>2){
						myState.setDX(myState.getDX() + mem.getByte((initial()+myState.getIP())));
					}
				}
				else if(ss2.length()>2){ //ADD mem,reg
						if(ss3.equals("AX")){
							
							byte a = mem.getByte(initial()+myState.getIP());
							mem.setByte(initial()+myState.getIP(),(byte)(a + myState.getAX()));
						}
						else if(ss3.equals("BX")){
							byte a = mem.getByte(initial()+myState.getIP());
							mem.setByte(initial()+myState.getIP(),(byte)(a+myState.getBX()));
						}
						else if(ss3.equals("CX")){
							byte a = mem.getByte(initial()+myState.getIP());
							mem.setByte(initial()+myState.getIP(),(byte)(a+myState.getCX()));
						}
						else if(ss3.equals("DX")){
							byte a = mem.getByte(initial()+myState.getIP());
							mem.setByte(initial()+myState.getIP(),(byte)(a+myState.getDX()));
						}
				}
				myState.setIP(myState.getIP()+2);
				break;
			case "0111000"://ADD AX,opImd
				
				if(ss2.equals("AX")){
					myState.setAX(myState.getAX()+ Integer.parseInt(ss3));
				}
				else if(ss2.equals("BX")){
					myState.setBX(myState.getBX()+ Integer.parseInt(ss3));
				}
				else if(ss2.equals("CX")){
					myState.setCX(myState.getCX()+ Integer.parseInt(ss3));
				}
				else if(ss2.equals("DX")){
					myState.setDX(myState.getDX()+ Integer.parseInt(ss3));
				}
				else if(ss2.length()>2){ //ADD mem,opImd
					if(ss3.charAt(0)<'9' && ss3.charAt(0)>'0'){
						byte a = mem.getByte(initial()+myState.getIP());
						mem.setByte(initial()+myState.getIP(),(byte)(a +(byte)(Integer.parseInt(ss3))));
					}
				}
				myState.setIP(myState.getIP()+3);
				break;
			//ADC
			//
			case "0101001"://ADC AX,BX 
					if(ss2.equals("AX" )){
						if(ss3.equals("BX")){
							updateFlags16((myState.getAX() & 0xffff)+(myState.getBX() & 0xffff)+1);
							myState.setAF(((myState.getAX() & 0xf)+(myState.getBX() & 0xf)+1)>0xf);
							myState.setAX(myState.getAX()+myState.getBX()+1);
							myState.setOF((myState.getAX()+myState.getBX()+1) > 0x7fff || (myState.getAX()+myState.getBX()+1) < -0x8000);
						}
						else if(ss3.equals("CX")){
							updateFlags16((myState.getAX() & 0xffff)+(myState.getCX() & 0xffff)+1);
							myState.setAF(((myState.getAX() & 0xf)+(myState.getCX() & 0xf)+1)>0xf);
							myState.setAX(myState.getAX()+myState.getCX()+1);
							myState.setOF((myState.getAX()+myState.getCX()+1) > 0x7fff || (myState.getAX()+myState.getCX()+1) < -0x8000);
						}
						else if(ss3.equals("DX")){
							updateFlags16((myState.getAX() & 0xffff)+(myState.getDX() & 0xffff)+1);
							myState.setAF(((myState.getAX() & 0xf)+(myState.getDX() & 0xf)+1)>0xf);
							myState.setAX(myState.getAX()+myState.getDX()+1);
							myState.setOF((myState.getAX()+myState.getDX()+1) > 0x7fff || (myState.getAX()+myState.getDX()+1) < -0x8000);
						}
						else if(ss3.length()>2){
							updateFlags16((myState.getAX() & 0xffff)+(mem.getByte((initial()+myState.getIP())) & 0xffff)+1);
							myState.setAF(((myState.getAX() & 0xf)+(mem.getByte((initial()+myState.getIP())) & 0xf)+1)>0xf);
							myState.setAX(myState.getAX()+mem.getByte((initial()+myState.getIP()))+1);
							myState.setOF((myState.getAX()+mem.getByte((initial()+myState.getIP()))+1) > 0x7fff || (myState.getAX()+mem.getByte((initial()+myState.getIP()))+1) < -0x8000);
						}
					}
				else if(ss2.equals("BX")){
					if(ss3.equals("AX")){
						updateFlags16((myState.getBX() & 0xffff)+(myState.getAX() & 0xffff)+1);
						myState.setAF(((myState.getBX() & 0xf)+(myState.getAX() & 0xf)+1)>0xf);
						myState.setBX(myState.getBX()+myState.getAX()+1);
						myState.setOF((myState.getBX()+myState.getAX()+1) > 0x7fff || (myState.getBX()+myState.getAX()+1) < -0x8000);
					}
					else if(ss3.equals("CX")){
						updateFlags16((myState.getBX() & 0xffff)+(myState.getCX() & 0xffff)+1);
						myState.setAF(((myState.getBX() & 0xf)+(myState.getCX() & 0xf)+1)>0xf);
						myState.setBX(myState.getBX()+myState.getCX()+1);
						myState.setOF((myState.getBX()+myState.getCX()+1) > 0x7fff || (myState.getBX()+myState.getCX()+1) < -0x8000);
					}
					else if(ss3.equals("DX")){
						updateFlags16((myState.getBX() & 0xffff)+(myState.getDX() & 0xffff)+1);
						myState.setAF(((myState.getBX() & 0xf)+(myState.getDX() & 0xf)+1)>0xf);
						myState.setBX(myState.getBX()+myState.getDX()+1);
						myState.setOF((myState.getBX()+myState.getDX()+1) > 0x7fff || (myState.getBX()+myState.getDX()+1) < -0x8000);
					}
					else if(ss3.length()>2){
						updateFlags16((myState.getBX() & 0xffff)+(mem.getByte((initial()+myState.getIP())) & 0xffff)+1);
						myState.setAF(((myState.getBX() & 0xf)+(mem.getByte((initial()+myState.getIP())) & 0xf)+1)>0xf);
						myState.setBX(myState.getBX()+mem.getByte((initial()+myState.getIP()))+1);
						myState.setOF((myState.getBX()+mem.getByte((initial()+myState.getIP()))+1) > 0x7fff || (myState.getBX()+mem.getByte((initial()+myState.getIP()))+1) < -0x8000);
					}
				}
				else if(ss2.equals("CX")){
					if(ss3.equals("AX")){
						updateFlags16((myState.getCX() & 0xffff)+(myState.getAX() & 0xffff)+1);
						myState.setAF(((myState.getCX() & 0xf)+(myState.getAX() & 0xf)+1)>0xf);
						myState.setCX(myState.getCX()+myState.getAX()+1);
						myState.setOF((myState.getCX()+myState.getAX()+1) > 0x7fff || (myState.getCX()+myState.getAX()+1) < -0x8000);
					}
					else if(ss3.equals("BX")){
						updateFlags16((myState.getCX() & 0xffff)+(myState.getBX() & 0xffff)+1);
						myState.setAF(((myState.getCX() & 0xf)+(myState.getBX() & 0xf)+1)>0xf);
						myState.setCX(myState.getCX()+myState.getBX()+1);
						myState.setOF((myState.getCX()+myState.getBX()+1) > 0x7fff || (myState.getCX()+myState.getBX()+1) < -0x8000);
					}
					else if(ss3.equals("DX")){
						updateFlags16((myState.getCX() & 0xffff)+(myState.getDX() & 0xffff)+1);
						myState.setAF(((myState.getCX() & 0xf)+(myState.getDX() & 0xf)+1)>0xf);
						myState.setCX(myState.getCX()+myState.getDX()+1);
						myState.setOF((myState.getCX()+myState.getDX()+1) > 0x7fff || (myState.getCX()+myState.getDX()+1) < -0x8000);
					}
					else if(ss3.length()>2){
						updateFlags16((myState.getCX() & 0xffff)+(mem.getByte((initial()+myState.getIP())) & 0xffff)+1);
						myState.setAF(((myState.getCX() & 0xf)+(mem.getByte((initial()+myState.getIP())) & 0xf)+1)>0xf);
						myState.setCX(myState.getCX()+mem.getByte((initial()+myState.getIP()))+1);
						myState.setOF((myState.getCX()+mem.getByte((initial()+myState.getIP()))+1) > 0x7fff || (myState.getCX()+mem.getByte((initial()+myState.getIP()))+1) < -0x8000);
					}
				}
				else if(ss2.equals("DX")){
					if(ss3.equals("AX")){
						updateFlags16((myState.getDX() & 0xffff)+(myState.getAX() & 0xffff)+1);
						myState.setAF(((myState.getDX() & 0xf)+(myState.getAX() & 0xf)+1)>0xf);
						myState.setDX(myState.getDX()+myState.getAX()+1);
						myState.setOF((myState.getDX()+myState.getAX()+1) > 0x7fff || (myState.getDX()+myState.getAX()+1) < -0x8000);
					}
					else if(ss3.equals("CX")){
						updateFlags16((myState.getDX() & 0xffff)+(myState.getCX() & 0xffff)+1);
						myState.setAF(((myState.getDX() & 0xf)+(myState.getCX() & 0xf)+1)>0xf);
						myState.setDX(myState.getDX()+myState.getCX()+1);
						myState.setOF((myState.getDX()+myState.getCX()+1) > 0x7fff || (myState.getDX()+myState.getCX()+1) < -0x8000);
					}
					else if(ss3.equals("BX")){
						updateFlags16((myState.getDX() & 0xffff)+(myState.getBX() & 0xffff)+1);
						myState.setAF(((myState.getDX() & 0xf)+(myState.getBX() & 0xf)+1)>0xf);
						myState.setDX(myState.getDX()+myState.getBX()+1);
						myState.setOF((myState.getDX()+myState.getBX()+1) > 0x7fff || (myState.getDX()+myState.getBX()+1) < -0x8000);
					}
					else if(ss3.length()>2){
						updateFlags16((myState.getDX() & 0xffff)+(mem.getByte((initial()+myState.getIP())) & 0xffff)+1);
						myState.setAF(((myState.getDX() & 0xf)+(mem.getByte((initial()+myState.getIP())) & 0xf)+1)>0xf);
						myState.setDX(myState.getDX()+mem.getByte((initial()+myState.getIP()))+1);
						myState.setOF((myState.getDX()+mem.getByte((initial()+myState.getIP()))+1) > 0x7fff || (myState.getDX()+mem.getByte((initial()+myState.getIP()))+1) < -0x8000);
					}
				}
				else if(ss2.length()>2){ //ADC mem,reg
						if(ss3.equals("AX")){
							byte a = mem.getByte(initial()+myState.getIP());
							updateFlags16((a & 0xffff)+((myState.getAX()) & 0xffff)+1);
							myState.setAF(((a & 0xf)+((myState.getAX()) & 0xf)+1)>0xf);
							mem.setByte(initial()+myState.getIP(),(byte)(a + myState.getAX()+1));
							myState.setOF((a+myState.getAX()+1) > 0x7fff || (a+myState.getAX()+1) < -0x8000);
						}
						else if(ss3.equals("BX")){
							byte a = mem.getByte(initial()+myState.getIP());
							updateFlags16((a & 0xffff)+((myState.getBX()) & 0xffff)+1);
							myState.setAF(((a & 0xf)+((myState.getBX()) & 0xf)+1)>0xf);
							mem.setByte(initial()+myState.getIP(),(byte)(a + myState.getBX()+1));
							myState.setOF((a+myState.getBX()+1) > 0x7fff || (a+myState.getBX()+1) < -0x8000);
							
						}
						else if(ss3.equals("CX")){
							byte a = mem.getByte(initial()+myState.getIP());
							updateFlags16((a & 0xffff)+((myState.getCX()) & 0xffff)+1);
							myState.setAF(((a & 0xf)+((myState.getCX()) & 0xf)+1)>0xf);
							mem.setByte(initial()+myState.getIP(),(byte)(a + myState.getCX()+1));
							myState.setOF((a+myState.getCX()+1) > 0x7fff || (a+myState.getCX()+1) < -0x8000);
						}
						else if(ss3.equals("DX")){
							byte a = mem.getByte(initial()+myState.getIP());
							updateFlags16((a & 0xffff)+((myState.getDX()) & 0xffff)+1);
							myState.setAF(((a & 0xf)+((myState.getDX()) & 0xf)+1)>0xf);
							mem.setByte(initial()+myState.getIP(),(byte)(a + myState.getDX()+1));
							myState.setOF((a+myState.getDX()+1) > 0x7fff || (a+myState.getDX()+1) < -0x8000);
						}
				}
				myState.setIP(myState.getIP()+2);
				break;
			case "0111001"://ADC AX,op imd
				
				if(ss2.equals("AX")){
					updateFlags16((myState.getAX() & 0xffff)+(Integer.parseInt(ss3) & 0xffff)+1);
					myState.setAF(((myState.getAX() & 0xf)+(Integer.parseInt(ss3)& 0xf)+1)>0xf);
					myState.setAX(myState.getAX()+Integer.parseInt(ss3)+1);
					myState.setOF((myState.getAX()+Integer.parseInt(ss3)+1) > 0x7fff || (myState.getAX()+Integer.parseInt(ss3)+1) < -0x8000);
				}
				else if(ss2.equals("BX")){
					updateFlags16((myState.getBX() & 0xffff)+(Integer.parseInt(ss3) & 0xffff)+1);
					myState.setAF(((myState.getBX() & 0xf)+(Integer.parseInt(ss3)& 0xf)+1)>0xf);
					myState.setBX(myState.getBX()+Integer.parseInt(ss3)+1);
					myState.setOF((myState.getBX()+Integer.parseInt(ss3)+1) > 0x7fff || (myState.getBX()+Integer.parseInt(ss3)+1) < -0x8000);
				}
				else if(ss2.equals("CX")){
					updateFlags16((myState.getCX() & 0xffff)+(Integer.parseInt(ss3) & 0xffff)+1);
					myState.setAF(((myState.getCX() & 0xf)+(Integer.parseInt(ss3)& 0xf)+1)>0xf);
					myState.setCX(myState.getCX()+Integer.parseInt(ss3)+1);
					myState.setOF((myState.getCX()+Integer.parseInt(ss3)+1) > 0x7fff || (myState.getCX()+Integer.parseInt(ss3)+1) < -0x8000);
				}
				else if(ss2.equals("DX")){
					updateFlags16((myState.getDX() & 0xffff)+(Integer.parseInt(ss3) & 0xffff)+1);
					myState.setAF(((myState.getDX() & 0xf)+(Integer.parseInt(ss3)& 0xf)+1)>0xf);
					myState.setDX(myState.getDX()+Integer.parseInt(ss3)+1);
					myState.setOF((myState.getDX()+Integer.parseInt(ss3)+1) > 0x7fff || (myState.getDX()+Integer.parseInt(ss3)+1) < -0x8000);
				}
				else if(ss2.length()>2){ //ADD mem,opImd
					if(ss3.charAt(0)<'9' && ss3.charAt(0)>'0'){
						byte a = mem.getByte(initial()+myState.getIP());
						updateFlags16((a & 0xffff)+(Integer.parseInt(ss3) & 0xffff)+1);
						myState.setAF(((a & 0xf)+((Integer.parseInt(ss3)) & 0xf)+1)>0xf);
						mem.setByte(initial()+myState.getIP(),(byte)(a + Integer.parseInt(ss3)+1));
						myState.setOF((a+Integer.parseInt(ss3)+1) > 0x7fff || (a+Integer.parseInt(ss3)+1) < -0x8000);
					}
				}
				myState.setIP(myState.getIP()+3);
				break;
				//
				//
				
			case "0000000": //MOV AX,BX ; MOV AX,[mem] ;
				
				if(ss2.equals("AX")){
					if(ss3.equals("BX")){
						myState.setAX(myState.getBX());
					}
					else if(ss3.equals("CX")){
						myState.setAX(myState.getCX());
					}
					else if(ss3.equals("DX")){
						myState.setAX(myState.getDX());
					}
					else if(ss3.length()>2){
						myState.setAX(pop());
						//myState.setAX(mem.getByte(initial()+myState.getIP()));
					}
				}
				else if(ss2.equals("BX")){
					if(ss3.equals("AX")){
						myState.setBX(myState.getAX());
					}
					else if(ss3.equals("CX")){
						myState.setBX(myState.getCX());
					}
					else if(ss3.equals("DX")){
						myState.setBX(myState.getDX());
					}
					else if(ss3.length()>2){
						myState.setBX(pop());
						//myState.setBX(mem.getByte(initial()+myState.getIP()));
					}
				}
				else if(ss2.equals("CX")){
					if(ss3.equals("AX")){
						myState.setCX(myState.getAX());
					}
					else if(ss3.equals("BX")){
						myState.setCX(myState.getBX());
					}
					else if(ss3.equals("DX")){
						myState.setCX(myState.getDX());
					}
					else if(ss3.length()>2){
						myState.setCX(pop());
						//myState.setCX(mem.getByte(initial()+myState.getIP()));
					}
				}
				else if(ss2.equals("DX")){
					if(ss3.equals("AX")){
						myState.setDX(myState.getAX());
					}
					else if(ss3.equals("CX")){
						myState.setDX(myState.getCX());
					}
					else if(ss3.equals("BX")){
						myState.setDX(myState.getBX());
					}
					else if(ss3.length()>2){
						myState.setDX(pop());
						//myState.setDX(mem.getByte(initial()+myState.getIP()));
					}
				}
				else if(ss2.length()>2){ //MOV mem,reg
					if(ss3.equals("AX")){
						push(myState.getAX());
						//mem.setByte(initial()+myState.getIP(),(byte)(myState.getAX()));
					}
					else if(ss3.equals("BX")){
						push(myState.getBX());
						//mem.setByte(initial()+myState.getIP(),(byte)(myState.getBX()));
					}
					else if(ss3.equals("CX")){
						push(myState.getCX());
						//mem.setByte(initial()+myState.getIP(),(byte)(myState.getCX()));
					}
					else if(ss3.equals("DX")){
						push(myState.getDX());
						//mem.setByte(initial()+myState.getIP(),(byte)(myState.getDX()));
					}
				}
				myState.setIP(myState.getIP()+2);
				break;
				
			case "0010000": //MOV AX,op imd
				
				if(ss2.equals("AX")){
					myState.setAX(Integer.parseInt(ss3));
				}
				else if(ss2.equals("BX")){
					myState.setBX(Integer.parseInt(ss3));
				}
				else if(ss2.equals("CX")){
					myState.setCX(Integer.parseInt(ss3));
				}
				else if(ss2.equals("DX")){
					myState.setDX(Integer.parseInt(ss3));
				}
				else if(ss2.length()>2){ //MOV mem,opImd
					if(ss3.charAt(0)<'9' && ss3.charAt(0)>'0'){
						push(Integer.parseInt(ss3));
						//mem.setByte(initial()+myState.getIP(),(byte)((Integer.parseInt(ss3))));
					}
				}
				myState.setIP(myState.getIP()+3);
				break;
				
				//INC 
				//
			case "0001000":
				if(ss2.equals("AX" )){
					updateFlags16(myState.getAX()+1);
					myState.setAX(myState.getAX()+1);
				}
				else if(ss2.equals("BX")){
					updateFlags16(myState.getBX()+1);
					myState.setBX(myState.getBX()+1);
				}
				else if(ss2.equals("CX")){
					updateFlags16(myState.getCX()+1);
					myState.setCX(myState.getCX()+1);
				}
				else if(ss2.equals("DX")){
					updateFlags16(myState.getDX()+1);
					myState.setDX(myState.getDX()+1);
				}
				else if(ss2.equals("SP")){
					updateFlags16(myState.getSP()+1);
					myState.setSP(myState.getSP()+1);
				}
				else if(ss2.equals("BP")){
					updateFlags16(myState.getBP()+1);
					myState.setBP(myState.getBP()+1);
				}
				else if(ss2.equals("SI")){
					updateFlags16(myState.getSI()+1);
					myState.setSI(myState.getSI()+1);
				}
				else if(ss2.equals("DI")){
					updateFlags16(myState.getDI()+1);
					myState.setDI(myState.getDI()+1);
				}
				else if(ss2.length()>2){ //INC mem	
					byte a = mem.getByte(initial()+myState.getIP());
					updateFlags16(a+1);
					mem.setByte(initial()+myState.getIP(),(byte)(a + 1));
				}
				myState.setIP(myState.getIP()+1);
				break;	
				//DEC
				//
			case "0001001":
				if(ss2.equals("AX" )){
					updateFlags16(myState.getAX()-1);
					myState.setAX(myState.getAX()-1);
				}
				else if(ss2.equals("BX")){
					updateFlags16(myState.getBX()-1);
					myState.setBX(myState.getBX()-1);
				}
				else if(ss2.equals("CX")){
					updateFlags16(myState.getCX()-1);
					myState.setCX(myState.getCX()-1);
				}
				else if(ss2.equals("DX")){
					updateFlags16(myState.getDX()-1);
					myState.setDX(myState.getDX()-1);
				}
				else if(ss2.equals("SP")){
					updateFlags16(myState.getSP()-1);
					myState.setSP(myState.getSP()-1);
				}
				else if(ss2.equals("BP")){
					updateFlags16(myState.getBP()-1);
					myState.setBP(myState.getBP()-1);
				}
				else if(ss2.equals("SI")){
					updateFlags16(myState.getSI()-1);
					myState.setSI(myState.getSI()-1);
				}
				else if(ss2.equals("DI")){
					updateFlags16(myState.getDI()-1);
					myState.setDI(myState.getDI()-1);
				}
				else if(ss2.length()>2){ //DEC mem
					
					byte a = mem.getByte(initial()+myState.getIP());
					updateFlags16(a-1);
					mem.setByte(initial()+myState.getIP(),(byte)(a - 1));
				}
				myState.setIP(myState.getIP()+1);
				break;	
				//NEG
			case "0001010":
				if(ss2.equals("AX" )){
					updateFlags16(0xffff - myState.getAX()+1);
					myState.setAX(0xffff - myState.getAX()+1);
				}
				else if(ss2.equals("BX")){
					updateFlags16(0xffff - myState.getBX()+1);
					myState.setBX(0xffff -myState.getBX()+1);
				}
				else if(ss2.equals("CX")){
					updateFlags16(0xffff - myState.getCX()+1);
					myState.setCX(0xffff -myState.getCX()+1);
				}
				else if(ss2.equals("DX")){
					updateFlags16(0xffff - myState.getDX()+1);
					myState.setDX(0xffff -myState.getDX()+1);
				}
				else if(ss2.equals("SP")){
					updateFlags16(0xffff - myState.getSP()+1);
					myState.setSP(0xffff -myState.getSP()+1);
				}
				else if(ss2.equals("BP")){
					updateFlags16(0xffff - myState.getBP()+1);
					myState.setBP(0xffff -myState.getBP()+1);
				}
				else if(ss2.equals("SI")){
					updateFlags16(0xffff - myState.getSI()+1);
					myState.setSI(0xffff -myState.getSI()+1);
				}
				else if(ss2.equals("DI")){
					updateFlags16(0xffff - myState.getDI()+1);
					myState.setDI(0xffff -myState.getDI()+1);
				}
				else if(ss2.length()>2){ //NEG mem
					byte a = mem.getByte(initial()+myState.getIP());
					updateFlags16(0xffff - a+1);
					mem.setByte(initial()+myState.getIP(),(byte)(0xffff -a + 1));
				}
				myState.setIP(myState.getIP()+2);
				break;
				//NOT
			case "0001011":
				if(ss2.equals("AX" )){
					updateFlags16(0xffff - myState.getAX());
					myState.setAX(0xffff - myState.getAX());
				}
				else if(ss2.equals("BX")){
					updateFlags16(0xffff - myState.getBX());
					myState.setBX(0xffff -myState.getBX());
				}
				else if(ss2.equals("CX")){
					updateFlags16(0xffff - myState.getCX());
					myState.setCX(0xffff -myState.getCX());
				}
				else if(ss2.equals("DX")){
					updateFlags16(0xffff - myState.getDX());
					myState.setDX(0xffff -myState.getDX());
				}
				else if(ss2.equals("SP")){
					updateFlags16(0xffff - myState.getSP());
					myState.setSP(0xffff -myState.getSP());
				}
				else if(ss2.equals("BP")){
					updateFlags16(0xffff - myState.getBP());
					myState.setBP(0xffff -myState.getBP());
				}
				else if(ss2.equals("SI")){
					updateFlags16(0xffff - myState.getSI());
					myState.setSI(0xffff -myState.getSI());
				}
				else if(ss2.equals("DI")){
					updateFlags16(0xffff - myState.getDI());
					myState.setDI(0xffff -myState.getDI());
				}
				else if(ss2.length()>2){ //NOT mem
					byte a = mem.getByte(initial()+myState.getIP());
					updateFlags16(0xffff - a);
					mem.setByte(initial()+myState.getIP(),(byte)(0xffff -a));
				}
				myState.setIP(myState.getIP()+2);
				break;
				//SHL
				//
			case "0001100":
				if(ss2.equals("AX" )){
					myState.setAX(shl(myState.getAX(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("BX")){
					myState.setBX(shl(myState.getBX(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("CX")){
					myState.setCX(shl(myState.getCX(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("DX")){
					myState.setDX(shl(myState.getDX(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("SP")){
					myState.setSP(shl(myState.getSP(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("BP")){
					myState.setBP(shl(myState.getBP(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("SI")){
					myState.setSI(shl(myState.getSI(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("DI")){
					myState.setDI(shl(myState.getDI(),Integer.parseInt(ss3)));
				}
				else if(ss2.length()>2){ //SHL mem
					byte a = mem.getByte(initial()+myState.getIP());
					mem.setWord(initial()+myState.getIP(),shl(a,Integer.parseInt(ss3)));
				}
				myState.setIP(myState.getIP()+2);
				break;
				//SHR
				//
			case "0001101":
				if(ss2.equals("AX" )){
					myState.setAX(shr(myState.getAX(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("BX")){
					myState.setBX(shr(myState.getBX(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("CX")){
					myState.setCX(shr(myState.getCX(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("DX")){
					myState.setDX(shr(myState.getDX(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("SP")){
					myState.setSP(shr(myState.getSP(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("BP")){
					myState.setBP(shr(myState.getBP(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("SI")){
					myState.setSI(shr(myState.getSI(),Integer.parseInt(ss3)));
				}
				else if(ss2.equals("DI")){
					myState.setDI(shr(myState.getDI(),Integer.parseInt(ss3)));
				}
				else if(ss2.length()>2){ //SHL mem
					byte a = mem.getByte(initial()+myState.getIP());
					mem.setWord(initial()+myState.getIP(),shr(a,Integer.parseInt(ss3)));
				}
				myState.setIP(myState.getIP()+2);
				break;
				//PUSH
				//
			case "0000010":
				if(ss2.equals("AX" )){
					push(myState.getAX());
				}
				else if(ss2.equals("BX")){
					push(myState.getBX());
				}
				else if(ss2.equals("CX")){
					push(myState.getCX());
				}
				else if(ss2.equals("DX")){
					push(myState.getDX());
				}
				else if(ss2.equals("SP")){
					push(myState.getSP());
				}
				else if(ss2.equals("BP")){
					push(myState.getBP());
				}
				else if(ss2.equals("SI")){
					push(myState.getSI());
				}
				else if(ss2.equals("DI")){
					push(myState.getDI());
				}
				else if(ss2.equals("ES")){
					push(myState.getES());
				}
				else if(ss2.length()>2){ // PUSH MEM
					push((mem.getWord(myState.getSS()<<4)+myState.getSP()));
				}
				myState.setIP(myState.getIP()+1);
				break;
				//POP
			case "0000011":
				if(ss2.equals("AX" )){
					myState.setAX(pop());
				}
				else if(ss2.equals("BX")){
					myState.setBX(pop());
				}
				else if(ss2.equals("CX")){
					myState.setCX(pop());
				}
				else if(ss2.equals("DX")){
					myState.setDX(pop());
				}
				else if(ss2.equals("SP")){
					myState.setSP(pop());
				}
				else if(ss2.equals("BP")){
					myState.setBP(pop());
				}
				else if(ss2.equals("SI")){
					myState.setSI(pop());
				}
				else if(ss2.equals("DI")){
					myState.setDI(pop());
				}
				else if(ss2.equals("ES")){
					myState.setES(pop());
				}
				else if(ss2.length()>2){ //POP mem
					mem.setWord(initial()+myState.getIP(),pop());
				}
				myState.setIP(myState.getIP()+1);
				break;
		}
		System.out.println(myState);
	}
	public void updateFlags16(int v) {
        myState.setCF((v & 0xFFFF0000) != 0);
        myState.setZF((short) v == 0);
        
        byte byteVal = (byte) v;
        byte bitSum = 0;
        for (byte b = 1; b != 0; b <<= 1) {
            if ((byteVal & b) != 0) {
                bitSum += 1;
            }
        }
        myState.setPF(bitSum % 2 == 0);
        
        myState.setSF(((short) v & 0x8000) != 0);
    }
	public void read(){
	BufferedReader br = null;
	try{
		br = new BufferedReader(new FileReader("List.txt"));
		int val = Integer.parseInt(br.readLine());
		for(int i = 0 ; i < val ; i++){
			ss = br.readLine();
			ss1 =ss.substring(0,ss.indexOf(' '));
			if(ss.contains(",")){
				ss2 = ss.substring(ss.indexOf(' ')+1,ss.indexOf(','));
				ss3 = ss.substring(ss.indexOf(',')+1);
			}
			else{
				ss2 = ss.substring(ss.indexOf(' ')+1);
			}
			switch(ss1){
			case "ADD":
				if(ss3.charAt(0)<'9' && ss3.charAt(0)>'0'){//operand imd RI2
					cpu.setOpcode("0111000");
				}
				else {
					cpu.setOpcode("0101000");
				}
				break;
			case "ADC":
				if(ss3.charAt(0)<'9' && ss3.charAt(0)>'0'){// operand imd RI2
					cpu.setOpcode("0111001");
				}
				else {
					cpu.setOpcode("0101001");//fara op imd
				}
				break;
			case "MOV":
				if(ss3.charAt(0)<'9' && ss3.charAt(0)>'0'){//operand imd RI2
					cpu.setOpcode("0010000");
				}
				else {
					cpu.setOpcode("0000000");
				}
				break;
			case "INC":
				cpu.setOpcode("0001000");
				break;
			case "DEC":
				cpu.setOpcode("0001001");
				break;
			case "NEG":
				cpu.setOpcode("0001010");
				break;
			case "NOT":
				cpu.setOpcode("0001011");
				break;
			case "PUSH":
				cpu.setOpcode("0000010");
				break;
			case "POP":
				cpu.setOpcode("0000011");
				break;
			case "SHL":
				cpu.setOpcode("0001100");
				break;
			case "SHR":
				cpu.setOpcode("0001101");
				break;
			}
			String d = (ss2.charAt(0) == '[') ? "1":"0"; 
			cpu.setD(d);
			
			//
			switch(d){
			case "0":
				if(ss3.charAt(0) == '['){
					if(ss3.length()== 4 || ss3.length() == 7){
						cpu.setMod("00");
					}
					else if ((ss3.length()>7) && (Integer.toBinaryString(Integer.parseInt(ss3.substring(7,ss3.length()-1))).length()<=8)){
						cpu.setMod("01");
					}
					else if ((ss3.length()>7) && (Integer.toBinaryString(Integer.parseInt(ss3.substring(7,ss3.length()-1))).length()>8)){
						cpu.setMod("10");
					}
				}
				else cpu.setMod("11");
				break;
			case "1":
				if(ss2.charAt(0) == '['){
					if(ss2.length()== 4 || ss2.length() == 7){
						cpu.setMod("00");
					}
					else if ((ss2.length()>7) && (Integer.toBinaryString(Integer.parseInt(ss2.substring(7,ss2.length()-1))).length()<=8)){
						cpu.setMod("01");
					}
					else if ((ss2.length()>7) && (Integer.toBinaryString(Integer.parseInt(ss2.substring(7,ss2.length()-1))).length()>8)){
						cpu.setMod("10");
					}
				}
				break;
			}
			
			System.out.println(cpu.getOpcode());
			System.out.println(cpu.getD());
			System.out.println(cpu.getMod());
			instrunction();
		}
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
	public void push(int val){
		int sp = (myState.getSP()-2)& 0xffff;
		myState.setSP(sp);
		mem.setWord((myState.getSS()<<4)+sp,(short)val);
	}
	public short pop(){
		short val = mem.getWord((myState.getSS()<<4)+myState.getSP());
		myState.setSP(myState.getSP()+2);
		return val;
	}
	public short shl(int val, int count){
        val <<= count;
        
        updateFlags16(val);
        myState.setCF((val & 0x10000) == 0x10000);
        myState.setAF((val & 0x10) != 0);
        myState.setOF(((val >> 16) & 0x1) != ((val >> 15) & 0x1));
        
        return (short)val;
	}
	public short shr(int val, int count){
        val >>= count;
        
        updateFlags16(val);
        myState.setCF((val & 0x10000) == 0x10000);
        myState.setAF((val & 0x10) != 0);
        myState.setOF(((val >> 16) & 0x1) != ((val >> 15) & 0x1));
        
        return (short)val;
	}
	
	public static void main(String args[]){
		Encode e = new Encode();
		e.initial_in();
		byte[] data = {1,2,3,4,5,89,-98,123,4};
		int addr = (e.myState.getCS()<< 4 + e.myState.getIP());
		e.mem.loadData(addr, data);
		e.read();
	}
}

