class PlacesController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update, :new, :create, :destroy]

  # GET /places
  # GET /places.xml
  def index
    @places = Place.find(:all, :order => 'name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])

    if params[:format].nil? && @place.to_param != params[:id] # format is html and slugs don't match
      headers["Status"] = "301 Moved Permanently"
      redirect_to place_url @place
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @place }
      end
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.xml
  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        flash[:notice] = 'Spillestedet er oprettet.'
        format.html { redirect_to(@place) }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def employ
    @place = Place.find(params[:id])
    @place.people << current_person unless @place.people.include?(current_person)
    flash[:notice] = 'Du blev tilknyttet spillestedet.'

    respond_to do |format|
      format.html { redirect_to(place_url(@place)) }
      format.xml  { head :ok }
    end
  end

  def unemploy
    @place = Place.find(params[:id])
    @place.people.delete(current_person)
    flash[:notice] = 'Din tilknytning til dette spillested blev fjernet.'

    respond_to do |format|
      format.html { redirect_to(place_url(@place)) }
      format.xml  { head :ok }
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        flash[:notice] = 'Spillestedets oplysninger er opdateret.'
        format.html { redirect_to(@place) }
        format.xml  { head :ok }
      else
        format.html { render :action => "opdater" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end
end
