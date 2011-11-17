class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_accessor :title, :price_code

  def initialize(title, price_code )
    @title = title
    @price_code = price_code
  end
  
  
end
