class BooksController < ApplicationController

  def index
    @books = Book.all
    # SELECT * FROM books
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      # flash[:notice] = "新增書本成功"
      redirect_to root_path, notice: "新增書本成功"
    else
      render :new
      # render file: '../views/books/new.html.erb' # 借 new.html.erb 這個檔案的畫面顯示出來
      # render action: :new # 借 new.html.erb 這個檔案的畫面顯示出來

      # redirect_to new_book_path, notice: "新增失敗"
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
    # redirect_to root_path, notice: '查無此書' unless @book
    # @book = Book.find(params[:id]) # 只能接數字,只能找 id
    
    # begin
    #   @book = Book.find(params[:id])
    # rescue
    #   redirect_to root_path ,notice: '查無此書'
    # # select * form books where id = ?
    @book = Book.find(params[:id]) # 在 ApplicationController 捕桌 rescue
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to root_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def book_params
    # strong parameters
    params.require(:book).permit(:title,
                                 :description,
                                 :list_price,
                                 :sell_price,
                                 :page_num,
                                 :isbn,
                                 :isbn13)
  end

end
