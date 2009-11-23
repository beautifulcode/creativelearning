class RegistrationFormsController < ApplicationController
  
  before_filter :login_required
  
  # GET /registration_forms
  # GET /registration_forms.xml
  def index
    @registration_forms = RegistrationForm.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registration_forms }
    end
  end

  # GET /registration_forms/1
  # GET /registration_forms/1.xml
  def show
    @registration_form = RegistrationForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration_form }
    end
  end

  # GET /registration_forms/new
  # GET /registration_forms/new.xml
  def new
    @registration_form = RegistrationForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration_form }
    end
  end

  # GET /registration_forms/1/edit
  def edit
    @registration_form = RegistrationForm.find(params[:id])
  end

  # POST /registration_forms
  # POST /registration_forms.xml
  def create
    @registration_form = RegistrationForm.new(params[:registration_form])

    respond_to do |format|
      if @registration_form.save
        flash[:notice] = 'RegistrationForm was successfully created.'
        format.html { redirect_to(@registration_form) }
        format.xml  { render :xml => @registration_form, :status => :created, :location => @registration_form }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registration_forms/1
  # PUT /registration_forms/1.xml
  def update
    @registration_form = RegistrationForm.find(params[:id])

    respond_to do |format|
      if @registration_form.update_attributes(params[:registration_form])
        flash[:notice] = 'RegistrationForm was successfully updated.'
        format.html { redirect_to(@registration_form) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registration_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_forms/1
  # DELETE /registration_forms/1.xml
  def destroy
    @registration_form = RegistrationForm.find(params[:id])
    @registration_form.destroy

    respond_to do |format|
      format.html { redirect_to(registration_forms_url) }
      format.xml  { head :ok }
    end
  end
end
