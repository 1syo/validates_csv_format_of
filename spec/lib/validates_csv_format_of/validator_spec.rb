require "spec_helper"

describe ValidatesCsvFormatOf::Validator do

  context "with options" do
    let!(:model) do
      Class.new {
        include ActiveModel::Model
        validates_csv_format_of :file, encoding: "UTF-8", col_sep: "\t"
        attr_accessor :file
      }
    end

    let(:file) { 'spec/fixtures/utf8.csv' }
    it { expect(model.new(file: file)).to be_valid }
  end

  context "without options" do
    let!(:model) do
      Class.new {
        include ActiveModel::Model
        validates_csv_format_of :file
        attr_accessor :file
      }
    end

    let(:file) { 'spec/fixtures/comma_separated.csv' }
    it { expect(model.new(file: file)).to be_valid }
  end
end
