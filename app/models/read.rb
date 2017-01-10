class Read < ApplicationRecord
  scope :hot, -> {
    select('reads').where('created_at > ?', Time.now - 1.day).limit(10).group(:title).count
    # select('links').where('links.created_at > ?', Time.now - 1.day)
    #   .order('count("links".id) DESC').limit(10)
  }
end
