require 'test_helper'

class ListingFinishedBooksTest < ActionDispatch::IntegrationTest

  setup do
    @finished = Genre.create!(name: 'Finished')

    @finished.books.create!(title: 'Finished', finished_at: 1.day.ago)
    @finished.books.create!(title: 'Not Finished', finished_at: nil)
  end

  test 'list finished books in json' do
    get '/finished_books', params: {}, headers: { accept: 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal 1, json(response.body).size
  end

  test 'list finished books in xml' do
    get '/finished_books', params: {}, headers: { accept: 'application/xml' }

    assert_equal 200, response.status
    assert_equal Mime[:xml], response.content_type
    assert_equal 1, Hash.from_xml(response.body)['books'].size
  end
end
