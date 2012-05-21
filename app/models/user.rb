class User < ActiveRecord::Base
  has_many :locations
  has_many :events
  validates_presence_of :first_name
  validates_presence_of :middle_name
  validates_presence_of :last_name
  validates_presence_of :phone
  validates_presence_of :email
  validates_presence_of :role
  validates_presence_of :category
  validates_presence_of :game
  validates_presence_of :specialization
  validates_presence_of :street_number
  validates_presence_of :street_name
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :fu_city
  validates_presence_of :fu_state
  validates_presence_of :fu_zipcode_1
  validates_presence_of :fu_from
  validates_presence_of :fu_to
  validates_presence_of :password
end
