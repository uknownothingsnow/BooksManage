class BooksController < ApplicationController
  before_filter :find_book, :only => [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to books_url
    else
      render :action => :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update_attributes(params[:book])
      redirect_to @book
    else
      render :action => "edit"
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
