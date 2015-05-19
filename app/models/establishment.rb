class Establishment < ActiveRecord::Base

  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :reviews

  def geo_address
    [URI::escape(address), URI::escape(combine(split_city[0]))].compact.join('%20')
  end

  def split_city
    self.city.split('|')
  end

  def combine(str)
    str.gsub!(',', ' ')
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

  def self.search_by_title(term)
    return [] if term.blank?
    where("name LIKE ?", "%#{term}%")
  end

end
