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

 def tenant_name(property_unit)
   "#{Tenant.find(@property_unit.tenant).first_name}
    #{Tenant.find(@property_unit.tenant).last_name}"
 end

 def tenant_email(property_unit)
   Tenant.find(@property_unit.tenant).email
 end

 def tenant_phone(property_unit)
   Tenant.find(@property_unit.tenant).phone_number
 end

 def landlord_email(id)
   User.find(id).email
 end
