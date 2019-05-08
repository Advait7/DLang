import std.stdio;
import core.memory;

static int SIZE = 100;

class Stack(T)
{
public:

	this(int size = SIZE)
	{
		assert(size > 0, "Size must be greater than zero.");
		m_Size = size;
		m_Array = cast(T*)GC.malloc(m_Size * T.sizeof);
		m_Top = -1;
	}

	~this()
	{
		__delete(m_Array);
	}

	void push(T t)
	{	
		if(isFull())
		{
			m_Size += SIZE;
			GC.realloc(m_Array, m_Size * T.sizeof);
		}

		m_Array[++m_Top] = t;
	}

	T pop()
	{
		assert(!isEmpty());

		if(m_Size - (m_Top + 1) > SIZE)
		{
			m_Size -= SIZE;
			GC.realloc(m_Array, m_Size * T.sizeof);	
		}

		return m_Array[m_Top--];
	}

	T peek()
	{
		assert(!isEmpty());

		return m_Array[m_Top];
	}

	bool isFull()
	{
		if(m_Top == m_Size -1)
			return true;

		return false;
	}

	bool isEmpty()
	{
		if(m_Top == -1)
			return true;

		return false;
	}

	int size()
	{
		return m_Size;
	}

private:

	T* m_Array;
	int m_Top;
	int m_Size;
}

void main()
{
	auto stack = new Stack!(int)(1);
	stack.push(10);
	writeln(stack.peek());
	writeln(stack.pop());

	return;
}