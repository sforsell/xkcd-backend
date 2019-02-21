class Comic < ApplicationRecord
	belongs_to :user
	validates :num, :img_url, :title, presence: true
end
