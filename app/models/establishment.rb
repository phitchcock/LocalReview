class Establishment < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :reviews

  def geo_address
    [address, split_city[0]].compact.join(', ')
  end

  def split_city
    self.city.split('|')
  end

  def split_url(url)
    url.split('|')
  end

  def average_rating(establishment)
    average = []
    establishment.reviews.each do |review|
      average << review.rating
    end

    return average.sum / average.size.to_f
  end

end
