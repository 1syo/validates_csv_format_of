require 'csv'
require 'active_model'
require "validates_csv_format_of/version"
require "validates_csv_format_of/base"
require "validates_csv_format_of/validator"
require "csv_format_validator"

::ActiveModel::Validations::HelperMethods.send :include, ValidatesCsvFormatOf::Validator
