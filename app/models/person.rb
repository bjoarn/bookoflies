class Person < ActiveRecord::Base

validates_presence_of :name, :email
validates_uniqueness_of :email

validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

validates_presence_of :new_password, :new_password_confirmation, :if => Proc.new { |usr| usr.validate_password? }
validates_length_of :new_password, :minimum => 6, :if => Proc.new { |usr| usr.validate_password? }
validates_confirmation_of :new_password, :if => Proc.new { |usr| usr.validate_password? }

def validate_password?
  # always validate a new person
  return true if new_record?
  # otherwise, only validate when new_password is set (password is not changed by 'save' if blank)
  return !new_password.blank?
end

attr_accessor :new_password, :new_password_confirmation

def Person.authenticate(email, password)
  person = Person.find_by_email(email)
  if person
    person = nil unless person.password_hash == password
  end
  person
end

def save
  self.password = new_password unless new_password.blank?
  super
end

def password=(new_password)
  @password = new_password
  self.password_hash = @password
end

end
