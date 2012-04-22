class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_tags

  def get_tags
    @tags = Tag.all
  end
end
