require "test_helper"

describe Work do
  let(:work) { works(:titanic) }
  let(:work_two) { works(:the_big_lebowski) }

  it "must be valid" do
    value(work).must_be :valid?
  end

  it 'is invalid without a title' do
    # Arrange
    work.title = nil
    # Act
    result = work.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a title can only occur once per category ' do
    # Arrange
    work_two.title = work.title
    # Act
    result = work_two.save
    # Assert
    expect(result).must_equal false
  end

  it 'is invalid without a creator' do
    # Arrange
    work.creator = nil
    # Act
    result = work.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'is invalid without a publication year' do
    # Arrange
    work.publication_year = nil
    # Act
    result = work.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a publication year must be an integer' do
    # Arrange
    work.publication_year = "hello"
    # Act
    result = work.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a publication year must be greater than 0' do
    # Arrange
    work.publication_year = -1
    # Act
    result = work.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a publication year must be greater less than 2019' do
    # Arrange
    work.publication_year = 3000
    # Act
    result = work.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'is invalid without a description' do
    # Arrange
    work.description = nil
    # Act
    result = work.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a description must be 5  or more characters' do
    # Arrange
    work.description = "cat"
    # Act
    result = work.valid?
    # Assert
    expect(result).must_equal false
  end

  it 'a description may not be more than 250 characters' do
    # Arrange
    work.description = "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
    # Act
    result = work.valid?
    # Assert
    expect(result).must_equal false
  end
end
