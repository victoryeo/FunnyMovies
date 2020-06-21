require "rails_helper"
include Warden::Test::Helpers
#Warden.test_mode!

RSpec.feature 'The features', :type => :feature do
  given!(:user) {User.create!(email: "2@2.com", password: "123456")}

  scenario 'login to page' do
    pp user.id
    visit new_user_session_path
    find('div.useremail').fill_in 'user_email', :with => 'email'
    find('div.userpd').fill_in 'user_password', with: ''
    click_on 'Log in'
    expect(page).to have_text 'Log in'
  end
  scenario 'they see the video on the page' do
    pp user.id
    login_as(user, scope: :user)
    #Expectations
    #page.set_rack_session(current_user: user)
    visit new_video_path
    fill_in 'video_video_url', :with => 'https://www.youtube.com'
    click_button 'Share Video'
    expect(page).to have_text 'Back to videos'
  end
end
