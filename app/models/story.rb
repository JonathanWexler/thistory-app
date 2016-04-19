class Story < ActiveRecord::Base
	has_many :references
	belongs_to :user
	belongs_to :master_story
	has_many :places
end
