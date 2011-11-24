require 'movie'
require 'rental'

class Customer
  attr_accessor :name, :rentals

  def initialize(name)
    @name, @rentals = name, []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"
    @rentals.each do |rental|
      # add frequent renter points
      frequent_renter_points += 1
      # add bonus for a two day new release rental
      frequent_renter_points += 1 if rental.movie.price_code == Movie::NEW_RELEASE && rental.days_rented > 1
      # show figures for this rental
      result << "\t#{rental.movie.title}\t#{rental.get_charge}\n"
      total_amount += rental.get_charge

    end
    # add footer lines
    result << "Amount owed is #{total_amount}\n"
    result << "You earned #{frequent_renter_points} frequent renter points"
  end
end
