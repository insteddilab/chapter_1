require 'spec_helper'

describe Customer do
  describe "print statement" do
    before(:each) do
      @customer = Customer.new 'Kola'
    end

    it "should include movie title and price" do
      movie = Movie.new 'Thor', Movie::REGULAR
      @customer.add_rental(Rental.new movie, 1)
      @customer.statement.should match /Thor\s2/
    end
    
    def expect_rental_amount(movie, day_rented, total_amount)
      @customer.add_rental(Rental.new movie, day_rented)
      statement = @customer.statement

      statement.should match /Amount owed is #{total_amount}/
    end

    context "for regular movie" do
      let!(:movie) { Movie.new 'Inception', Movie::REGULAR }

      [
        [1, 2],
        [2, 2],
        [3, 3.5]
      ].each do |day_rented, total_amount|
        it "should total amount equal to #{total_amount} when rent for #{day_rented} (days)" do
          expect_rental_amount movie, day_rented, total_amount
        end
      end
    end

    context "for new release movie" do
      let!(:movie) { Movie.new 'Rio', Movie::NEW_RELEASE }

      [
        [1, 3],
        [2, 6],
        [3, 9]
      ].each do |day_rented, total_amount|
        it "should total amount equal to #{total_amount} when rent for #{day_rented} (days)" do
          expect_rental_amount movie, day_rented, total_amount
        end
      end
    end

    context "for children movie" do
      let!(:movie) { Movie.new 'How to train your dragon', Movie::CHILDRENS }

      [
        [1, 1.5],
        [2, 1.5],
        [3, 1.5],
        [4, 3],
        [5, 4.5]
      ].each do |day_rented, total_amount|
        it "should total amount equal to #{total_amount} when rent for #{day_rented} (days)" do
          expect_rental_amount movie, day_rented, total_amount
        end
      end
    end
  end
end
