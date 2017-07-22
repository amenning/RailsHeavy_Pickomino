class Spinach::Features::SignIn < Spinach::FeatureSteps
  include Features::SessionHelpers

  step 'I do not exist as a user' do
    unless User.find_by(email: 'test@example.com').nil?
      raise 'Example email should not exist in DB for this test'
    end
  end

  step 'I sign in with valid credentials' do
    signin('test@example.com', 'please123')
  end

  step 'I see an invalid credentials message' do
    pending 'step not implemented'
  end

  step 'I exist as a user' do
    pending 'step not implemented'
  end

  step 'I am not signed in' do
    pending 'step not implemented'
  end

  step 'I see a success message' do
    pending 'step not implemented'
  end

  step 'I sign in with a wrong email' do
    pending 'step not implemented'
  end

  step 'I see an invalid email message' do
    pending 'step not implemented'
  end

  step 'I sign in with a wrong password' do
    pending 'step not implemented'
  end

  step 'I see an invalid password message' do
    pending 'step not implemented'
  end
end
