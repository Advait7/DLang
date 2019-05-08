import std.stdio;

import core.memory;
import core.stdc.stdlib;
import core.stdc.string;

class DataBuffer
{
public:

	this()
	{
		m_CurrentOffset = 0;
		m_BufferSize = 16;
		m_Buffer = cast(char*)GC.malloc(m_BufferSize);
	}

	~this()
	{
		__delete(m_Buffer);
	}

	void InitBuffer(char* buffer, size_t size)
	{
		m_CurrentOffset = 0;
		m_BufferSize = size;
		GC.realloc(m_Buffer, m_BufferSize);
		memcpy(m_Buffer, buffer, size);
	}

	void Read(char* data, size_t size)
	{
		memcpy(data, (m_Buffer + m_CurrentOffset - size), size);
		m_CurrentOffset -= size; 
	}

	void Write(char* data, size_t size)
	{
		if(size + m_CurrentOffset >= m_BufferSize)
		{
			m_BufferSize += 16;
			GC.realloc(m_Buffer, m_BufferSize);
		}

		memcpy(m_Buffer + m_CurrentOffset, data, size);
		m_CurrentOffset += size;
	}

	void Reset()
	{
		m_CurrentOffset = 0;
		m_BufferSize = 16;
		GC.realloc(m_Buffer, m_BufferSize);
	}

//private:

	char* m_Buffer;

	size_t m_CurrentOffset;
	size_t m_BufferSize;
}