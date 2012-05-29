class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  def login
  end

  def logout
      session[:user] = nil
      redirect_to '/'
  end

  def sign_in
    @user_name = params[:user][:email]
    @password = params[:user][:password]

    @user = User.where("email = ? AND password = ?", @user_name, @password)
    logger.info "@user skjdgas: #{@user.inspect}"
    if @user.nil? or @user.blank? then
      redirect_to '/login'
    else
         
      session[:user] = @user[0].id
      redirect_to '/events'
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    

    

    respond_to do |format|
      if @user.save

    user = @user
    user_address = user.street_number.to_s+' '+ user.street_name.to_s + ' '+ user.city.to_s + ' ' + user.state.to_s
    h = Hash.new
    h['address'] = user_address
    h['gmaps'] = true
    @loc = Location.new(h)
    @loc.save

      

    fu_user_address = user.fu_street_number.to_s+' '+ user.fu_street_name.to_s + ' '+ user.fu_city.to_s + ' ' + user.fu_state.to_s
    h1 = Hash.new
    h1['address'] = fu_user_address
    h1['gmaps'] = true
    @loc1 = Location.new(h1)
    @loc1.save

        @loc.update_attribute('user_id',user.id)
        @loc1.update_attribute('user_id',user.id)

        format.html { redirect_to '/', :notice => 'You have registered successfully. Please login to create your events.' }
        format.json { render :json => @user, :status => :created, :location => @user }
        UserMailer.registration_confirmation(@user).deliver 

      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
