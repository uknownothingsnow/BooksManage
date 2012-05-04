# coding: utf-8
class BooksController < ApplicationController
  before_filter :find_book, :only => [:show, :edit, :update, :destroy]
  def index
    @books = Book.page(params[:page]).per(10)
  end

  def show_list_by_tag
    @books = Tag.find(params[:id]).books.page(params[:page]).per(10)
  end

  def search
    books = Book.scoped
    books = books.name_like(params[:name]) if params[:name].present?
    books = books.publish_gteq(params[:publish_gteq]) if params[:publish_gteq].present?
    books = books.publish_lteq(params[:publish_lteq]) if params[:publish_lteq].present?
    @books = books.page(params[:page]).per(10)
    render :index
  end

  def like
   current_user.books << Book.find(params[:id])
   respond_to :js
  end

  def not_like
   current_user.books.delete Book.find(params[:id])
    redirect_to favorite_books_url
  end

  def favorite
    @books = current_user.books.page(params[:page]).per(10)
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end
end
