require 'rails_helper'

RSpec.describe Marvel, type: :model do
  it 'is invalid without a name' do
    marvel = Marvel.new(name: nil)
    expect(marvel).to be_invalid
  end
end
