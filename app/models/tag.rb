class Tag
  include Mongoid::Document

  field :name, :type => String
  field :code, :type => Integer

  has_and_belongs_to_many :books

end
