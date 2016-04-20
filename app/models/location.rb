class Location < ActiveRecord::Base
	has_many :places

	validates :lat, presence: true
	validates :lon, presence: true
end
