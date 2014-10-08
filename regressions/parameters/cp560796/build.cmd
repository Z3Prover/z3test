copy C:\z3\debug\Microsoft.Z3.* . /y
copy C:\z3\debug\libz3.* . /y
csc Program.cs /r:Microsoft.Z3.dll /platform:x86