class Session
  extend ActiveModel::Naming
  attr_accessor :email
  def initialize(attributes)
    attributes ||= {}
    self.email = attributes[:email].try(:downcase)
  end

  def guest
    @_guest ||= Guest.find_by_email(email)
  end

  def to_key
    nil
  end

  def persisted?
    false
  end

end
