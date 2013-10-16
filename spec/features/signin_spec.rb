require 'spec_helper'

describe "the signin process", type: :feature do
  before :each do
    User.create(username: "test", email: "test@example.com", password: "test")
  end

  it 'has a sign in page' do
    visit new_session_url
    expect(page).to have_content 'Sign In'
  end

  it 'signs me in' do
    visit '/session/new'
    within('form.sign-in') do
      fill_in 'user_username', with: 'test'
      fill_in 'user_password', with: 'test'
    end
    click_button 'sign_in_submit'
    expect(page).to have_content 'Hello test!'
  end
end
