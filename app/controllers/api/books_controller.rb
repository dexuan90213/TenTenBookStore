class Api::BooksController < ApplicationController
  def favorite
    render json: {status: 'ok'}
  end
end
