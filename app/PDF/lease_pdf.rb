class LeasePdf < Prawn::Document
  def initialize(lease)
    super()
    @lease = lease

    #---------
    #Show Document
    header

  end

  def header
     draw_text "Kvittering", :at => [220, 550], size: 22

  end

end
