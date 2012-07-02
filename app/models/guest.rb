class Guest < ActiveRecord::Base
  
  validates :name, presence: {allow_blank: false}
  validates :address, presence: {allow_blank: false}
  
  attr_accessible :address, :email, :name
end
