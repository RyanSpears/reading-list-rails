require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest

  setup do
    @book = Book.create!(title: 'Against A Dark Background', rating: 5)
  end

  test 'delete book' do
    delete "/books/#{@book.id}"

    assert_equal 204, response.status
  end
end