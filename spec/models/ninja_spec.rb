require 'rails_helper'

RSpec.describe Ninja, type: :model do
  it 'requires a first_name' do
  	dojo = Dojo.create(name: 'Dream Team', city: 'San Jose', state: 'CA')
  	ninja = dojo.ninjas.new(first_name: '')
  	ninja.valid?
  	expect(ninja.errors[:first_name].any?).to eq(true)
  end
  it 'requires a last_name' do
  	dojo = Dojo.create(name: 'Dream Team', city: 'San Jose', state: 'CA')
  	ninja = dojo.ninjas.new(last_name: '')
  	ninja.valid?
  	expect(ninja.errors[:last_name].any?).to eq(true)
  end
  it 'belongs to a dojo' do
  	dojo = Dojo.create(name: 'Dream Team', city: 'San Jose', state: 'CA')
  	ninja = dojo.ninjas.new(first_name: 'Eduardo', last_name: 'Baik')
  	expect(ninja.dojo).to eq(dojo)
  end
end
