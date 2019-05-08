import std.stdio;
import core.memory;
import core.stdc.string;

static int SIZE = 100;

class Queue(T)
{
public:

	this(int size = SIZE)
	{
		assert(size > 0, "Size must be greater than zero.");
		m_Size = size;
		m_Array = cast(T*)GC.malloc(m_Size * T.sizeof);
		m_Front = 0;
		m_Rear = -1;
		m_Count = 0;
	}

	~this()
	{
		__delete(m_Array);
	}

	void enqueue(T t)
	{
		if(isFull())
		{
			T* tempArray = cast(T*)GC.malloc(m_Count * T.sizeof);
			memcpy(tempArray ,m_Array, m_Count);
			m_Size += SIZE;
			writeln(m_Array[0]);
			GC.realloc(m_Array, m_Size * T.sizeof);
			memcpy(m_Array, tempArray, m_Count);
			writeln(tempArray[0]);
			__delete(tempArray);
		}

		m_Rear = (m_Rear + 1) % m_Size;
		m_Array[m_Rear] = t;
		m_Count++;
	}

	T dequeue()
	{
		assert(!isEmpty());

		if(m_Size - m_Count > SIZE)
		{
			T* tempArray = cast(T*)GC.malloc(m_Count * T.sizeof);
			memcpy(tempArray, m_Array, m_Count);
			m_Size -= SIZE;
			GC.realloc(m_Array, m_Size * T.sizeof);	
			memcpy(m_Array, tempArray, m_Count);
			__delete(tempArray);
		}

		T tempData = m_Array[m_Front];

		m_Front = (m_Front + 1) % m_Size;
		m_Count--;

		return tempData;
	}

	T peek()
	{
		assert(!isEmpty());

		return m_Array[m_Front];
	}

	bool isFull()
	{
		return (m_Count == m_Size);
	}

	bool isEmpty()
	{
		return (m_Count == 0);
	}

private:

	T* m_Array;
	int m_Front;
	int m_Rear;
	int m_Count;
	int m_Size;
}

void main()
{
	auto queue = new Queue!(int)(1);
	queue.enqueue(10);
	writeln("debug");
	queue.enqueue(5);
	writeln(queue.peek());
	writeln(queue.dequeue());

	return;
}