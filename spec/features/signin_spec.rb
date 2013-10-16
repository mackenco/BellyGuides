require 'spec_helper'

describe "the signin process", type: :feature do

  user = FactoryGirl.create(:user)

  it 'has a sign in page' do
    visit new_session_url
    expect(page).to have_content 'Sign In'
  end

  it 'signs me in' do
    visit '/session/new'
    within('form.sign-in') do
      fill_in 'user_username', with: user.username
      fill_in 'user_password', with: user.password
    end
    click_button 'sign_in_submit'
    expect(page).to have_content 'Hello '+user.username+'!'
  end
end
