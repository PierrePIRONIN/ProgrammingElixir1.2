defmodule TaxComputation do
  def compute(orders, tax_rates) do
    Enum.map(orders, &(apply_tax(&1, tax_rates)))
  end

  def compute_from_file(filename, tax_rates) do
    [header | data] = Enum.to_list(File.stream!(filename))
    header = String.strip(header) |> String.split(",")

    Enum.map(data, &(split_fields(&1)))
    |> Enum.map(&(as_order(header, &1)))
    |> compute(tax_rates)
  end

  defp apply_tax(order = [id: _, ship_to: state, net_amount: net_amount], tax_rates) do
    tax = Keyword.get(tax_rates, state, 0)
    Keyword.put(order, :total_amount, net_amount * (1 + tax))
  end

  defp split_fields(line) do
    String.rstrip(line)
    |> String.split(",")
  end

  defp as_order(header, fields) do
    Enum.zip(header, fields)
    |> Enum.map(&(convert_values(&1)))
    |> Keyword.new(fn {header, value} -> {String.to_atom(header), value} end)
  end

  defp convert_values({key = "id", value}), do: {key, String.to_integer(value)}
  defp convert_values({key = "ship_to", value}), do: {key, String.to_atom(String.lstrip(value, ?:))}
  defp convert_values({key = "net_amount", value}), do: {key, String.to_float(value)}

end
