import std.stdio;
import std.file;
import std.conv;
import std.path;

void main()
{
	writeln("Enter directory: ");
	string dir = readln()[0..$-1];

	writeln("Enter index char to delete: ");
	size_t delindex = readln()[0..$-1].to!size_t;

	foreach (filename; listdir(dir))
		rename(buildPath(dir, filename), buildPath(dir, filename[delindex .. $]));
}



string[] listdir(string pathname)
{
    import std.algorithm;
    import std.array;
    import std.file;
    import std.path;

    return std.file.dirEntries(pathname, SpanMode.shallow)
        .filter!(a => a.isFile)
        .map!((return a) => std.path.baseName(a.name))
        .array;
}
