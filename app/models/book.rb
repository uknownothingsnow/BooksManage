class Book
  include Mongoid::Document
  mount_uploader :image, BookFaceUploader

  field :name
  field :image
  field :description
  field :count, :type => Integer, :default => 1
  field :price, :type => Float
  field :publish_at, :type => Integer

  validates_presence_of :name

  has_and_belongs_to_many :tags

  scope :name_like, lambda{|name| where(:name => /.*#{name}.*/i)}
  scope :publish_gteq, lambda {|publish| where(:publish_at.gte => publish)}
  scope :publish_lteq, lambda {|publish| where(:publish_at.lte => publish)}

end
