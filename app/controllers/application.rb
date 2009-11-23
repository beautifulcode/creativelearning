# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_clc_session_id'
  
  include AuthenticatedSystem
  
  before_filter :setup_sidebars
  before_filter :login_required, :only => ['admin']
  
  helper :all
  
  def setup_sidebars
    @events ||= Event.find(:all, :order => 'date DESC', :limit => 3)
    @calendars ||= Calendar.find(:all, :order => 'title ASC')
    @newsletter ||= Newsletter.find(:all, :order => 'created_at DESC', :limit => 1).first
    @registration_form ||= RegistrationForm.find(:all, :order => 'created_at DESC', :limit => 1).first
  end
  
  def admin
    @questions = Question.find(:all)
    @calendars = Calendar.find(:all)
    @questions = Question.find(:all)
    @registrations = Registration.find(:all)
    @seminars = Seminar.find(:all)
    @teachers = Teacher.find(:all)
    @testimonials = Testimonial.find(:all)
    @schedules = ClassSchedule.find(:all)
    @newsletters = Newsletter.find(:all)
    render :template => 'pages/admin'
  end
  
  def action
    admin
    render :action => "admin"
  end
  
  def reorder_pages
    params[:pages].each do |page, i|
      current = Page.find(page[i])
      current.position = i + 1;
      current.save!
    end
  end
  
end
