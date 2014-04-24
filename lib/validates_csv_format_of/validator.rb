module ValidatesCsvFormatOf::Validator
  def validates_csv_format_of(*attr_names)
    validates_with CsvFormatValidator, _merge_attributes(attr_names)
  end
end
