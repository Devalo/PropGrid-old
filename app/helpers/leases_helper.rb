module LeasesHelper

  def show_proper_links_if_or_not_lease_exist
  lease = Lease.find_by(property_unit_id: @property_unit.id)

    if lease
      if lease.property_unit_id == @property_unit.id
        link_to "Se kontrakt", property_property_unit_lease_path(@property, @property_unit, lease)
        link_to property_property_unit_lease_path(@property, @property_unit, lease) do
          raw('<div class="document-item"><i class="far fa-file" id="document-folder"></i><br>Se kontrakt</div>')
        end
      end
    else
      link_to new_property_property_unit_lease_path(@property, @property_unit) do
        raw('<div class="document-item"><i class="far fa-file" id="document-folder"></i><br>Opprett leiekontrakt</div>')
      end
    end
  end
end
