class Gift < ActiveRecord::Base

  belongs_to :guest

  validates_presence_of :name
  
  attr_accessible :category, :description, :name

end
