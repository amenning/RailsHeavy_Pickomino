class Spinach::Features::SignIn < Spinach::FeatureSteps
  include Features::SessionHelpers

  step 'I do not exist as a user' do
    @user = User.new(email: 'test@example.com', password: 'please123')
    unless User.find_by(email: @user.email).nil?
      raise 'Example email should not exist in DB for this test'
    end
  end

  step 'I sign in with valid credentials' do
    signin(@user.email, @user.password)
  end

  step 'I see an invalid credentials message' do
    expect(page).to have_content('Invalid Email or password.')
  end

  step 'I exist as a user' do
    # Need to load constants stored in DB for post signin redirect
    load Rails.root + 'db/seeds.rb'
    @user = FactoryGirl.create(:user)
    @user.confirm
  end

  step 'I am not signed in' do
    raise 'User was signed in already.' unless @user.sign_in_count.zero?
  end

  step 'I see a success message' do
    expect(current_path).to eq(play_games_path)
    expect(page).to have_content('Signed in successfully.')
  end

  step 'I sign in with a wrong email' do
    signin('wrongemail@wrong.com', @user.password)
  end

  step 'I see an invalid email message' do
    expect(page).to have_content('Invalid Email or password.')
  end

  step 'I sign in with a wrong password' do
    signin(@user.email, 'wrongpassword')
  end

  step 'I see an invalid password message' do
    expect(page).to have_content('Invalid Email or password.')
  end
end
