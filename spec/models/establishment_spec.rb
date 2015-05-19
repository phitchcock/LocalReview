require 'rails_helper'

RSpec.describe Establishment, :type => :model do
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

  describe 'search_by_title' do
    it "returns an empty array if there is no match" do
      estab1 = Establishment.create(name: "What")
      estab2 = Establishment.create(name: "Yep")

      expect(Establishment.search_by_title("hello")).to eq([])
    end
    it "returns an array of one video for exact match" do
      estab1 = Establishment.create(name: "What")
      estab2 = Establishment.create(name: "Yep")

      expect(Establishment.search_by_title("What")).to eq([estab1])
    end
    it "returns an array of one video for a partial match" do
      estab1 = Establishment.create(name: "What")
      estab2 = Establishment.create(name: "Yep")

      expect(Establishment.search_by_title("at")).to eq([estab1])
    end

    it "returns empty arry for a search with an empty string" do
      estab1 = Establishment.create(name: "What")
      estab2 = Establishment.create(name: "Yep")

      expect(Establishment.search_by_title("")).to eq([])
    end
  end

end
