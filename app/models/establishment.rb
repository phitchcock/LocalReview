class Establishment < ActiveRecord::Base

  def split_url(url)
    url.split('|')
  end
end