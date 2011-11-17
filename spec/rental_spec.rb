require "spec_helper"
describe Rental do
  
  
  describe "amount" do
        
    describe "REGULAR type" do
      it "should return 3.5 for day_rented > 2  " do
       movie = Movie.new("Avatar 3d", Movie::REGULAR)
       rental = Rental.new(movie , 3) 
       rental.amount().should eq(3.5)
      end
      
      it "should return for day_rented <= 2 " do
        movie = Movie.new("Avatar 3d", Movie::REGULAR)
        rental = Rental.new(movie , 2) 
        rental.amount().should eq(2)
      end
    end
    
    it "should return for 9 NEW_RELEASE type " do
       movie = Movie.new("Avatar 3d", Movie::NEW_RELEASE)
       rental = Rental.new(movie, 3) 
       rental.amount().should eq(9)
    end
    
    describe "movie type of CHILDRENS" do
       it "should return for day_rented > 3 " do
        movie = Movie.new("Avatar 3d", Movie::CHILDRENS )
        rental = Rental.new(movie, 4) 
        rental.amount().should eq(3)
       end
       
       it "should return for day_rented <= 3 " do
        movie = Movie.new("Avatar 3d", Movie::CHILDRENS )
        rental = Rental.new(movie, 3) 
        rental.amount().should eq(1.5)
       end 
    end
    
    
    
  end
  
end