class Place < ActiveRecord::Base
  has_and_belongs_to_many :stories
  has_one :location

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true
end
