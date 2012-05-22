class LocationsController < ApplicationController
  def index
    if params[:search].present?
      @event = Event.find(params[:event_id])
      @locations = Location.near(params[:search], @event.location_radious, :order => :distance)
      @json = Location.near(params[:search], @event.location_radious, :order => :distance).to_gmaps4rails do |location, marker|
        marker.json({ :id => location.id, :address => location.address })
        if location.address != params[:search] then
          marker.picture({
              :picture => "/assets/star2.png",
              :width   => "30",
              :height  => "30"
            })
        end
      end
      radious_for_circle = (@event.location_radious*1609.34).round
      @loc = Location.find_by_address(params[:search])
  
      @circles = '[
                          {"lng": '+@loc.longitude.to_s+', "lat": '+@loc.latitude.to_s+', "radius": '+radious_for_circle.to_s+'},
                 ]' unless @loc.nil?
    else
      @locations = Location.all
      @json = Location.all.to_gmaps4rails

      @circles = '[
                          {"lng": -122.214897, "lat": 37.772323, "radius": 1000000}
             ]'

    end
    
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create

    @location = Location.new(params[:location])
    if @location.save
      redirect_to @location, :notice => "Successfully created location."
    else
      render :action => 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location, :notice  => "Successfully updated location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed location."
  end
end
