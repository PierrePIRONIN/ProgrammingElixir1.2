## Your turn : Nodes-1

Set up two terminal windows, and go to a different directory in each. Then start up a named node in each. In one window, write a function that lists the contents of the current directory.
`fun = fn -> IO.puts(Enum.join(File.ls!, ",")) end`
Run it twice, once on each node.

## My implementation
```bash
iex(node_one@carmelide)1> func = fn -> IO.puts(Enum.join(File.ls!, ",")) end
#Function<20.54118792/0 in :erl_eval.expr/5>

iex(node_one@carmelide)3> spawn(func)
.idea,part2,README.md,.git,programming-elixir.iml,.gitignore,part1
#PID<0.67.0>

iex(node_one@carmelide)4> Node.spawn(:"node_two@carmelide", func)
#PID<9121.68.0>
README.md,main.ts,plugin,tsd.json,tests,examples,run_tests.sh,.git,typings,modules,.gitmodules,system_config.js,package.js
```
