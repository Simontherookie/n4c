class Gift < ActiveRecord::Base

  belongs_to :guest

  validates_presence_of :name
  
  attr_accessible :category, :description, :name

  scope :ungifted, where("guest_id IS NULL")

  def self.gifts_by_category
    categories = Gift.order(:id).all.map(&:category).uniq
    result = []
    categories.each do |category|
      result << {
        :category => category,
        :gifts => Gift.where(:category => category).order(:id)
      }
    end
    result
  end

end
