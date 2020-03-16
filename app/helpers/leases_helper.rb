module LeasesHelper

  def show_proper_links_if_or_not_lease_exist
  lease = Lease.find_by(property_unit_id: @property_unit.id)

    if lease
      if lease.property_unit_id == @property_unit.id
        link_to "Se kontrakt", property_property_unit_lease_path(@property, @property_unit, lease)
      end
    else
      link_to "Opprett leiekontrakt", new_property_property_unit_lease_path(@property, @property_unit)
    end
  end
end
