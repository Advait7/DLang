import std.stdio;
import std.exception;

import binarydatastream;

void main()
{
	BinaryDataStream m_BinaryDataStream = new BinaryDataStream();

	int a = 10;
	int b = 5;

	char c = 'c';
	char d = 'd';

	double e = 100.0;
	double f = 200.0;

	enforce(m_BinaryDataStream !is null, "m_BinaryDataStream is null");


	m_BinaryDataStream.Serialize(a);
	m_BinaryDataStream.Serialize(b);
	
	m_BinaryDataStream.Serialize(c);
	m_BinaryDataStream.Serialize(d);
	
	m_BinaryDataStream.Serialize(e);
	m_BinaryDataStream.Serialize(f);
	
	m_BinaryDataStream.Deserialize(e);
	m_BinaryDataStream.Deserialize(f);

	m_BinaryDataStream.Deserialize(c);
	m_BinaryDataStream.Deserialize(d);

	m_BinaryDataStream.Deserialize(a);
	m_BinaryDataStream.Deserialize(b);


	writeln("a: ", a);
	writeln("b: ", b);
	writeln("c: ", c);
	writeln("d: ", d);
	writeln("e: ", e);
	writeln("f: ", f);

	return;
}