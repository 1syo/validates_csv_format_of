module ValidatesCsvFormatOf::Base
  def validate_csv_format(value, options = {})
    CSV.open(value, 'r', options.slice(*available_options))
    true
  rescue
    false
  end

  def available_options
    [
      :encoding,
      :col_sep,
      :row_sep,
      :quote_char,
      :field_size_limit,
      :converters,
      :unconverted_fields,
      :headers,
      :return_headers,
      :write_headers,
      :header_converters,
      :skip_blanks,
      :force_quotes
    ]
  end
end
