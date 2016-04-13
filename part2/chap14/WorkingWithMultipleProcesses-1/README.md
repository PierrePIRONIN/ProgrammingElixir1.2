## Your turn : WorkingWithMultipleProcesses-1

Run this code on your machine. See if you get comparable results

## My implementation
```bash
$ elixir -r wwmp-1.exs -e "Chain.run(10)"
{3439, "Result is 10"}

$ elixir -r wwmp-1.exs -e "Chain.run(100)"
{3691, "Result is 100"}

$ elixir -r wwmp-1.exs -e "Chain.run(1_000)"
{6646, "Result is 1000"}

$ elixir -r wwmp-1.exs -e "Chain.run(10_000)"
{51308, "Result is 10000"}

$ elixir --erl "+P 1000000" -r wwmp-1.exs -e "Chain.run(400_000)"
{1876314, "Result is 400000"}

$ elixir --erl "+P 1000000" -r wwmp-1.exs -e "Chain.run(1_000_000)"
{4465984, "Result is 1000000"}
```
