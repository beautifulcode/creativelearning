class SeminarsController < ApplicationController
  
  before_filter :login_required, :except => [:show, :index]
  
  # GET /seminars
  # GET /seminars.xml
  def index
    @seminars = Seminar.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seminars }
    end
  end

  # GET /seminars/1
  # GET /seminars/1.xml
  def show
    @seminar = Seminar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seminar }
    end
  end

  # GET /seminars/new
  # GET /seminars/new.xml
  def new
    @seminar = Seminar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seminar }
    end
  end

  # GET /seminars/1/edit
  def edit
    @seminar = Seminar.find(params[:id])
  end

  # POST /seminars
  # POST /seminars.xml
  def create
    @seminar = Seminar.new(params[:seminar])

    respond_to do |format|
      if @seminar.save
        flash[:notice] = 'Seminar was successfully created.'
        format.html { redirect_to(@seminar) }
        format.xml  { render :xml => @seminar, :status => :created, :location => @seminar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seminar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /seminars/1
  # PUT /seminars/1.xml
  def update
    @seminar = Seminar.find(params[:id])

    respond_to do |format|
      if @seminar.update_attributes(params[:seminar])
        flash[:notice] = 'Seminar was successfully updated.'
        format.html { redirect_to(@seminar) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seminar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seminars/1
  # DELETE /seminars/1.xml
  def destroy
    @seminar = Seminar.find(params[:id])
    @seminar.destroy

    respond_to do |format|
      format.html { redirect_to(seminars_url) }
      format.xml  { head :ok }
    end
  end
end
