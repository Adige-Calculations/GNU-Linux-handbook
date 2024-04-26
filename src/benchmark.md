# Benchmark for performances

An utility to benchmark progammes is```perf```, a profiling tool. To spin it up:

```sh
perf stat ./my_programme
```

The best resource I know is on [Brendan Gregg’s site](https://www.brendangregg.com/perf.html),

## Hardware counters

So, let’s imagine you want to know exactly how many CPU instructions happen when you run ```ls```.
It turns out that your CPU stores information about this kind of thing, and ```perf``` can tell 
you. Here’s what the answer looks like, from perf stat.

```sh
sudo perf stat ls
       1,482,453 instructions              #    0.48  insns per cycle        
```

One of the first processors to implement such counter and an associated instruction RDPMC to 
access it was the Intel Pentium. We can use http://livegrep.com to search the Linux kernel 
for the RDPMC instruction. Here’s it being used in a cryptic header file called ```msr.h```:

```c
static inline unsigned long long native_read_pmc(int counter)
{
    DECLARE_ARGS(val, low, high);

    asm volatile("rdpmc" : EAX_EDX_RET(val, low, high) : "c" (counter));
    return EAX_EDX_VAL(val, low, high);
}
```

This is AWESOME. Maybe this is how Linux reads hardware counters and gives them back to us 
in perf stat!! Further grepping for uses of ```native_read_pmc``` reveals that we read 
hardware counters via rdpmcl in ```x86/kernel/cpu/perf_event.c```.

This code is a little impenetrable to me, but here’s a hypothesis for how this could work. Let’s say we’re running ls. This code might get scheduled on and off the CPU a few times.

So! Here’s what I think this looks like.


- kernel: ok let's run ls for a while
- kernel: CPU! Start counting CPU instructions!
- CPU: <complies silently>
- kernel: <runs ls>
- ls: yayyyyyyyyyy
- kernel: <stops running ls>
- kernel: CPU! How many instructions was that! (`rdpmc`)
- CPU: 10,200!
- kernel: <increments counter by 10,200>

One important outcome of this, if I understand correctly is – hardware counters are 
exact counters, and they’re low enough overhead that the kernel can just always run RDPCM 
every time it’s done running a piece of code. There’s no sampling or approximations involved.

## Sampling software events

The core of perf events looks like it’s in ```kernel/events/core.c```. This file includes
the definition of the ```perf_event_open``` system call, on line 8107. Files with 10,000 
lines of C code are not my specialty, but I’m going to try to make something of this.

My goal: understand how perf does sampling of CPU events. For the sake of argument, let’s 
pretend we only wanted to save the state of the CPU’s registers every time we sample.

We know from the perf_event_open man page that perf writes out events to userspace (“hi! I 
am in julia’s awesome function right now!”). It writes events to a mmap’d ring buffer. 
Which is some data structure in memory. Okay.

Further inspection of this 10,000 line core.c file reveals that the code outputs data to 
userspace in the ```perf_event_update_userpage``` function.

So, let’s find the code that copies all the x86 registers into userspace! It turns out it’s 
not too hard to find – it’s in this file called ```perf_regs.c```. There are like 15 registers 
to copy! Neat.

In this case it makes sense that we sample – we definitely couldn’t save all the registers
every instruction. That would be way too much work!

So now I can see a little tiny bit of the code that perf uses to do sampling. This isn’t 
terribly enlightening, but it does make me feel better.

<b> Questions </b>

>when does perf do its sampling? is it when the process gets scheduled onto the CPU? how is the sampling triggered? I am completely confused about this.
>what is the relationship between perf and kprobes? if I just want to sample the registers / address of the instruction pointer from ls’s execution, does that have anything to do with kprobes? with ftrace? I think it doesn’t, and that I only need kprobes if I want to instrument a kernel function (like a system call), but I’m not sure.
>are kprobes and ftrace the same kernel system? I feel like they are but I am confused.


<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
