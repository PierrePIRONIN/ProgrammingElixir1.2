## Your turn : ControlFlow-3

Many built-in functions have two forms. The xxx form returns the tuple {:ok, data} and the xxx! form returns data on success but raises an exception
otherwise.    
However, some functions don’t have the xxx! form.

Write an ok! function that takes an arbitrary parameter. If the parameter is the tuple {:ok, data} , return the data. Otherwise, raise an exception containing information from the parameter.    
You could use your function like this `file = ok! File.open("somefile")`

## My implementation
```elixir
iex(1)> defmodule RaiseOrNot do
...(1)>     def ok!({:ok, value}), do: value
...(1)>     def ok!({errorCode, errorValue}), do: raise("An unexpected error occured -> #{errorCode} : #{errorValue}")
...(1)> end
iex:1: warning: redefining module RaiseOrNot
{:module, RaiseOrNot,
 <<70, 79, 82, 49, 0, 0, 7, 68, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 149, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:ok!, 1}}
 
iex(2)> RaiseOrNot.ok! File.open("./existing_file.txt")
#PID<0.67.0>

iex(3)> RaiseOrNot.ok! File.open("./not_existing_file.txt")
** (RuntimeError) An unexpected error occured -> error : enoent
    iex:3: RaiseOrNot.ok!/1
```
