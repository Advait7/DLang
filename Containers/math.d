/**
 * {name}
 */
class Math
{
	this()
	{
		
	}

	template
	T Add(T a, T b)
	{
		return a + b;
	}

	template T
	T Subtract(T a, T b)
	{
		return a - b;
	}

	template T
	T Multiply(T a, T b)
	{
		return a * b;
	}

	template T 
	T Add(T a, T b)
	{
		assert(b == 0);
		return a / b;
	}	
}