defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort(inventory, fn a, b -> a.price <= b.price end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &is_nil(&1.price))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      Map.update!(item, :name, &String.replace(&1, old_word, new_word))
    end)
  end

  def increase_quantity(item, count) do
    Map.update!(
      item,
      :quantity_by_size,
      &Map.new(&1, fn {k, v} -> {k, v + count} end)
    )
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.map(fn {_k, v} -> v end)
    |> Enum.sum()
  end
end
