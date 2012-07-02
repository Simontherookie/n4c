class Guest < ActiveRecord::Base
  
  validates :name, presence: {allow_blank: false}
  validates :email, presence: {allow_blank: false}
  
  attr_accessible :address, :email, :name
end
