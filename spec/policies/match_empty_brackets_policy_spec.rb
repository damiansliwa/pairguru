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
      let(:string_with_invalid_opening_parenthes) { 'String with (' }
      let(:string_with_invalid_closing_parenthes) { 'String with )' }
      let(:string_with_invalid_opening_curly_bracket) { 'String with {' }
      let(:string_with_invalid_closing_curly_bracket) { 'String with }' }
      let(:string_with_invalid_opening_square_bracket) { 'String with [' }
      let(:string_with_invalid_closing_square_bracket) { 'String with ]' }
      let(:string_without_any_bracket) { 'String without any bracket' }

      it 'does not apply to string with only opening parenthes' do
        title = described_class.new(string_with_invalid_opening_parenthes)
        expect(title.apply?).to be_falsey
      end

      it 'does not apply to string with only closing parenthes' do
        title = described_class.new(string_with_invalid_closing_parenthes)
        expect(title.apply?).to be_falsey
      end

      it 'does not apply to string with only opening curly bracket' do
        title = described_class.new(string_with_invalid_opening_curly_bracket)
        expect(title.apply?).to be_falsey
      end

      it 'does not apply to string with only closing curly bracket' do
        title = described_class.new(string_with_invalid_closing_curly_bracket)
        expect(title.apply?).to be_falsey
      end

      it 'does not apply to string with only opening square bracket' do
        title = described_class.new(string_with_invalid_opening_square_bracket)
        expect(title.apply?).to be_falsey
      end

      it 'does not apply to string with only closing square bracket' do
        title = described_class.new(string_with_invalid_closing_square_bracket)
        expect(title.apply?).to be_falsey
      end

      it 'does not apply to string without any bracket' do
        title = described_class.new(string_without_any_bracket)
        expect(title.apply?).to be_falsey
      end
  	end
  end
end