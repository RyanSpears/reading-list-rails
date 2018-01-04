require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest

  setup do
    science_fiction_genres = Genre.where(name: 'Science Fiction')

    if science_fiction_genres.count == 0
      @science_fiction = Genre.create!(name: 'Science Fiction')
    else
      @science_fiction =  Genre.where(name: 'Science Fiction').first
    end

    @book = @science_fiction.books.create!(title: 'Against A Dark Background', rating: 5)
  end

  test 'delete book' do
    delete "/books/#{@book.id}"

    assert_equal 204, response.status
  end
end