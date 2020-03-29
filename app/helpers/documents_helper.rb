module DocumentsHelper
  def document_icon(file_name)
    if file_name.to_s.upcase.include?('.PDF')
      raw('<i class="far fa-file-pdf document-list-icon"></i>')
    elsif file_name.to_s.upcase.include?('.DOC' || '.DOCX')
      raw('<i class="far fa-file-word document-list-icon"></i>')
    elsif file_name.to_s.upcase.include?('.PPT' || '.PPTX')
      raw('<i class="far fa-file-powerpoint document-list-icon"></i>')
    elsif file_name.to_s.upcase.include?('.XLS' || '.XLSX')
      raw('<i class="far fa-file-excel document-list-icon"></i>')
    elsif file_name.to_s.upcase.include?('PNG' || 'JPG' || 'JPEG' || 'BMP')
      raw('<i class="far fa-file-image document-list-icon"></i>')
    else
      raw('<i class="far fa-file document-list-icon"></i>')
    end
  end
end
