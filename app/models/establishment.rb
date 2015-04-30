class Establishment < ActiveRecord::Base
  has_many :reviews
  
  def split_url(url)
    url.split('|')
  end
end