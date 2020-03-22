class LeasePdf < Prawn::Document
  include ActionView::Helpers::NumberHelper
  def initialize(lease, property_unit, property)
    super()
    @lease = lease
    @property_unit = property_unit
    @property = property

    font_setup
    #---------
    #Show Document
    header
    stroke_horizontal_rule
    move_down 25
    parts_in_contract
    move_down 90
    contract_about
    move_down 120
    rent_info
    lease_length
    start_new_page
    deposit_guarantee
    move_down 105
    eviction
    move_down 125
    order_and_other
    move_down 180
    signatures

  end

  #------------SETUPS -----------------

  def font_setup
    font_families.update("NotoSans" => {
      :normal => "vendor/assets/fonts/poppins-semibold.ttf",
    })
    font "NotoSans"
  end

  def header
    text "PropGrid", size: 23
    font "Helvetica"
    draw_text "Leiekontrakt", at: [110, 696], size: 15
  end

  def human_boolean(boolean)
    boolean ? "Ja" : "Nei"
  end

  def nok_currency(currency)
    currency ? number_to_currency(currency, :unit => "Kr. ", :delimiter => " ") + ",-" : "Ingen sum registrert"
  end

  def form_checkbox(entry)

    if entry == true
      'fa-check-square-o'
    else
      '<icon size="20">fa-square-o</i>'
    end
  end

  def nor_date(date)
    date ? date.strftime("%d.%m.%Y") : "Ingen dato registrert."
  end



  #------------- CONTRACT -----------------


  def parts_in_contract
    #HEADLINE
    text "1. Partene i avtalen", size: 20
    stroke_horizontal_line 0, 230, :at => 635
    draw_text "Leietakeren", at: [0, 610], size: 15
    draw_text "Utleieren", at: [300, 610], size: 15
    #pad_bottom(20) { text "Kommer under streken" }
    move_down 40
    text_box "<strong>Leietaker:</strong> #{@lease.tenant_name}
              <strong>Epost</strong> stephan@devalo.no
              <strong>Telefonnummer</strong> #{@lease.tenant_phone}
              <strong>Fødselsdato/orgnr</strong>: 170787", at: [0, 592], :inline_format => true, :leading => 3

    text_box "<strong>Utleier: </strong>Stephan Valois
              <strong>Epost:</strong> evicez@gmail.com
              <strong>Telefonnummer:</strong> 933 21 234
              <strong>Fødselsdato/orgnr</strong> 170787", at: [300, 592], :inline_format => true, :leading => 3
  end

  def contract_about
    text "2. Leiekontrakten gjelder", size: 20
    stroke_horizontal_line 0, 230, :at => 483
    text_box "<strong>Type leieobjekt:</strong> #{@property_unit.property_type}
              <strong>Enhetsnummer:</strong> #{@property_unit.unit_number}
              <strong>Adresse: </strong> #{@property.address}
              <strong>Postnummer: </strong> #{@property.postal_code}
              <strong>Sted: </strong>#{@property.city}", at: [0, 470], :inline_format => true, :leading => 3

    text_box "<strong>Bad:</strong> #{human_boolean(@property_unit.bathroom)}
              <strong>Kjøkken:</strong> #{human_boolean(@property_unit.kitchen)}
              <strong>Antall rom: </strong> #{@property_unit.number_of_rooms}
              <strong>Antall boder: </strong> #{@property_unit.storage_spaces}
              <strong>Parkeringsplasser: </strong>#{@property_unit.parking_lots}", at: [300, 470], :inline_format => true, :leading => 3
  end

  def rent_info
    text "3. Husleie", size: 20
    stroke_horizontal_line 0, 230, :at => 340
    text_box "<strong>Husleie per måned:</strong> #{nok_currency(@property_unit.rent)}
              <strong>Forskuddsvis betaling av leie innen denne dato: #{@lease.due_date}
              <strong>Betales inn på kontonummer:</strong> #{@lease.rent_account}", at: [0, 327], :inline_format => true, :leading => 3
    draw_text "Strøm", at: [0, 250], size: 15
    move_down 95
    bounding_box([0, 240], width: 250, height: 50) do
      if @lease.due_date == true

        icon "<strong>Strøm inkludert?</strong> <icon size='13'>fa-check-square-o</icon> ", inline_format: true, at: [0, 50]
      else
        icon "<strong>Strøm inkludert?</strong> <icon size='13'>fa-square-o</icon> ", at: [200, 50], inline_format: true
      end
    end

    draw_text "Vann og avløp", at: [300, 250], size: 15

    bounding_box([300, 240], width: 250, height: 50) do
      if @lease.due_date == true

        icon "<strong>Vann og avløpsutgifter inkludert?</strong> <icon size='13'>fa-check-square-o</icon> ", inline_format: true, at: [0, 50]
      else
        icon "<strong>Vann og avløpsavgifter inkludert?</strong> <icon size='13'>fa-square-o</icon> ", at: [200, 50], inline_format: true
      end
    end
  end

  def lease_length
    text "4. Leiens varighet", size: 20
    stroke_horizontal_line 0, 230, :at => 167
    move_down 10

    if @lease.rent_indefinite == true

      icon "<strong>Tidsubestemt leie?</strong> <icon size='13'>fa-check-square-o</icon> ", inline_format: true, at: [0, 50]
    else
      icon "<strong>Tidsubestemt leie?</strong> <icon size='13'>fa-square-o</icon> ", at: [200, 50], inline_format: true
    end
    text_box "<strong>Startdato for utleie</strong>:  #{nor_date(@lease.rent_start_date)}

              Hvis ikke tidsubestemt
              <strong>Sluttdato for utleie</strong>: #{nor_date(@lease.rent_stop_date)}", at: [0, 120], inline_format: true, leading: 3

  end

  def deposit_guarantee
    text "5. Depositum eller garanti", size: 20
    stroke_horizontal_line 0, 230, :at => 696
    draw_text "Depositum", at: [0, 670], size: 15
    draw_text "Garanti", at: [300, 670], size: 15

    text_box "<strong>Depositumsbeløp:</strong> #{nok_currency(@lease.deposit)}
              <strong>Depositumskonto:</strong> #{@lease.deposit_account}", at: [0, 657], inline_format: true, leading: 3

    text_box "<strong>Garantibeløp:</strong> #{nok_currency(@lease.deposit_guarantee)}
              <strong>Garantiutsteder:</strong> #{@lease.deposit_guarantee_issuer}", at: [300, 657], inline_format: true, leading: 3
  end
  def eviction
    text "6. Utkastelse og særlig tvangsgrunnlag", size: 20
    stroke_horizontal_line 0, 230, :at => 568

    text_box "Leieren godtar at utkastelse (tvangsfravikelse) kan kreves hvis leien ikke blir betalt innen 14 dager etter at skriftlig varsel i henhold til tvangsfullbyrdelsesloven § 4-18 er sendt. Varselet kan sendes tidligst på forfallsdagen, jfr. samme lovs § 13-2, 3.ledd (a). Det skal i varselet framgå at utkasting vil bli krevd dersom kravet ikke blir oppfylt, og at utkasting kan unngås dersom leien blir betalt med renter og kostnader før utkastelsen blir gjennomført. Leieren godtar at utkastelse kan kreves når leietiden er løpt ut, jfr. § 13-2, 3.ledd (b) i tvangsfullbyrdelsesloven.", at: [0, 550]
  end

  def order_and_other
    text "7. Ordensregler og annet", size: 20
    stroke_horizontal_line 0, 230, :at => 418

    bounding_box([0, 400], width: 200, height: 100) do
      if @lease.animals == true

        icon "<strong>Er det lov med dyrehold?</strong> <icon size='13'>fa-check-square-o</icon> ", inline_format: true, at: [0, 50]
        text_box "<strong>Hvilke dyr</strong>: #{@lease.animal_specify}", at: [0, 70], inline_format: true, leading: 3
      else
        icon "<strong>Er det lov med dyrehold?</strong> <icon size='13'>fa-square-o</icon> ", at: [200, 50], inline_format: true
      end
    end

    bounding_box([300, 400], width: 200, height: 100) do
      if @lease.smoking == true

        icon "<strong>Er røyking tillatt inne?</strong> <icon size='13'>fa-check-square-o</icon> ", inline_format: true, at: [0, 50]
      else
        icon "<strong>Er røyking tillatt inne?</strong> <icon size='13'>fa-square-o</icon> ", at: [200, 50], inline_format: true
      end
      move_down 10
      if @lease.cable_tv == true

        icon "<strong>Er kabel-TV inkludert?</strong> <icon size='13'>fa-check-square-o</icon> ", inline_format: true, at: [0, 50]
      else
        icon "<strong>Er kabel-TV inkludert?</strong> <icon size='13'>fa-square-o</icon> ", at: [200, 50], inline_format: true
      end
      move_down 10
      if @lease.internet == true

        icon "<strong>Er internett inkludert?</strong> <icon size='13'>fa-check-square-o</icon> ", inline_format: true, at: [0, 50]
      else
        icon "<strong>Er internett inkludert?</strong> <icon size='13'>fa-square-o</icon> ", at: [200, 50], inline_format: true
      end
    end
    text_box "<strong>Annet:</strong>
              #{@lease.other_description}", at: [0, 300], inline_format: true
  end
  def signatures
    text "8. Underskrifter", size: 20
    stroke_horizontal_line 0, 230, :at => 97

    move_down 20
    text "Her kommer en måte for å utføre digital signering"

  end
end
