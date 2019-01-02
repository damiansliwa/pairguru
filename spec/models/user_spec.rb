require "rails_helper"

RSpec.describe User, type: :model do
  context 'phone number validations' do
    it { is_expected.to allow_value("+48 999 888 777").for(:phone_number) }
    it { is_expected.to allow_value("48 999-888-777").for(:phone_number) }
    it { is_expected.to allow_value("48 999-888-777").for(:phone_number) }
    it { is_expected.not_to allow_value("+48 aaa bbb ccc").for(:phone_number) }
    it { is_expected.not_to allow_value("aaa +48 aaa bbb ccc").for(:phone_number) }
    it { is_expected.not_to allow_value("+48 999 888 777\naseasd").for(:phone_number) }
  end

  context 'associations' do
  	it { should have_many(:comments) }
  end
end
