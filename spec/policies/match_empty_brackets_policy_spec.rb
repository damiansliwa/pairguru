require 'rails_helper'

describe MatchEmptyBracketsPolicy do
  describe '.apply?' do
  	context 'with valid string' do
  	  let(:string_with_parentheses) { 'String with ()' }
      let(:string_with_curly_brackets) { 'String with {}' }
      let(:string_with_square_brackets) { 'String with []' }
      let(:string_with_all_types_brackets) { 'String with () {} []' }

      it 'applies to string with parentheses' do
      	title = described_class.new(string_with_parentheses)
        expect(title.apply?).to be_truthy
      end

      it 'applies to string with curly brackets' do
      	title = described_class.new(string_with_curly_brackets)
        expect(title.apply?).to be_truthy
      end

      it 'applies to string with square brackets' do
      	title = described_class.new(string_with_square_brackets)
        expect(title.apply?).to be_truthy
      end

      it 'applies to string with all types brackets' do
      	title = described_class.new(string_with_all_types_brackets)
        expect(title.apply?).to be_truthy
      end

  	end

  	context 'with invalid string' do
  	end
  end
end