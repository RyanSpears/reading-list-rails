require 'test_helper'

class ListingGenresTest < ActionDispatch::IntegrationTest
test 'list_genres' do
  get '/genres'

  assert_equal 200, response.status
  assert_equal Mime[:json], response.content_type
end
end
