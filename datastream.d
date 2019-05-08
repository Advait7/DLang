import std.stdio;

import databuffer;

class DataStream
{
public:

	this()
	{
		m_DataBuffer = new DataBuffer();
	}

	~this()
	{
		
	}	

	abstract void Serialize(ref char data);
	abstract void Deserialize(ref char data); 

	abstract void Serialize(ref int data);
	abstract void Deserialize(ref int data);

	abstract void Serialize(ref double data);
	abstract void Deserialize(ref double data);	

protected:
	DataBuffer m_DataBuffer;
}