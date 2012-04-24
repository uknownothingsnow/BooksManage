class Tag
  include Mongoid::Document

  field :name, :type => String
  field :code, :type => Integer

  has_and_belongs_to_many :books

  scope :name_like, lambda{|name| where(:name => /.*#{name}.*/i)}
end
