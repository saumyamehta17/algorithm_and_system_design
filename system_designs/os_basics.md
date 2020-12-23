### In old days, CPU had one core

1 CPU core can only run one process at a time. but number of processes is not limited by the number of CPU cores. they are kept in memory. often Process waits for I/O or other calls, mean while instead of sitting ideal, OS switch to another process which are not waiting. Thus we usually have many more processes than CPUs. 

Steps:
Program/application is code which is stored on computer, program such as web browsing, emailing, playing music etc. Program typically stored on disk in a form that can be executed by computer. Prior to that they created with some languages. Then code is either compiled(converting to binary form in advance in order to run) or interpreted(converting to binary form at time of run) but end result is same. 

one core can run one instruction set at a time

When program is run then it is loaded into memory in binary form. Now these programs become active processes and now CPU will turn them into running process. There can multiple instance of this program loaded in memory but running instance is a process.

Then these process needs resources like:
Register - hold an instruction, storage address
Program Counter - keeps track where computer is in its program sequence
Stack - store info about sub-routines
Heap - dynamically allocated memory

Each process has separate memory space. They can not share data of each other process. Switching from one process to another do: saving and loading register, memory maps etc

Thread is unit of execution within process/application(Multithreaded Process). Threads will have their own stack and register but share same memory/heap and will share data(heap). Problem can occur when access to shared resources is not properly controlled. Data corruption is a common side effects of having more than one threads simultenously write to same block of memory.

There two types of threads: 
1) System level/ Kernel level threads - starting point of application
2) User level/application level threads 

Monitors and Semaphores (synchronization contructs)
Application threads use these to protect the shared resource. Both exist to achieve similiar goals. Thread synchronization does not come for free, it take time to acquire and release locks.

Example: A couple withdraw money from same account at same time. If withdraw block is not synchronized then both users will enter their at same time and money will be deducted twice but reported once.



Deadlocks
when threads need to acquire two locks before proceeding. But two threads acquired them in different order.


Do process share memory?
How CPU scheduling works?
	

Busy Waiting and how it can be avoided?
if threads waits for another thread to complete because some sort dependency between two. then first thread is active but only waiting for 2nd thread, in this way it still stealing CPU cycle for itself and doing nothing. This CPU cycle should be used for some real work instead. So, it can avoided by using 'wait' and 'notify' where 1st thread can sleep and 2nd thread can notify 1st thread when its done.
Example: Producer and Consumer	




In one core, CPU is shared among process and use process scheduling algo that divides CPU time. Time given to each process is 'time slice'


https://www.backblaze.com/blog/whats-the-diff-programs-processes-and-threads/

### Compilation & Interpretation

Compiler - which create a executable file(machine understandable file) and can transfer to others.
 Advantage:
  Ready to run, source code is not public, 
 Disadvantages:
  platform-dependency(may be same executable file will not run on mac)

Interpreter - which sends source code instead and created executable code later when needed. 
Advantage:
  cross-platform
  simpler to test
Disadvantage:
  interpreter required
  source code is public, like javascript on web browser

### Static vs Dynamic typed language
  
Static typing refers the following qualities:

• The compiler unearths type errors at compile time.

• Visible type information serves as documentation.

• Compiled code is optimized to run quickly.

These qualities represent strengths in a programming language only if you accept this set of corresponding assumptions:

• Runtime type errors will occur unless the compiler performs type checks.

• Programmers will not otherwise understand the code; they cannot infer an object’s type from its context.

• The application will run too slowly without these optimizations. 

Dynamic typing proponents list these qualities:

• Code is interpreted and can be dynamically loaded; there is no compile/make cycle.

• Source code does not include explicit type information.

• Metaprogramming is easier.

These qualities are strengths if you accept this set of assumptions:

• Overall application development is faster without a compile/make cycle.

• Programmers find the code easier to understand when it does not contain type declarations; they can infer an object’s type from its context.

• Metaprogramming is a desirable language feature. 

