require 'spec_helper'

describe Customer do
  let!(:movie) { Movie.new 'Inception', Movie::REGULAR }
  let!(:rental) { Rental.new movie, 2 }

  before(:each) do
    @customer = Customer.new 'Kola'
  end

  it "should add rental" do
    @customer.add_rental rental
  end

  describe "print statement" do
    before(:each) do
      @customer.add_rental rental
      @statement = @customer.statement
    end

    it "should include movie title and amount" do
      @statement.should match /#{movie.title}\s2/
    end
  end
end
