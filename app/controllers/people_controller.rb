class PeopleController < ApplicationController

  # GET /people
  # GET /people.xml
  def index
    @people = Person.find(:all, :order => 'name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /people/1
  # GET /people/1.xml
  def show
    @person = Person.find(params[:id])

    if params[:format].nil? && @person.to_param != params[:id] # format is html and slugs don't match
      headers["Status"] = "301 Moved Permanently"
      redirect_to person_url @person
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @person }
      end
    end
  end
end
