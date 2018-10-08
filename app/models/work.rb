class Work < ApplicationRecord
  # def self.top_albums
  #   albums = self.books.where.not(date_published: nil)
  #   10.times do
  #
  #   end
  #   return Author.all.map do |author|
  #     [author.name , author.id]
  #   end
  # end

  def self.album_list
    return Work.where(category: 'album')
  end

  def self.top_albums_list
    albums =  Work.where(category: 'album')
    if albums.length < 10
      return albums
    else
      return albums[1..10]
    end
  end

  def self.book_list
    return Work.where(category: 'book')
  end

  def self.top_books_list
    books =  Work.where(category: 'book')
    if books.length < 10
      return books
    else
      return books[1..10]
    end
  end

  def self.movie_list
    return Work.where(category: 'movie')
  end

  def self.top_movies_list
    movies =  Work.where(category: 'movie')
    if movies.length < 10
      return movies
    else
      return movies[1..10]
    end
  end

end
