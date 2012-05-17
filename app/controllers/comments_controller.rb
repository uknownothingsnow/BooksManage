# coding: utf-8
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if current_user
      current_user.comments << @comment
    else
      @comment.save
    end
    @book = Book.find(params[:comment][:book_id])

    redirect_to @book
  end
end
