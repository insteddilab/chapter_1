require 'spec_helper'

describe Movie do
  before(:each) do
    day_rented = 3
    @movie = Movie.new()
    @rental = Rental.new(@movie, day_rented);
  end
  
  describe "amount" do
    it "should return 3.5 wih " 
  end
end
