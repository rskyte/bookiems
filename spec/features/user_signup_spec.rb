feature 'User Login' do

  scenario 'user can signup and be welcomed which increases user count by 1' do
    signup
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome! joebloggs@hotmail.com'
    expect(User.count).to eq 1
  end

  scenario 'user cannot signup when password confirmation fails' do
    signup(pass: 'jim')
    expect(current_path).to eq '/signup'
    expect(page).to have_content 'Password does not match the confirmation'
    expect(User.count).to eq 0
  end

  scenario 'user cannot sign up without an email address' do
    signup(email: nil)
    expect(page).to have_content 'Email must not be blank'
    expect(User.count).to eq 0
  end
end
