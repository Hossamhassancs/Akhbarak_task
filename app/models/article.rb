class Article < ApplicationRecord
    validates_uniqueness_of :url
    validates :title, :url, :image_url , presence: true
end
