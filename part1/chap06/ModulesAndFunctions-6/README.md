## Your turn : ModulesAndFunctions-6

I’m thinking of a number between 1 and 1000....    

The most efficient way to find the number is to guess halfway between the low and high numbers of the range. If our guess is too big, then the answer lies between the bottom of the range and one less than our guess. If our guess is too small, then the answer lies between one more than our guess and the end of the range.

Your API will be `guess(actual, range)`, where range is an Elixir range.

Your output should look similar to this:
```elixir
iex> Chop.guess(273, 1..1000)
Is it 500
Is it 250
Is it 375
Is it 312
Is it 281
Is it 265
Is it 273
273
```
Hints:
- You may need to implement helper functions with an additional parameter (the currently guessed number).
- The `div(a,b)` function performs integer division.
- Guard clauses are your friends.
- Patterns can match the low and high parts of a range ( a..b=4..8 ).

=> My implementation
```elixir
iex(1)> defmodule Chope do
...(1)>   def guess(actual, range=low..high) do
...(1)>     guess = div(low+high, 2)
...(1)>     IO.puts "Is it #{guess}?"
...(1)>     _guess(actual, guess, range)
...(1)>   end
...(1)> 
...(1)>   def _guess(actual, actual, _) do
...(1)>     IO.puts "Yes, it's #{actual}"
...(1)>   end
...(1)> 
...(1)>   def _guess(actual, guess, _low..high) when guess < actual do
...(1)>     guess(actual, guess+1..high)
...(1)>   end
...(1)> 
...(1)>   def _guess(actual, guess, low..high) when guess > actual do
...(1)>     guess(actual, low..guess+1)
...(1)>   end
...(1)> 
...(1)> end
iex:16: warning: variable high is unused
{:module, Chope,
 <<70, 79, 82, 49, 0, 0, 9, 208, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 1, 3, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:_guess, 3}}

iex(2)> Chope.guess(273, 1..1000)
Is it 500?
Is it 251?
Is it 376?
Is it 314?
Is it 283?
Is it 268?
Is it 276?
Is it 273?
Yes, it's 273
:ok
```
