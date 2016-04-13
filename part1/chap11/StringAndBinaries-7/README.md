## Your turn : StringAndBinaries-

Chapter 7 had an exercise about calculating sales tax on page 108. 

We now have the sales information in a file of comma-separated `id` , `ship_to` ,and `amount` values. The file looks like this:
```csv
id,ship_to,net_amount
123,:NC,100.00
124,:OK,35.50
125,:TX,24.00
126,:TX,44.80
127,:NC,25.00
128,:MA,10.00
129,:CA,102.00
120,:NC,50.00
```
Write a function that reads and parses this file and then passes the result to the sales_tax function. Remember that the data should be formatted into
a keyword list, and that the fields need to be the correct types (so the id field is an integer, and so on).

You’ll need the library functions File.open , IO.read(file, :line) , and IO.stream(file) .

## My implementation
```elixir
iex(1)> defmodule TaxComputation do
...(1)>   def compute(orders, tax_rates) do
...(1)>     Enum.map(orders, &(apply_tax(&1, tax_rates)))
...(1)>   end
...(1)> 
...(1)>   def compute_from_file(filename, tax_rates) do
...(1)>     [header | data] = Enum.to_list(File.stream!(filename))
...(1)>     header = String.strip(header) |> String.split(",")
...(1)> 
...(1)>     Enum.map(data, &(split_fields(&1)))
...(1)>     |> Enum.map(&(as_order(header, &1)))
...(1)>     |> compute(tax_rates)
...(1)>   end
...(1)> 
...(1)>   defp apply_tax(order = [id: _, ship_to: state, net_amount: net_amount], tax_rates) do
...(1)>     tax = Keyword.get(tax_rates, state, 0)
...(1)>     Keyword.put(order, :total_amount, net_amount * (1 + tax))
...(1)>   end
...(1)> 
...(1)>   defp split_fields(line) do
...(1)>     String.rstrip(line)
...(1)>     |> String.split(",")
...(1)>   end
...(1)> 
...(1)>   defp as_order(header, fields) do
...(1)>     Enum.zip(header, fields)
...(1)>     |> Enum.map(&(convert_values(&1)))
...(1)>     |> Keyword.new(fn {header, value} -> {String.to_atom(header), value} end)
...(1)>   end
...(1)> 
...(1)>   defp convert_values({key = "id", value}), do: {key, String.to_integer(value)}
...(1)>   defp convert_values({key = "ship_to", value}), do: {key, String.to_atom(String.lstrip(value, ?:))}
...(1)>   defp convert_values({key = "net_amount", value}), do: {key, String.to_float(value)}
...(1)> 
...(1)> end
{:module, TaxComputation,
 <<70, 79, 82, 49, 0, 0, 15, 16, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 1, 5, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:convert_values, 1}}
iex(2)> tax_rates = [ NC: 0.075, TX: 0.08 ]            
[NC: 0.075, TX: 0.08]
iex(3)> TaxComputation.compute_from_file("./data.csv", tax_rates)
[[total_amount: 107.5, id: 123, ship_to: :NC, net_amount: 100.0],
 [total_amount: 35.5, id: 124, ship_to: :OK, net_amount: 35.5],
 [total_amount: 25.92, id: 125, ship_to: :TX, net_amount: 24.0],
 [total_amount: 48.384, id: 126, ship_to: :TX, net_amount: 44.8],
 [total_amount: 26.875, id: 127, ship_to: :NC, net_amount: 25.0],
 [total_amount: 10.0, id: 128, ship_to: :MA, net_amount: 10.0],
 [total_amount: 102.0, id: 129, ship_to: :CA, net_amount: 102.0],
 [total_amount: 53.75, id: 120, ship_to: :NC, net_amount: 50.0]]
```
