require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'associations' do
  	it { should belong_to(:user) }
  	it { should belong_to(:movie) }
  end

  context 'validations' do
  	it { should validate_presence_of(:text) }
  	it { should validate_presence_of(:movie) }
  	it { should validate_presence_of(:user) }
  	it { should validate_uniqueness_of(:user_id).scoped_to(:movie_id) }
  end
end
