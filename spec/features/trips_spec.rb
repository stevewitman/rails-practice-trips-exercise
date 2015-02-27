require 'rails_helper'

feature 'Trip' do
  scenario 'Users can add a trip to a user' do
    user = User.create!({name:'Some User', email:'mail@example.com'})
    visit root_path
    click_on user.name
    click_on "New Trip"
    fill_in "Location", with: "TestLocation"
    fill_in "Date", with: "1/1/1111"
    fill_in "Cost", with: "3000"
    click_on "Create Trip"
    expect(page).to have_content("TestLocation")
    expect(page).to have_content("1/1/1111")
    expect(page).to have_content("3000")
  end
end
