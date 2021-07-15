package emulator;
// The purpose of the "State" class is to define the registers our Emu8086 will use

/*import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;*/

public class State {
	
	//General purpose registers - 16 bits
	private static final int AX = 0;
	private static final int BX = 1;
	private static final int CX = 2;
	private static final int DX = 3;
	
	//Index registers - 16 bits
	private static final int SP = 4;		//stack pointer
	private static final int BP = 5;		//base pointer
	private static final int SI = 6;		//source index
	private static final int DI = 7;		//destination index
	
	//Program Counter 
	private static int IP = 8;
	
	//Segment registers
	private static final int CS = 0;
	private static final int DS = 1;
	private static final int SS = 2;
	private static final int ES = 3;
	
	//Flags
	private static final int CF = 0x0001;
	private static final int PF = 0x0004;
	private static final int AF = 0x0010;
	private static final int ZF = 0x0040;
	private static final int SF = 0x0080;
	private static final int TF = 0x0100;
	private static final int IF = 0x0200;
	private static final int DF = 0x0400;
	private static final int OF = 0x0800;

	
	private int[] reg;		// array of general registers 
	private int[] sreg;		// array of segment registers
	private int flags;	
	
	
	public State() { 
		reg = new int[8];
		sreg = new int[4];
		initial();
	}
	public void initial() {
		for(int i = 0; i < 8; i++) {
			reg[i] = 0;
		}
		for(int i = 0; i < 4; i++) {
			sreg[i] = 0;
		}
	}
	
	
	// Getters
	// Introducing the low and high part of general registers
	// _L -> last 8 bits from _X; _H -> first 8 bits from _X
	public byte getAL() {
		return (byte) reg[AX];
	}
	public byte getAH() {
		return (byte) (reg[AX] >> 8);		//logic shift right	to get only the first 8 bits	
	}
	public byte getBL() {
		return (byte) reg[BX];
	}
	public byte getBH() {
		return (byte) (reg[BX] >> 8);
	}
	public byte getCL() {
		return (byte) reg[CX];
	}
	public byte getCH() {
		return (byte) (reg[CX] >> 8);
	}
	public byte getDL() {
		return (byte) reg[DX];
	}
	public byte getDH() {
		return (byte) (reg[DX] >> 8);
	}
	
	public int getAX() {
		return reg[AX];
	}
	public int getBX() {
		return reg[BX];
	}
	public int getCX() {
		return reg[CX];
	}
	public int getDX() {
		return reg[DX];
	}
	
	public int getSP() {
		return reg[SP];
	}
	public int getBP() {
		return reg[BP];
	}
	public int getSI() {
		return reg[SI];
	}
	public int getDI() {
		return reg[DI];
	}
	public int getIP() {
		return IP;
	}
	
	public int getCS() {
		return sreg[CS];
	}
	public int getDS() {
		return sreg[DS];
	}
	public int getSS() {
		return sreg[SS];
	}
	public int getES() {
		return sreg[ES];
	}
	
	public int getFlags() {
		return flags;
	}
	
	public boolean getCF() {
		return getFlag(CF);
	}
	public boolean getPF() {
		return getFlag(PF);
	}
	public boolean getAF() {
		return getFlag(AF);
	}
	public boolean getZF() {
		return getFlag(ZF);
	}
	public boolean getSF() {
		return getFlag(SF);
	}
	public boolean getTF() {
		return getFlag(TF);
	}
	public boolean getIF() {
		return getFlag(IF);
	}
	public boolean getDF() {
		return getFlag(DF);
	}
	public boolean getOF() {
		return getFlag(OF);
	}
	public int getSegReg(int index) {
		return sreg[index];
	}
	public int getReg(int index) {
		return reg[index];
	}
	public byte getReg8(int index) {
	    if ((index & 0x04) != 0) {
	    	return (byte) (reg[index & 0x03] >> 8);
	    } else {
	        return (byte) (reg[index & 0x03] & 0xff);
	    }
	}
	
	//Setters
	// 0xffff -> maximum number supported since registers are on 16 bits
	// 0xff -> maximum number supported by the low/high parts of the registers since they are on 8 bits
	public void setAL(byte value) {
		reg[AX] &= 0xff00;		  		// stores in AX the high part
		reg[AX] |= value & 0xff;		// changes/ sets the last 8 bits from AX to the new value
	}
	public void setAH(byte value) {		
		reg[AX] &= 0x00ff;				// stores in AX the low part
		reg[AX] |= ((value & 0xff) << 8); // changes/ sets the first 8 bits from AX to the new value
	}
	public void setBL(byte value) {
		reg[BX] &= 0xff00;
		reg[BX] |= value & 0xff;
	}
	public void setBH(byte value) {
		reg[BX] &= 0x00ff;
		reg[BX] |= ((value & 0xff) << 8);
	}
	public void setCL(byte value) {
		reg[CX] &= 0xff00;
		reg[CX] |= value & 0xff;
	}
	public void setCH(byte value) {
		reg[CX] &= 0x00ff;
		reg[CX] |= ((value & 0xff) << 8);
	}
	public void setDL(byte value) {
		reg[DX] &= 0xff00;
		reg[DX] |= value & 0xff;
	}
	public void setDH(byte value) {
		reg[DX] &= 0x00ff;
		reg[DX] |= ((value & 0xff) << 8);
	}
	
	
	public void setAX(int value) {
		reg[AX] = value & 0xffff;
	}
	public void setBX(int value) {
		reg[BX] = value & 0xffff;
	}
	public void setCX(int value) {
		reg[CX] = value & 0xffff;
	}
	public void setDX(int value) {
		reg[DX] = value & 0xffff;
	}
	
	public void setSP(int value) {
		reg[SP] = value & 0xffff;
	}
	public void setBP(int value) {
		reg[BP] = value & 0xffff;
	}
	public void setSI(int value) {
		reg[SI] = value & 0xffff;
	}
	public void setDI(int value) {
		reg[DI] = value & 0xffff;
	}
	
	public void setES(int value) {
		sreg[ES] = value & 0xffff;
	}
	public void setCS(int value) {
		sreg[CS] = value & 0xffff;
	}
	public void setSS(int value) {
		sreg[SS] = value & 0xffff;
	}
	public void setDS(int value) {
		sreg[DS] = value & 0xffff;
	}
	
	public void setIP(int value) {
		IP = value & 0xffff;
	}
	
	public void setCF(boolean value) {
		setFlag(CF, value);
	}
	public void setPF(boolean value) {
		setFlag(PF, value);
	}
	public void setAF(boolean value) {
		setFlag(AF, value);
	}
	public void setZF(boolean value) {
		setFlag(ZF, value);
	}
	public void setSF(boolean value) {
		setFlag(SF, value);
	}
	public void setTF(boolean value) {
		setFlag(TF, value);
	}
	public void setIF(boolean value) {
		setFlag(IF, value);
	}
	public void setDF(boolean value) {
		setFlag(DF, value);
	}
	public void setOF(boolean value) {
		setFlag(OF, value);
	}
	public void setReg(int index, int value) {
		reg[index] = value & 0xffff;
	}
	public void setSreg(int index, int value) {
		sreg[index] = value & 0xffff;
	}
	public void setReg8(int index, byte value) {
        if ((index & 0x04) != 0) {
            reg[index & 0x03] &= 0x00ff;
            reg[index & 0x03] |= (value << 8) & 0xff00;
        } else {
            reg[index & 0x03] &= 0xff00;
            reg[index & 0x03] |= value & 0x00ff;
        }
    }
	public void setFlags(int value) {
		flags = value;
	}
	
	private void setFlag(int flagValue, boolean value) {
		if(value == true) {
			flags |= flagValue;
		}else {
			flags &=~flagValue;
		}
	}
	
	private boolean getFlag(int flagValue) {
	     return (flags & flagValue) == flagValue;
	}
	
	public String wordToHex(int value){
	     return Integer.toHexString((value & 0xffff) | 0x10000).substring(1);
	}
	    
	public String toString(){
		StringBuffer sb = new StringBuffer();
	    sb.append("AX=");  sb.append(wordToHex(getAX())); sb.append(" AH="); sb.append(wordToHex(getAH())); sb.append(" AL="); sb.append(wordToHex(getAL())); sb.append('\n');
	    sb.append("BX="); sb.append(wordToHex(getBX()));  sb.append(" BH="); sb.append(wordToHex(getBH())); sb.append(" BL="); sb.append(wordToHex(getBL())); sb.append('\n');
	    sb.append("CX="); sb.append(wordToHex(getCX()));  sb.append(" CH="); sb.append(wordToHex(getCH())); sb.append(" CL="); sb.append(wordToHex(getCL())); sb.append('\n');
	    sb.append("DX="); sb.append(wordToHex(getDX()));  sb.append(" DH="); sb.append(wordToHex(getDH())); sb.append(" DL="); sb.append(wordToHex(getDL())); sb.append('\n');
	    sb.append("SI="); sb.append(wordToHex(getSI()));  sb.append('\n');
	    sb.append("DI="); sb.append(wordToHex(getDI()));  sb.append('\n');
	    sb.append("BP="); sb.append(wordToHex(getBP()));  sb.append('\n');
	    sb.append("SP="); sb.append(wordToHex(getSP()));  sb.append('\n');
	    sb.append("DS="); sb.append(wordToHex(getDS()));  sb.append('\n');
	    sb.append("ES="); sb.append(wordToHex(getES()));  sb.append('\n');
	    sb.append("SS="); sb.append(wordToHex(getSS()));  sb.append('\n');
	    sb.append("flags="); sb.append(wordToHex(flags)); sb.append('\n');
        sb.append(" (");
        sb.append((flags & OF) == 0 ? ' ' : 'O');
	    sb.append((flags & DF) == 0 ? ' ' : 'D');
        sb.append((flags & IF) == 0 ? ' ' : 'I');
        sb.append((flags & TF) == 0 ? ' ' : 'T');
	    sb.append((flags & SF) == 0 ? ' ' : 'S');
	    sb.append((flags & ZF) == 0 ? ' ' : 'Z');
	    sb.append((flags & AF) == 0 ? ' ' : 'A');
	    sb.append((flags & PF) == 0 ? ' ' : 'P');
        sb.append((flags & CF) == 0 ? ' ' : 'C');
        sb.append(")");sb.append('\n');
        sb.append(" CS:IP=");
        sb.append(wordToHex(getCS()));
        sb.append(":");
        sb.append(wordToHex(getIP() - 1));
        return sb.toString();
    }
	
	/*public static void main(String args[]) throws IOException {
		State myState = new State();
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("Introduceti registrul: ");
		String a = new String(in.readLine());
		System.out.println("Introduceti valoarea: ");
		String c = new String(in.readLine());
		int b = Integer.parseInt(c);

		if(a.equals("AX")){
		myState.setAX(b);
		}
		else if(a.equals("BX")){
		myState.setBX(b);
		}
		else if(a.equals("CX")){
		myState.setBX(b);
		}
		else if(a.equals("DX")){
		myState.setBX(b);
		}
		else if(a.equals("SP")){
		myState.setSP(b);
		}
		else if(a.equals("BP")){
		myState.setBP(b);
		}
		else if(a.equals("SI")){
		myState.setSI(b);
		}
		else if(a.equals("DI")){
		myState.setDI(b);
		}
		
		System.out.println(myState);
	}*/
}
