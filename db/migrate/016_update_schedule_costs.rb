class UpdateScheduleCosts < ActiveRecord::Migration
  def self.up
    th = ClassSchedule.find_by_occurs_on('Tues/Thursday')
    th.cost = '$150.00 per month'
    th.save!
    mwf = ClassSchedule.find_by_occurs_on('Mon/Wed/Fri -Junior Kindergarten*')
    mwf.cost = '$190.00 per month'
    mwf.save!
    d = ClassSchedule.find_by_occurs_on('Everyday - Junior Kindergarten*')
    d.cost =  '$340.00 per month'
    d.save!
  end

  def self.down
  end
end
