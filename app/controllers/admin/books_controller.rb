class Admin::BooksController < Admin::ApplicationController
  before_filter :find_book, :only => [:show, :edit, :update, :destroy]

  def index
    @books = Book.page(params[:page]).per(10)
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  def show
    render 'books/show'
  end

  def new
    @book = Book.new
  end

  def edit
    @tags = Tag.all
  end

  def update
    if @book.update_attributes(params[:book])
      redirect_to [:admin, @book]
    else
      render :action => "edit"
    end
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end
end
