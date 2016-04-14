## Your turn : WorkingWithMultipleProcesses-8

Run the Fibonacci code on your machine. Do you get comparable timings?
If your machine has multiple cores and/or processors, do you see improvements in the timing as we increase the application’s concurrency?

## My implementation
```bash
$ elixir wwmp-8.exs 
wwmp-8.exs:1: warning: redefining module FibSolver
wwmp-8.exs:20: warning: redefining module Scheduler
[{37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}, {37, 24157817}]

 #   time (s)
 1     5.45
 2     4.23
 3     2.66
 4     2.39
 5     2.50
 6     2.20
 7     2.19
 8     2.21
 9     2.19
10     2.27
```
