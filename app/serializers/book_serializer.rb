class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :review, :author, :genre_id, :amazon_id
end
