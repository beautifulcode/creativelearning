# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def current_semester
    Semester.current
  end
  
  def current_registration_form
    @current_semester = current_semester
    url_for_file_column(:current_semester, :registration_form) || "/registration.doc"
  end
  
  def current_calendar
    @calendar = Calendar.current
  end
  
  def weekly_classes
    # ClassSchedule.find(:all).split{|schedule| schedule.occurs_on }
    weekly_classes = []
    days = []
    ClassSchedule.find(:all).each{|schedule| days << schedule.occurs_on }
    days.uniq.each do |day|
      weekly_classes << ClassSchedule.find_all_by_occurs_on(day)
    end
    weekly_classes
  end
  
  def show_flash_messages
    html = ''
    flash.keys.each do |type|
      html << content_tag(:div, flash[type], :class => "flash #{type}")
    end
    html
  end

  
end
