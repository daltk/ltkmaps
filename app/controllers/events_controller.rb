class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    event = @event

    event_address = event.street_number.to_s+' '+ event.street_name.to_s + ' '+ event.city.to_s + ' ' + event.state.to_s
    h = Hash.new
    h['address'] = event_address
    h['gmaps'] = true
    respond_to do |format|
      if @event.save
        @loc = Location.new(h)
        @loc.save

        @loc.update_attribute('event_id',event.id)
        @loc.update_attribute('user_id',session[:user])
        @event.update_attribute('user_id',session[:user])

        @redirect_str = '/locations?q='+event.id.to_s+'&search='+event.street_number.to_s+' '+event.street_name.to_s + ' ' + event.city.to_s + ' ' +event.state.to_s+'&event_id='+event.id.to_s
        format.html { redirect_to @redirect_str }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  def send_event_reminders
    @event = Event.find(params[:eid])
    s = @event.street_number.to_s+' '+@event.street_name+' '+@event.city+' '+@event.state
    loc = Location.near(s, @event.location_radious, :order => :distance)
    loc.each do | loc_obj |
      UserMailer.send_event_reminders(loc_obj.user).deliver 
    end
    redirect_to events_url
  end

  def remove_event
    @event = Event.find(params[:eid])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
