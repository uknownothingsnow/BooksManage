class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :user_id, :type => Integer
  field :book_id, :type => Integer
  field :content

  belongs_to :book
  belongs_to :user
end
