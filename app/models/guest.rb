class Guest < ActiveRecord::Base
  
  validates :name, presence: {allow_blank: false}
  validates :email, presence: {allow_blank: false}
  
  scope :going_to_reception, where(:going_to_reception => true)
  scope :not_going_to_reception, where("going_to_reception != ?", true)

  attr_accessible :address, :email, :name

  before_save :downcase_email

  private
    def downcase_email
      self.email = self.email.downcase
    end
end
