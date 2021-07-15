package emulator;

public class Cpu_bun{
	public State myState=new State();
	String opcode;//7 biti
	String d;//1 bit
	String mod;
	String reg;
	String rm;
	public void setOpcode(String x){
		opcode = x;
	}
	public String getOpcode(){
		return opcode;
	}
	public void setD(String x){
		d = x;
	}
	public String getD(){
		return d;
	}
	public void setMod(String x){
		mod = x;
	}
	public String getMod(){
		return mod;
	}
	public void setReg(String x){
		reg = x;
	}
	public String getReg(){
		return reg;
	}
	public void setRM(String x){
		rm = x;
	}
	public String getRM(){
		return rm;
	}
	
}
