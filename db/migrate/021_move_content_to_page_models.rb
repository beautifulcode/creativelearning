class MoveContentToPageModels < ActiveRecord::Migration
  def self.up
    @parent_id = 'NULL'
    
    @school = Page.create(:title => 'School', :body => '')
      Page.create(:title => 'Contact', :body => '', :parent_id => @school.id)
      Page.create(:title => 'History', :body => '', :parent_id => @school.id)
      Page.create(:title => 'Layout', :body => '', :parent_id => @school.id)
      Page.create(:title => 'Learning Centers', :body => '', :parent_id => @school.id)
      Page.create(:title => 'Liscensing', :body => '', :parent_id => @school.id)
      Page.create(:title => 'Location', :body => '', :parent_id => @school.id)
      Page.create(:title => 'Mission', :body => '', :parent_id => @school.id)
      Page.create(:title => 'Philosophy', :body => '', :parent_id => @school.id)
      Page.create(:title => 'Photos', :body => '', :parent_id => @school.id)
      Page.create(:title => 'Projects', :body => '', :parent_id => @school.id)
    
    @program = Page.create(:title => 'Programs', :body => '')
      
      Page.create(:title => 'Age 3', :body => '', :parent_id => @program.id)
      Page.create(:title => 'Age 4', :body => '', :parent_id => @program.id)
      Page.create(:title => 'Prices', :body => '', :parent_id => @program.id)
      Page.create(:title => 'Schedule', :body => '', :parent_id => @program.id)
      
    Page.create(:title => 'Philosophy', :body => '')
    Page.create(:title => 'Registration', :body => '')

    @policy = Page.create(:title => 'Policies', :body => '')
      Page.create(:title => 'Communication', :body => '', :parent_id => @policy.id)
      Page.create(:title => 'Discipline', :body => '', :parent_id => @policy.id)
      Page.create(:title => 'Medical', :body => '', :parent_id => @policy.id)
      Page.create(:title => 'Participation', :body => '', :parent_id => @policy.id)
      Page.create(:title => 'Safety', :body => '', :parent_id => @policy.id)
      Page.create(:title => 'Snack', :body => '', :parent_id => @policy.id)
      Page.create(:title => 'Volunteers', :body => '', :parent_id => @policy.id)
      Page.create(:title => 'Withdrawl', :body => '', :parent_id => @policy.id)
      
    Page.create(:title => 'Resources', :body => '')
    Page.create(:title => 'Contact', :body => '')
  end

  def self.down
  end
end
