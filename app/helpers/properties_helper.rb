module PropertiesHelper

  def property_name
    "#{@property.address} #{@property.property_number}"
  end
end
