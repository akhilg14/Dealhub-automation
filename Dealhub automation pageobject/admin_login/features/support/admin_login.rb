class AdminLogin
  include PageObject

  page_url "http://dealhub-staging.herokuapp.com/admins/sign_in"
  text_field(:email, id: "admin_email")
  text_field(:password, id: "admin_password")
  button(:login, name: "commit")
  div(:message_success, text: "Signed in successfully.")
  div(:message_fail, text: "Invalid email address or password.")
  link(:logout, text: "Logout")


  def login_with(email, password)
    self.email = email
    self.password = password
  end
end
