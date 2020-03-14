module ApplicationHelper

  # brukes for å vise Ja eller Nei, istedet for True eller False
  def human_boolean(boolean)
    boolean ? "Ja" : "Nei"
  end

  def nok_currency(currency)
    if currency
      number_to_currency(currency, :unit => "Kr. ", :delimiter => " ") + ",-"
    end
  end
end
