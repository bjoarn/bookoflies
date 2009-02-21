class Mailer < ActionMailer::Base
  def password_change(user, new_password)
    subject     "Nyt Password til musikbranchen"
    recipients  user.email
    from        "Musikbranchen <bjoarn@gmail.com>"
    body        :user => user, :new_password => new_password
  end
end