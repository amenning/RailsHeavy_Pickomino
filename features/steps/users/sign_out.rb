class Spinach::Features::SignOut < Spinach::FeatureSteps
  include Features::SessionHelpers

  step 'I am signed in' do
    # Need to load constants stored in DB for post signin redirect
    load Rails.root + 'db/seeds.rb'
    @user = FactoryGirl.create(:user)
    @user.confirm
    signin(@user.email, @user.password)
    expect(page).to have_content('Signed in successfully.')
  end

  step 'I sign out' do
    click_link 'Sign out'
  end

  step 'I see a signed out message' do
    expect(page).to have_content('Signed out successfully.')
  end
end
