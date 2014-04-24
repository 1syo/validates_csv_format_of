class CsvFormatValidator < ::ActiveModel::EachValidator
  include ValidatesCsvFormatOf::Base

  def validate_each(record, attribute, value)
    unless validate_csv_format(value, options)
      record.errors[attribute] << (options[:message] || I18n.t('errors.messages.not_a_csv_format'))
    end
  end
end
