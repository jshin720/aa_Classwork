def it_was_ok
  # Consider the following:
  #
  # Movie.where(yr: 1970..1979)
  #
  # We can use ranges (a..b) inside a where method.
  #
  # Find the id, title, and score of all movies with scores between 2 and 3
  Movie.where(score: 2..3).select(:id, :title, :score)
end

def harrison_ford
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor
  Actor
    .joins(:movies)
    .where(actors: { name: 'Harrison Ford' })
    .where('castings.ord > 1')
    .select("movies.id, movies.title")
end

    

def biggest_cast
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)
  
  Movie
    .select(:id, :title)
    .joins(:actors)
    .group(:id, :title) # want group to match select args except aggregates!!!
    .order('COUNT(actor_id) DESC')
    .limit(3)

end

def directed_by_one_of(them)
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.
  # ['George Lucas', 'Steven Spielberg']
  Movie
  .select(:id, :title)
  .joins(:director)
  .where(actors: {name: them}) #('actors.name IN (?)', them)


  # execute(<<-SQL, them)
  # SELECT id, title
  # FROM movies JOIN actors ON movies.director_id = actors.id
  # WHERE actors.name IN them;
  # SQL

end

def movie_names_before_1940
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.

end
