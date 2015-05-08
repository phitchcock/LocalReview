class Establishment < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :reviews

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
