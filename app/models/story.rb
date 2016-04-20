class Story < ActiveRecord::Base
	has_many :references
	has_one :user
	has_one :master_story
	has_many :places

	validates :user_id, presence: true:
	validates :place_id, presence: true:
	validates :title, presence: true:
end
