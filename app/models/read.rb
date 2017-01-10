class Read < ApplicationRecord
  scope :hot, -> {
    select('title', 'url').where('created_at': Time.now - 1.day).order(id: :desc).limit(10)
}
end
