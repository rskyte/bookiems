feature 'Signing in' do

  scenario 'new users have a sign up option' do\
    visit '/'
    click_on 'Sign up'
    expect(current_path).to eq '/signup'
  end

  scenario 'existing users can sign in' do
    signup
    signin
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome! joebloggs@hotmail.com'
  end

end
