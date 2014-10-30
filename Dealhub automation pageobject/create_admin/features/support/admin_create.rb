class AdminCreate
  include PageObject

  page_url "http://dealhub-staging.herokuapp.com/admins/sign_in"
  text_field(:email, id: "admin_email")
  text_field(:password, id: "admin_password")
  button(:login, name: "commit")
  link(:createadmin, text: "Create New Admin" )
  h2(:addnewadmin, text: "Add New Admin")
  text_field(:adminname, id: "admin_name")
  text_field(:adminemail, id: "admin_email")
  button(:create, name: "commit")
  link(:logout, text: "Logout")
  def login_with(email, password)
    self.email = email
    self.password = password
  end
  def create_with(name, email)
    self.adminname = name
    self.adminemail = email
  end
  def self.create_validation(name)
    div(:message_success, text: "#{name} user has been created")
  end
end