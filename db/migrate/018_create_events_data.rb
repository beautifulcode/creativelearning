class CreateEventsData < ActiveRecord::Migration
  def self.up
    Event.create(:title => 'Registration 07-08',:date => '2007-12-12', :description => 'We will be offering pre-registration to presently enrolled families beginning the second week in December 2007. Registration forms will be sent home with the children in mid December.', :price => '', :created_at => '2007-12-12 02:38:35', :updated_at => '2007-12-12 02:38:35')
    Event.create(:title => 'Interviews', :date => '2007-11-13', :description => 'Please sign up for your parent/teacher interview beginning November 13. The interviews will be held Thursday November 29 and Friday November 30 from 8am to 3pm. There will be no classes those days',:price => '', :created_at => '2007-12-17 04:57:40',:updated_at => '2007-12-17 04:57:40');
    Event.create(:title => 'Registration 07-08', :date =>  '2008-01-07', :description =>'We will begin registration for the 2007-2008 school year on January 7 2008 at the school from 9am to 3pm in the office(enter through the north door) Registration forms will be available beginning Dec 1 2007.Call the school to book one of our monthly tours.',:price => '', :created_at => '2007-12-17 04:58:42',:updated_at =>'2007-12-17 05:01:08');
    Event.create(:title => 'Open House', :date => '2008-01-26',:description =>'We will be hosting an Open House on Saturday January 26 from 10am to 2pm. Call or email the school for details',:price => '', :created_at => '2007-12-17 05:00:17',:updated_at =>'2007-12-17 05:00:17');
  end

  def self.down
    Event.find(:all).delete
  end
end
