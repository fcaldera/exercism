defmodule LibraryFees do
  def datetime_from_string(string) do
    elem(NaiveDateTime.from_iso8601(string), 1)
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.compare(~T[12:00:00])
    |> then(&(&1 == :lt))
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29

    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(days)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> ensure_min(0)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> then(fn day -> day == 1 end)
  end

  def calculate_late_fee(checkout, return, rate) do
    actual_return_date = datetime_from_string(return)
    discount = if(monday?(actual_return_date), do: 0.5, else: 1)

    checkout
    |> datetime_from_string()
    |> return_date()
    |> days_late(actual_return_date)
    |> then(fn days -> days * rate * discount end)
    |> trunc()
  end

  defp ensure_min(value, min) when value < min, do: min
  defp ensure_min(value, _min), do: value
end
