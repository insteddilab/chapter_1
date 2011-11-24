class Rental
  attr_accessor :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

	def amount()
    this_amount = 0;
    case movie.price_code
    when Movie::REGULAR
      this_amount += 2
      this_amount += (days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      this_amount += days_rented * 3
    when Movie::CHILDRENS
      this_amount += 1.5
      this_amount += (days_rented - 3) * 1.5 if days_rented > 3
    end
    this_amount
	end

  def get_charge
    result = 0 
    case self.movie.price_code
    when Movie::REGULAR
      result += 2
      result += (self.days_rented - 2) * 1.5 if self.days_rented > 2
    when Movie::NEW_RELEASE
      result += self.days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (self.days_rented - 3) * 1.5 if self.days_rented > 3
    end
   result
  end
end
