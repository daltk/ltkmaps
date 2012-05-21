class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  acts_as_gmappable

  belongs_to :user
  def gmaps4rails_address
    self.address
  end

  def gmaps4rails_infowindow
      "#{self.address}"
  end

   def gmaps4rails_title
      # add here whatever text you desire
      "#{self.address}"
   end

  #def gmaps4rails_marker_picture
  #{
  # "picture" => "/images/star.png",
  # "width" => "20",
  # "height" => "20"
  #}
  #end

  def gmaps4rails_sidebar
  	"<span class=\"foo\">#{self.address}</span>" #put whatever you want here
  end
end
