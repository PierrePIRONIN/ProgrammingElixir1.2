## Your turn : ListsAndRecursions-8

The Pragmatic Bookshelf has offices in Texas (TX) and North Carolina (NC), so we have to charge sales tax on orders shipped to these states.
The rates can be expressed as a keyword list:
```elixir
tax_rates = [ NC: 0.075, TX: 0.08 ]
```
Here’s a list of orders:
```elixir
orders = [
    [ id: 123, ship_to: :NC, net_amount: 100.00 ],
    [ id: 124, ship_to: :OK, net_amount: 35.50 ],
    [ id: 125, ship_to: :TX, net_amount: 24.00 ],
    [ id: 126, ship_to: :TX, net_amount: 44.80 ],
    [ id: 127, ship_to: :NC, net_amount: 25.00 ],
    [ id: 128, ship_to: :MA, net_amount: 10.00 ],
    [ id: 129, ship_to: :CA, net_amount: 102.00 ],
    [ id: 130, ship_to: :NC, net_amount: 50.00 ] ]
```

Write a function that takes both lists and returns a copy of the orders, but with an extra field, total_amount , which is the net plus sales tax. If a
shipment is not to NC or TX, there’s no tax applied.

## My implementation
```elixir
iex(1)> tax_rates = [ NC: 0.075, TX: 0.08 ]
[NC: 0.075, TX: 0.08]
iex(2)> orders = [
...(2)>     [ id: 123, ship_to: :NC, net_amount: 100.00 ],
...(2)>     [ id: 124, ship_to: :OK, net_amount: 35.50 ],
...(2)>     [ id: 125, ship_to: :TX, net_amount: 24.00 ],
...(2)>     [ id: 126, ship_to: :TX, net_amount: 44.80 ],
...(2)>     [ id: 127, ship_to: :NC, net_amount: 25.00 ],
...(2)>     [ id: 128, ship_to: :MA, net_amount: 10.00 ],
...(2)>     [ id: 129, ship_to: :CA, net_amount: 102.00 ],
...(2)>     [ id: 130, ship_to: :NC, net_amount: 50.00 ] ]
[[id: 123, ship_to: :NC, net_amount: 100.0],
 [id: 124, ship_to: :OK, net_amount: 35.5],
 [id: 125, ship_to: :TX, net_amount: 24.0],
 [id: 126, ship_to: :TX, net_amount: 44.8],
 [id: 127, ship_to: :NC, net_amount: 25.0],
 [id: 128, ship_to: :MA, net_amount: 10.0],
 [id: 129, ship_to: :CA, net_amount: 102.0],
 [id: 130, ship_to: :NC, net_amount: 50.0]]
 
iex(3)> defmodule TaxComputation do
...(3)>   def apply_tax(order = [id: _, ship_to: state, net_amount: net_amount], tax_rates) do
...(3)>     tax = Keyword.get(tax_rates, state, 0)
...(3)>     Keyword.put(order, :total_amount, net_amount * (1 + tax))
...(3)>   end
...(3)> 
...(3)>   def compute(orders, tax_rates) do
...(3)>     Enum.map(orders, &(apply_tax(&1, tax_rates)))
...(3)>   end
...(3)> end
iex:3: warning: redefining module TaxComputation
{:module, TaxComputation,
 <<70, 79, 82, 49, 0, 0, 8, 0, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 252, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:compute, 2}}
 
iex(4)> TaxComputation.compute(orders, tax_rates)
[[total_amount: 107.5, id: 123, ship_to: :NC, net_amount: 100.0],
 [total_amount: 35.5, id: 124, ship_to: :OK, net_amount: 35.5],
 [total_amount: 25.92, id: 125, ship_to: :TX, net_amount: 24.0],
 [total_amount: 48.384, id: 126, ship_to: :TX, net_amount: 44.8],
 [total_amount: 26.875, id: 127, ship_to: :NC, net_amount: 25.0],
 [total_amount: 10.0, id: 128, ship_to: :MA, net_amount: 10.0],
 [total_amount: 102.0, id: 129, ship_to: :CA, net_amount: 102.0],
 [total_amount: 53.75, id: 130, ship_to: :NC, net_amount: 50.0]]
```
