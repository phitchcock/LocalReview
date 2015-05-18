require 'rails_helper'

describe Establishment do
  it 'saves itself' do
    Establishment.create(name: 'One', address: '555 main street', phone: '555-1212', website: 'www.google.com', city: 'Palo Alto', map: 'google-map')

    expect(Establishment.first.name).to eq('One')
  end

  it 'validates presence of name' do
    Establishment.create(name: "", address: 'Whatever')

    expect(Establishment.count).to eq(0)
  end

  it 'has many reviews' do

  end

  it 'gets slugged' do
    Establishment.create(name: "what is the what what")

    expect(Establishment.first.slug).to eq("what-is-the-what-what")
  end

  it 'splits city' do
    establishment = Establishment.create(city: 'Sacramento, CA 95817-2825 | Map')

    expect(establishment.split_city[0].strip).to eq('Sacramento, CA 95817-2825')
  end

end
