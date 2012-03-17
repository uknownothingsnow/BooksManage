class Book
  include Mongoid::Document
  field :name
  field :image
  field :description
  field :price, :type => Float

  validates_presence_of :name
end
