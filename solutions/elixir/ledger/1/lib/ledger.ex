defmodule Ledger do
  @doc """
  Format the given entries given a currency and locale
  """
  @type currency :: :usd | :eur
  @type locale :: :en_US | :nl_NL
  @type entry :: %{amount_in_cents: integer(), date: Date.t(), description: String.t()}

  @spec format_entries(currency(), locale(), list(entry())) :: String.t()
  def format_entries(_, locale, []), do: format_header(locale: locale)

  def format_entries(currency, locale, entries) do
    opts = [currency: currency, locale: locale]

    header = format_header(opts)

    entries =
      entries
      |> Enum.sort_by(&to_sort_tuple/1)
      |> Enum.map(&format_entry(&1, opts))
      |> Enum.join("\n")

    header <> entries <> "\n"
  end

  defp to_sort_tuple(entry) do
    {entry.date.day, entry.description, entry.amount_in_cents}
  end

  defp format_header(opts) do
    case opts[:locale] do
      :en_US -> "Date       | Description               | Change       \n"
      :nl_NL -> "Datum      | Omschrijving              | Verandering  \n"
    end
  end

  defp format_entry(entry, opts) do
    date = format_date(entry.date, opts)

    amount =
      (entry.amount_in_cents / 100)
      |> format_currency(opts)
      |> String.pad_leading(14, " ")

    description = format_text(entry.description)

    date <> "|" <> description <> " |" <> amount
  end

  defp format_text(text) do
    " " <>
      cond do
        String.length(text) > 26 -> String.slice(text, 0, 22) <> "..."
        true -> String.pad_trailing(text, 25, " ")
      end
  end

  defp format_date(date, opts) do
    case opts[:locale] do
      :en_US -> Calendar.strftime(date, "%m/%d/%Y ")
      :nl_NL -> Calendar.strftime(date, "%d-%m-%Y ")
    end
  end

  defp format_currency(amount, opts) do
    symbol =
      case opts[:currency] do
        :eur -> "€"
        :usd -> "$"
      end

    number_str =
      format_number(
        abs(amount),
        case opts[:locale] do
          :en_US -> [separator: ".", delimiter: ","]
          :nl_NL -> [separator: ",", delimiter: "."]
        end
      )

    case {opts[:locale], amount >= 0} do
      {:en_US, true} -> "  #{symbol}#{number_str} "
      {:en_US, false} -> " (#{symbol}#{number_str})"
      {:nl_NL, true} -> " #{symbol} #{number_str} "
      {:nl_NL, false} -> " #{symbol} -#{number_str} "
    end
  end

  defp format_number(number, opts) do
    precision = Keyword.get(opts, :precision, 2)
    separator = Keyword.get(opts, :separator, ".")
    delimiter = Keyword.get(opts, :delimiter, ",")

    rounded = Float.round(number, precision)
    integer_part = trunc(rounded)
    decimal_part = abs(rounded - integer_part) |> Float.round(precision)

    integer_str =
      integer_part
      |> abs()
      |> Integer.to_string()
      |> String.graphemes()
      |> Enum.reverse()
      |> Enum.chunk_every(3)
      |> Enum.join(delimiter)
      |> String.reverse()

    integer_str = if integer_part < 0, do: "-#{integer_str}", else: integer_str

    if precision > 0 do
      decimal_str =
        decimal_part
        |> Float.to_string()
        |> String.slice(2..(1 + precision))
        |> String.pad_trailing(precision, "0")

      "#{integer_str}#{separator}#{decimal_str}"
    else
      integer_str
    end
  end
end
