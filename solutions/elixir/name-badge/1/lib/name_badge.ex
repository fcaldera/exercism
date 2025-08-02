defmodule NameBadge do
  def print(id, name, department) do
    dep_label = if(department, do: String.upcase(department), else: "OWNER")
    id_label = if(id, do: "[#{id}] - ")
    "#{id_label}#{name} - #{dep_label}"
  end
end
