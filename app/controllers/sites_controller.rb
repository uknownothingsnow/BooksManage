class SitesController < ApplicationController
  def index
    @new_books = Book.where(:created_at.gt => 7.day.ago).order('created_at DESC').limit(5)
    @recommend_books = Book.where(:recommend => true)
  end

  def admin
    
  end
end
