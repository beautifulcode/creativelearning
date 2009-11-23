class PopulateModelsWithExistingData < ActiveRecord::Migration
  def self.up
    Teacher.create(:name => "Irina Florea", :description => "B.Arts/Teaching Certificate")
    Teacher.create(:name => "Karen Empey", :description => "B.A / B.Ed")
    Teacher.create(:name => "Kristine Burns", :description => "B. Ed w/Distinction")
    Teacher.create(:name => "Lisa Doty", :description => "B. Ed")
    Teacher.create(:name => "Lynne Kiser", :description => "B. Ed w/Distinction")
    Teacher.create(:name => "Nancy Wilkins", :description => "B. Ed")
    Teacher.create(:name => "Patricia Gardner")
    Teacher.create(:name => "Patti Brix", :description => "B. Ed")
    Teacher.create(:name => "Dani Barrington")
    Teacher.create(:name => "Joanne Bragg")
    Teacher.create(:name => "Lois Bowen")
    Teacher.create(:name => "Lynne Olson")
    

    Question.create(
                      :question => "How old should my child be to enter preschool?",
                      :answer => "For the 2 day 3 year old program your child should be 3 by December and progressing with toilet training."
                    )
                    
    Question.create(
                    :question => "What are the class sizes?",
                    :answer => "At CLC we have a large classroom that accomodates up to 25 children and a smaller classroom that accomodates 12 to 15 children. The large classroom is staffed by 2 qualified teachers and a teaching assistant. The student teacher ratio is 8:1."
                    )
                    
    Question.create(:question => "What are the qualifications of the staff of CLC?",
                    :answer => "We take great pride in our experienced, caring and professional staff. All of the teachers are professionally trained (B.Ed, B.Pysch, etc.) and the teaching assistants are trained and have many years of experience with preschool children. The staff functions in teaching teams that remain consistent throughout the year."
                    )
    
    Question.create(
                    :question => "How structured is your program? Do you have a curriculum? Do the children play at school?",
                    :answer => "These questions can be answered in the same way. We are a developmentally appropriate, child-centered program. In planning the year, month, week, day the teachers take into account the needs of individual students and what is appropriate to present them in a well thought out and highly interesting and motivating environment."
                    )
                    
    Question.create(
                    :question => "How do I know what my child is learning?",
                    :answer => "Calenders are sent home every month to let parents know what has been planned for the month. We also send home a school newsletter every two months. Parents are encouraged to talk to the reachers about their child if they have any questions or concerns."
                    )
                    
    Question.create(
                    :question => "Do you require parent volunteers?",
                    :answer => "No. But we maintain a open door policy with sign up calenders in each room."
                    )
                    
    Question.create(:question => "What is your snack policy?",
                    :answer => "We ask that parents use the sign up calender to provide a healthy snack for the entire class. Depending on class size, this means signing up to bring snack once every two months. We are a peanut free facility."
                    )
                    
    Question.create(:question => "Why should we choose CLC over other preschools in the area?",
                    :answer => "CLC has been providing Calgary families an exceptionally high quality preschool program for 30 years. Our program is built around an open learning environment that utilizes the principle of play to encourage and guide early childhood development. The staff ensure that your child is having fun and learning about their world at the same time. We definitely love our jobs and our interaction with your children!"
                    )
    
    
    Testimonial.create(:content => "I would like to thank you for your hard work and dedication Ö your encouragement enabled my child to blossom and strive to be the best they could be. We can't thank you enough!", :author => "Jennifer D.")
    Testimonial.create(:content => "You have all gently guided and inspired Ben to express who he is in a nuturing environmentÖ", :author => " Heather H.")
    Testimonial.create(:content => "Benjamin has enjoyed his 1st year of preschool and a large part of that is due to the bond he has made with your wonderful staff.", :author => " Heather H.")
    Testimonial.create(:content => "Everyday Kayla bounces out of class with a huge grin of joy. Creative Learning helped put that there. Thank You!", :author => " Loraine L.")


    
  end

  def self.down
    Question.delete(:all)
    Teacher.delete(:all)
    Testimonial.delete(:all)
  end
end
