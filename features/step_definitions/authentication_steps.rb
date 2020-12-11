# frozen_string_literal: true

Given('I visit the homepage') do
  visit root_path
end

When('I click in the Sign Up link') do
  click_link 'Cadastrar'
end

When('I fill in the sign up form') do
  fill_in 'user_name', with: 'José da Silva'
  fill_in 'user_email', with: 'jose.silva@test.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'

  click_button 'Cadastrar'
end

Then('I should be redirected to user root url') do
  expect(current_url).to eq(user_root_url)
end

Given('I am a registered user') do
  @registered_user = FactoryBot.create(:user)
end

When('I click in the Sign In link') do
  click_link 'Minha Conta'
end

When('I fill in the sign in form') do
  fill_in 'user_email', with: @registered_user.email
  fill_in 'user_password', with: @registered_user.password

  click_button 'Entrar'
end

When('I click on the sign out link') do
  click_link 'Sair'
end

Then('I should be redirected to root url') do
  expect(current_url).to eq(root_url)
end

When('I click on the forgot password link') do
  click_link 'Esqueceu sua senha?'
end

When('I fill in the forgot password form') do
  fill_in 'user_email', with: @registered_user.email

  click_button 'Send me reset password instructions'
end

When('I receive an email to reset my password') do
  open_email(@registered_user.email)
  expect(current_email.subject).to eq('Reset password instructions')

  click_first_link_in_email
end

Then('I should be redirected to a page to create a new password') do
  expect(page).to have_content('Change your password')
end
