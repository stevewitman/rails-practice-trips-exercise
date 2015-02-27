require 'rails_helper'

feature 'User' do
  scenario 'Users can view the show page' do
    user = User.create!({ name:"Some User", email: "test@example.com"})
    visit root_path
    click_on user.name
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end
