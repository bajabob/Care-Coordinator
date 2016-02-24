module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  # list of all ratings a movie can have
  def self.all_ratings
    ['G','PG','PG-13','R']
  end
end
