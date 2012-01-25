# -*- coding: utf-8 -*-

require 'capybara/rspec'

Zakładając /^W systemie mamy "([^"]*)" gier$/ do |count|
  FactoryGirl.create_list(:game, count.to_i)
end

Zakładając /^Jestem zalogowany jako użytkownik "([^"]*)"$/ do |login|
  @user = FactoryGirl.create(:user, :login => login)
  sign_in @user
end

Zakładając /^Mam rolę "([^"]*)"$/ do |role_name|
  role = FactoryGirl.create(:role, :name => role_name)
  @user.roles << role
end

Jeżeli /^Idę na stronę "([^"]*)"$/ do |page_name|
  visit page_name
end

Wtedy /^Widzę "([^"]*)"$/ do |content|
  page.should have_content(content)
end

Wtedy /^Wypełniam pole "([^"]*)" wartością "([^"]*)"$/ do |field_name, field_value|
  fill_in field_name, :with => field_value
end

Jeżeli /^Wciskam przycisk "([^"]*)"$/ do |button_name|
  click_button button_name
end
