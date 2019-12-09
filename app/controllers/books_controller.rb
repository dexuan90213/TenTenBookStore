class BooksController < ApplicationController
  before_action :find_book, only: [:show]

  def index
    # @books = Book.where(on_sell: true).with_attached_cover_image
    @books = Book.available.with_attached_cover_image.page(params[:page]).per(6)
    @publishers = Publisher.available
  end

  def show
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end
end
