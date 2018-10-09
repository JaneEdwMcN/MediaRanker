class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: { scope: :category, message: "can only occur once per category" }
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true, greater_than: 0,  less_than: 2019}
  validates :description, presence: true, length: { in: 5..250 }

  def self.album_list
    return Work.where(category: 'album')
  end

  def self.top_albums_list
    albums =  Work.where(category: 'album')
    return albums if albums.length < 10
    return albums[1..10]
  end

  def self.book_list
    return Work.where(category: 'book')
  end

  def self.top_books_list
    books =  Work.where(category: 'book')
    return books if books.length < 10
    return books[1..10]
  end

  def self.movie_list
    return Work.where(category: 'movie')
  end

  def self.top_movies_list
    movies =  Work.where(category: 'movie')
    return movies  if movies.length < 10
    return movies[1..10]
  end

end
