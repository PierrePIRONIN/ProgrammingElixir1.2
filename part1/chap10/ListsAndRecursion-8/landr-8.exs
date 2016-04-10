defmodule TaxComputation do
  def apply_tax(order = [id: _, ship_to: state, net_amount: net_amount], tax_rates) do
    tax = Keyword.get(tax_rates, state, 0)
    Keyword.put(order, :total_amount, net_amount * (1 + tax))
  end

  def compute(orders, tax_rates) do
    Enum.map(orders, &(apply_tax(&1, tax_rates)))
  end
end
