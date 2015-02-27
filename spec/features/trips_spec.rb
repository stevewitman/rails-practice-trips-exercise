require 'rails_helper'

feature 'Trip' do
  scenario 'Users can add a trip to a user' do
    user = User.create!({name:'Some User', email:'mail@example.com'})
    visit root_path
    click_on user.name
    click_on "New Trip"
    fill_in "Location", with: "TestLocation"
    fill_in "Date", with: "10/1/2016"
    fill_in "Cost", with: "3000"
    click_on "Create Trip"
    expect(page).to have_content("TestLocation")
    expect(page).to have_content("3000")
    expect(page).to have_content("Your trip was successfully saved.")
  end

  scenario "Users can edit and delete trips" do
    user = User.create!({name:'Some User', email:'mail@example.com'})
    visit root_path
    click_on user.name
    click_on "New Trip"
    fill_in "Location", with: "TestLocation"
    fill_in "Date", with: "10/1/2016"
    fill_in "Cost", with: "3000"
    click_on "Create Trip"
    click_on "edit"
    fill_in "Location", with: "TestLocation2"
    fill_in "Date", with: "10/2/2016"
    fill_in "Cost", with: "2000"
    click_on "Update Trip"
    expect(page).to have_content("TestLocation2")
    expect(page).to have_content("2000")
    expect(page).to have_content("Your trip was successfully updated.")
    click_on "edit"
    click_on "Delete Trip"
    expect(page).to have_content("Your trip was successfully deleted.")
    expect(page).to have_no_content("TestLocation2")
  end

  scenario "Users must enter all fields" do
    user = User.create!({name:'Some User', email:'mail@example.com'})
    visit root_path
    click_on user.name
    click_on "New Trip"
    click_on "Create Trip"
    expect(page).to have_content("Location can't be blank")
    expect(page).to have_content("Date can't be blank")
    expect(page).to have_content("Cost can't be blank")
  end
end
