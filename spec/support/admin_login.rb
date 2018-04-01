def login_as_admin
  email = "non@non.com"
  password = "password123"
  admin = Admin.create(email: email, password: password)
  visit new_admin_session_path
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_on "Log in"
end
