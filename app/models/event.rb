class Event < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :location_radious
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :street_number
  validates_presence_of :street_name
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
end
