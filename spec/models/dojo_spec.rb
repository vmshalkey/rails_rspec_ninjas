require 'rails_helper'

RSpec.describe Dojo, type: :model do
  it 'requires a name' do
  	dojo = Dojo.new(name: '')
  	dojo.valid?
  	expect(dojo.errors[:name].any?).to eq(true)
  end
  it 'requires city' do
  	dojo = Dojo.new(name: '')
  	dojo.valid?
  	expect(dojo.errors[:city].any?).to eq(true)
  end
  it 'requires state to be at least 2 characters long' do
  	dojo = Dojo.new(state: 'C')
  	dojo.valid?
  	expect(dojo.errors[:state].any?).to eq(true)
  end
  it 'has many ninjas' do
  	dojo = Dojo.create(name: 'Dream Team', city: 'San Jose', state: 'CA')
  	ninja1 = dojo.ninjas.create(first_name: 'Eduardo', last_name: 'Baik')
  	ninja2 = dojo.ninjas.create(first_name: 'Brendan', last_name: 'Stanton')
  	expect(dojo.ninjas).to include(ninja1)
  	expect(dojo.ninjas).to include(ninja2)
  end
  it 'deletes associated ninjas upon deletion' do
  	dojo = Dojo.create(name: 'Dream Team', city: 'San Jose', state: 'CA')
  	dojo.ninjas.create(first_name: 'Eduardo', last_name: 'Baik')
  	expect {
  		dojo.destroy
  	}.to change(Ninja, :count).by(-1)
  end
end
