package emulator;
// The purpose of the "Memory" class is to create a memory space and define 
//the memory addresses we can use for storing and accessing operands in some cases;

public class Memory {
	private byte[] mem;		//organised as an array of bytes
	    
	public Memory(int size) {
		mem = new byte[size];
	}
	 
	// Add value to memory
	public void loadData(int address, byte[] data) {
	    System.arraycopy(data, 0, mem, address, data.length);
	}
	    
	public byte getByte(int address) {
	    return mem[address];
	}
	    
	public short getWord(int address) {
	    return (short) ((mem[address] & 0xff) | (mem[address + 1] << 8));
	}
	
	// Set value of 8 bits; 
	public void setByte(int address, byte value) {
	     mem[address] = value;
	}
	
	// Set value of 16 bits;
	public void setWord(int address, short value) {
	     mem[address] = (byte) value;
	     mem[address + 1] = (byte)(value >> 8);
	}
	
	/*public static void main(String args[]) {
		Memory mem = new Memory(0x100000);
		byte[] data = {1,2,3,4,5,89,-98,123,4};
		int addr = 1239;
		mem.loadData(addr, data);
		System.out.println(mem.getByte(addr+6));
	}*/
}
