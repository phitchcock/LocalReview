require 'rails_helper'

RSpec.describe Review, :type => :model do
  it 'saves itself' do
    Review.create(rating: 5, comment: 'Whatever')

    expect(Review.first.rating).to eq(5)
    expect(Review.first.comment).to eq('Whatever')
  end

  it 'validates presence of comment' do
    Review.create(comment: '')

    expect(Review.count).to eq(0)
  end

  it 'belongs to an Establishment' do

  end
end