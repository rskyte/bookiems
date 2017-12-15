feature 'User Login' do

  scenario 'user can login and be welcomed which increases user count by 1' do
    visit '/signup'
    fill_in :email, with: 'joebloggs@hotmail.com'
    fill_in :password, with: 'joebloggs'
    click_on 'Sign up'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome! joebloggs@hotmail.com'
    expect(User.count).to eq 1
  end
end
