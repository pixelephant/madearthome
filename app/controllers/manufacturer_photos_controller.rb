class ManufacturerPhotosController < ApplicationController
  # GET /manufacturer_photos
  # GET /manufacturer_photos.json
  def index
    @manufacturer_photos = ManufacturerPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manufacturer_photos }
    end
  end

  # GET /manufacturer_photos/1
  # GET /manufacturer_photos/1.json
  def show
    @manufacturer_photo = ManufacturerPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manufacturer_photo }
    end
  end

  # GET /manufacturer_photos/new
  # GET /manufacturer_photos/new.json
  def new
    @manufacturer_photo = ManufacturerPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manufacturer_photo }
    end
  end

  # GET /manufacturer_photos/1/edit
  def edit
    @manufacturer_photo = ManufacturerPhoto.find(params[:id])
  end

  # POST /manufacturer_photos
  # POST /manufacturer_photos.json
  def create
    @manufacturer_photo = ManufacturerPhoto.new(params[:manufacturer_photo])

    respond_to do |format|
      if @manufacturer_photo.save
        format.html { redirect_to @manufacturer_photo, notice: 'Manufacturer photo was successfully created.' }
        format.json { render json: @manufacturer_photo, status: :created, location: @manufacturer_photo }
      else
        format.html { render action: "new" }
        format.json { render json: @manufacturer_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manufacturer_photos/1
  # PUT /manufacturer_photos/1.json
  def update
    @manufacturer_photo = ManufacturerPhoto.find(params[:id])

    respond_to do |format|
      if @manufacturer_photo.update_attributes(params[:manufacturer_photo])
        format.html { redirect_to @manufacturer_photo, notice: 'Manufacturer photo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @manufacturer_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturer_photos/1
  # DELETE /manufacturer_photos/1.json
  def destroy
    @manufacturer_photo = ManufacturerPhoto.find(params[:id])
    @manufacturer_photo.destroy

    respond_to do |format|
      format.html { redirect_to manufacturer_photos_url }
      format.json { head :ok }
    end
  end
end
