class BooksController < ApplicationController
    def index
        books = Book.all

        if rating = params[:rating]
            books = books.where(rating: rating)
        end

        render json: books, status: 200, except: [:destroy, :update]
    end
end