class CatogiriesController < ApplicationController
  # GET /catogiries
  # GET /catogiries.json
  def index
    @catogiries = Catogiry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @catogiries }
    end
  end

  # GET /catogiries/1
  # GET /catogiries/1.json
  def show
    @catogiry = Catogiry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @catogiry }
    end
  end

  # GET /catogiries/new
  # GET /catogiries/new.json
  def new
    @catogiry = Catogiry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @catogiry }
    end
  end

  # GET /catogiries/1/edit
  def edit
    @catogiry = Catogiry.find(params[:id])
  end

  # POST /catogiries
  # POST /catogiries.json
  def create
    @catogiry = Catogiry.new(params[:catogiry])

    respond_to do |format|
      if @catogiry.save
        format.html { redirect_to @catogiry, notice: 'Catogiry was successfully created.' }
        format.json { render json: @catogiry, status: :created, location: @catogiry }
      else
        format.html { render action: "new" }
        format.json { render json: @catogiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /catogiries/1
  # PUT /catogiries/1.json
  def update
    @catogiry = Catogiry.find(params[:id])

    respond_to do |format|
      if @catogiry.update_attributes(params[:catogiry])
        format.html { redirect_to @catogiry, notice: 'Catogiry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catogiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catogiries/1
  # DELETE /catogiries/1.json
  def destroy
    @catogiry = Catogiry.find(params[:id])
    @catogiry.destroy

    respond_to do |format|
      format.html { redirect_to catogiries_url }
      format.json { head :no_content }
    end
  end

  def get_children
    @cats = Catogiry.where("parent_id=?",params[:selected])
    logger.info "@cats:#{@cats.inspect}"
    render @cats.json
  end
end
