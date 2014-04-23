require "spec_helper"

describe ValidatesCsvFormatOf::Base do
  include ValidatesCsvFormatOf::Base

  describe "#validate_csv_format" do
    let(:file) { 'spec/fixtures/utf8.csv' }

    context "valid format with known options" do
      let(:options) { {encoding: "UTF-8:UTF-8"} }

      before do
        expect(CSV).to receive(:open).with(file, 'r', options)
      end

      it { validate_csv_format(file, options) }
    end

    context "invalid format with known options" do
      let(:options) { {encoding: "CP932:UTF-8"} }

      before do
        expect(CSV).to receive(:open).with(file, 'r', options)
      end

      it { validate_csv_format(file, options) }
    end

    context "unknown options" do
      let(:file) { 'spec/fixtures/tab_separated.csv' }
      let(:known_options) { {col_sep: "\t"} }
      let(:unknown_options) { {fobarbaz: true}}

      before do
        expect(CSV).to receive(:open).with(file, 'r', known_options)
      end

      it { validate_csv_format(file, known_options.merge(unknown_options)) }
    end
  end
end
