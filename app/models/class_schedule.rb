class ClassSchedule < ActiveRecord::Base
  def title
    self.age + ' - ' + self.hours + ' - ' + self.occurs_on
  end
  
  def hours
    self.start_time.strftime('%I:%M') + ' - ' + self.end_time.strftime('%I:%M %p')
  end
end
