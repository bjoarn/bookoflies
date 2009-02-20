class PeopleController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update, :change_password, :logout, :destroy]

  # GET /people
  # GET /people.xml
  def index
    @people = Person.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

def login
  if request.post?
    flash[:notice] = flash[:error] = nil
    person = Person.authenticate(params[:email], params[:password])
    unless person.nil?
      flash[:notice] = "Du blev logget ind"

      session[:person_id] = person.id

      uri = session[:original_uri]
      session[:original_uri] = nil
      redirect_to(uri || { :controller => "places", :action => "index" })
    else
      flash[:error] = "Ugyldig e-mail og/eller password"
      redirect_to login_path #redirect to same action but with method => get (needed for the flash to expire on reload)
    end
  else 
    render :action => "login"
  end

end

def logout
  remove_login_from_session
  flash[:notice] = "Logget ud"
  redirect_to root_path
end


  # GET /people/1
  # GET /people/1.xml
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = current_person
  end

  # POST /people
  # POST /people.xml
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        flash[:notice] = 'Person was successfully created.'
        format.html { redirect_to(@person) }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @person = current_person
    
    respond_to do |format|
      if @person.update_attributes(params[:person])
        flash[:notice] = 'Person was successfully updated.'
        format.html { redirect_to(@person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def change_password
    @person = current_person
    if request.post?
      flash[:notice] = flash[:error] = nil
      @person.new_password = params[:new_password]
      @person.new_password_confirmation = params[:new_password_confirmation]
      if @person.valid?
        @person.password = params[:new_password]
        @person.save!
        flash[:notice] = "Dit password er blevet skiftet."
      else
        flash[:error] = @person.errors.full_messages.join(' ')
        redirect_to change_password_path #redirect to same action but with method => get (needed for the flash to expire on reload)
      end
    end
  end
  
  # assign them a random one and mail it to them, asking them to change it
  def forgot_password
    if request.post?
      flash[:notice] = flash[:error] = nil
      @person = Person.find_by_email(params[:email])
      unless @person.nil?
        random_password = Array.new(10).map { (65 + rand(58)).chr }.join
        @person.password = random_password
        @person.save!
        Mailer.deliver_password_change(@person, random_password)
        flash[:notice] = "Dit password er blevet nulstillet. Du vil modtage en e-mail med dit nye password."
        redirect_to login_path
      else
        flash[:error] = "Den e-mail du indtastede findes ikke i systemet. Prøv igen."
        redirect_to forgot_password_path #redirect to same action but with method => get (needed for the flash to expire on reload)
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @person = current_person
    @person.destroy
    remove_login_from_session

    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def remove_login_from_session
    session[:person_id] = nil
  end
end
