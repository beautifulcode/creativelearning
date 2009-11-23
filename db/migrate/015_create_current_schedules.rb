class CreateCurrentSchedules < ActiveRecord::Migration
  def self.up
    
     ClassSchedule.create(:age => "3 yr. olds", :start_time =>	Time.parse("8:45"),   :end_time => Time.parse("10:45 am"),    :cost => "$115.00 per month", :occurs_on => "Tues/Thursday")
     ClassSchedule.create(:age => "3 yr. olds", :start_time =>	Time.parse("11:00"),  :end_time => Time.parse("1:00 pm"),   	:cost => "$115.00 per month", :occurs_on => "Tues/Thursday")
     ClassSchedule.create(:age => "3 yr. olds", :start_time =>	Time.parse("1:30"),   :end_time => Time.parse("3:30 pm"),   	:cost => "$115.00 per month", :occurs_on => "Tues/Thursday")
     ClassSchedule.create(:age => "4 yr. olds", :start_time =>	Time.parse("1:30"),   :end_time => Time.parse("3:30 pm"),   	:cost => "$115.00 per month", :occurs_on => "Tues/Thursday")
     ClassSchedule.create(:age => "4 yr. olds", :start_time =>	Time.parse("8:45"),   :end_time => Time.parse("10:45 am"),    :cost => "$140.00 per month", :occurs_on => "Mon/Wed/Fri -Junior Kindergarten*")
     ClassSchedule.create(:age => "4 yr. olds", :start_time =>	Time.parse("11:00"),  :end_time => Time.parse("1:00 pm"),   	:cost => "$140.00 per month", :occurs_on => "Mon/Wed/Fri -Junior Kindergarten*")
     ClassSchedule.create(:age => "4 yr. olds", :start_time =>	Time.parse("1:30"),   :end_time => Time.parse("3:30 pm"),   	:cost => "$140.00 per month", :occurs_on => "Mon/Wed/Fri -Junior Kindergarten*")
     ClassSchedule.create(:age => "4 yr. olds", :start_time =>	Time.parse("1:30"),   :end_time => Time.parse("3:30 pm"),   	:cost => "$255.00 per month", :occurs_on => "Everyday - Junior Kindergarten*")
     
  end

  def self.down
    ClassSchedule.delete(:all)
  end
end
