class Admin::BooksController < Admin::ApplicationController
  before_filter :find_book, :only => [:show, :edit, :update, :destroy]

  def index
    @books = Book.page(params[:page]).per(10)
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to admin_books_url
    else
      render :new
    end
  end

def destroy
  @book.destroy
  redirect_to admin_books_url
end
 def search
    books = Book.scoped
    books = books.name_like(params[:name]) if params[:name].present?
    books = books.publish_gteq(params[:publish_gteq]) if params[:publish_gteq].present?
    books = books.publish_lteq(params[:publish_lteq]) if params[:publish_lteq].present?
    @books = books.page(params[:page]).per(10)
    render :index
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
