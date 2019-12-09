class PublishersController < ApplicationController
  def show
    @publishers = Publisher.available

    @publisher = Publisher.find(params[:id])
    @books = @publisher.books.page(params[:page]).per(1)
  end
end
