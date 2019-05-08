import std.exception;
import std.stdio;

import datastream;

class BinaryDataStream : DataStream
{
public:

	this()
	{

	}

	~this()
	{
		
	}


	override void Serialize(ref char data)
	{	
		enforce(m_DataBuffer !is null, "DataBuffer is null");
		m_DataBuffer.Write(&data, data.sizeof);
	}

	override void Deserialize(ref char data)
	{
		enforce(m_DataBuffer !is null, "DataBuffer is null");
		m_DataBuffer.Read(&data, data.sizeof);
	}

	override void Serialize(ref int data)
	{
		enforce(m_DataBuffer !is null, "DataBuffer is null");
		m_DataBuffer.Write(cast(char*)&data, data.sizeof);
	}

	override void Deserialize(ref int data)
	{
		enforce(m_DataBuffer !is null, "DataBuffer is null");
		m_DataBuffer.Read(cast(char*)&data, data.sizeof);
	}

	override void Serialize(ref double data)
	{
		enforce(m_DataBuffer !is null, "DataBuffer is null");
		m_DataBuffer.Write(cast(char*)&data, double.sizeof);
	}

	override void Deserialize(ref double data)
	{
		enforce(m_DataBuffer !is null, "DataBuffer is null");
		m_DataBuffer.Read(cast(char*)&data, double.sizeof);
	}
}