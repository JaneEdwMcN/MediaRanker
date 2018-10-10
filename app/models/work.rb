class Work < ApplicationRecord
  has_many :votes, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :category, message: "can only occur once per category" }
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true, greater_than: 0,  less_than: 2019}
  validates :description, presence: true, length: { in: 5..250 }

  def self.top_work
    return Work.all.sort_by {|work| work.votes.count}.reverse.first
  end

  def self.album_list
    return Work.where(category: 'album').sort_by {|work| work.votes.count}.reverse!
  end

  def self.top_albums_list
    albums =  Work.where(category: 'album').sort_by {|work| work.votes.count}.reverse!
    return albums if albums.length < 10
    return albums[0..9]
  end

  def self.book_list
    return Work.where(category: 'book').sort_by {|work| work.votes.count}.reverse!
  end

  def self.top_books_list
    books =  Work.where(category: 'book').sort_by {|work| work.votes.count}.reverse!
    return books if books.length < 10
    return books[0..9]
  end

  def self.movie_list
    return Work.where(category: 'movie').sort_by {|work| work.votes.count}.reverse!
  end

  def self.top_movies_list
    movies =  Work.where(category: 'movie').sort_by {|work| work.votes.count}.reverse!
    return movies  if movies.length < 10
    return movies[0..9]
  end

end
