require "test_helper"

describe Work do
  let(:titanic) { works(:titanic) }
  let(:the_big_lebowski) { works(:the_big_lebowski) }
  let(:tragic_kindgom) { works(:tragic_kindgom) }
  let(:harry_potter) { works(:harry_potter) }
  let(:harry_potter_two) { works(:harry_potter_two) }
  let(:harry_potter_three) { works(:harry_potter_three) }

  it "must be valid" do
    value(titanic).must_be :valid?
  end

  it 'is invalid without a title' do
    # Arrange
    titanic.title = nil
    # Act
    result = titanic.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a title can only occur once per category ' do
    # Arrange
    the_big_lebowski.title = titanic.title
    # Act
    result = the_big_lebowski.save
    # Assert
    expect(result).must_equal false
  end

  it 'is invalid without a creator' do
    # Arrange
    titanic.creator = nil
    # Act
    result = titanic.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'is invalid without a publication year' do
    # Arrange
    titanic.publication_year = nil
    # Act
    result = titanic.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a publication year must be an integer' do
    # Arrange
    titanic.publication_year = "hello"
    # Act
    result = titanic.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a publication year must be greater than 0' do
    # Arrange
    titanic.publication_year = -1
    # Act
    result = titanic.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a publication year must be greater less than 2019' do
    # Arrange
    titanic.publication_year = 3000
    # Act
    result = titanic.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'is invalid without a description' do
    # Arrange
    titanic.description = nil
    # Act
    result = titanic.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a description must be 5  or more characters' do
    # Arrange
    titanic.description = "cat"
    # Act
    result = titanic.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a description may not be more than 250 characters' do
    # Arrange
    titanic.description = "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
    # Act
    result = titanic.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'display a list of albums' do
    expect(Work.album_list[0].category).must_equal "album"
  end

  it 'display a list of Movies' do
    expect(Work.movie_list[0].category).must_equal "movie"
  end

  it 'display a list of Books' do
    expect(Work.book_list[0].category).must_equal "book"
  end

end
