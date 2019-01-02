require "rails_helper"

RSpec.describe Genre, type: :model do
  context 'associations' do
  	it { should have_many(:movies) }
  end
end