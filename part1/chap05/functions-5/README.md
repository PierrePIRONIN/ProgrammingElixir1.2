## Your turn : Functions-5

Use the & ... notation to rewrite the following:
- `Enum.map [1,2,3,4], fn x -> x + 2 end`
- `Enum.each [1,2,3,4], fn x -> IO.inspect x end`

=> My implementation
```elixir
iex(1)> Enum.map [1,2,3,4], &(&1 + 2)      
[3, 4, 5, 6]

iex(2)> Enum.each [1,2,3,4], &(IO.inspect &1)
1
2
3
4
:ok
```
