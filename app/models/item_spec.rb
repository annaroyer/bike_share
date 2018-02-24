require 'rails_helper'

describe Item, type: :model do
  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_numericality_of :price }
  end
end
#price must be greater than 0
