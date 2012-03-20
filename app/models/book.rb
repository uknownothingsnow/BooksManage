class Book
  include Mongoid::Document
  mount_uploader :image, BookFaceUploader

  field :name
  field :image
  field :description
  field :price, :type => Float

  validates_presence_of :name
end
