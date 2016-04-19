class Reference < ActiveRecord::Base
	has_many :stories
	has_many :users
end
