class DesignerPhotosController < ApplicationController
  # GET /designer_photos
  # GET /designer_photos.json
  def index
    @designer_photos = DesignerPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @designer_photos }
    end
  end

  # GET /designer_photos/1
  # GET /designer_photos/1.json
  def show
    @designer_photo = DesignerPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @designer_photo }
    end
  end

  # GET /designer_photos/new
  # GET /designer_photos/new.json
  def new
    @designer_photo = DesignerPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @designer_photo }
    end
  end

  # GET /designer_photos/1/edit
  def edit
    @designer_photo = DesignerPhoto.find(params[:id])
  end

  # POST /designer_photos
  # POST /designer_photos.json
  def create
    @designer_photo = DesignerPhoto.new(params[:designer_photo])

    respond_to do |format|
      if @designer_photo.save
        format.html { redirect_to @designer_photo, notice: 'Designer photo was successfully created.' }
        format.json { render json: @designer_photo, status: :created, location: @designer_photo }
      else
        format.html { render action: "new" }
        format.json { render json: @designer_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /designer_photos/1
  # PUT /designer_photos/1.json
  def update
    @designer_photo = DesignerPhoto.find(params[:id])

    respond_to do |format|
      if @designer_photo.update_attributes(params[:designer_photo])
        format.html { redirect_to @designer_photo, notice: 'Designer photo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @designer_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designer_photos/1
  # DELETE /designer_photos/1.json
  def destroy
    @designer_photo = DesignerPhoto.find(params[:id])
    @designer_photo.destroy

    respond_to do |format|
      format.html { redirect_to designer_photos_url }
      format.json { head :ok }
    end
  end
end
