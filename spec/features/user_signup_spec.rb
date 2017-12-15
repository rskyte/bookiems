feature 'User Login' do

  scenario 'user can signup and be welcomed which increases user count by 1' do
    visit '/signup'
    fill_in :email, with: 'joebloggs@hotmail.com'
    fill_in :password, with: 'joebloggs'
    fill_in :password_confirmation, with: 'joebloggs'
    click_on 'Sign up'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome! joebloggs@hotmail.com'
    expect(User.count).to eq 1
  end

  scenario 'user cannot signup when password confirmation fails' do
    visit '/signup'
    fill_in :email, with: 'joebloggs@hotmail.com'
    fill_in :password, with: 'joebloggs'
    fill_in :password_confirmation, with: 'joeblogg'
    click_on 'Sign up'
    expect(current_path).to eq '/signup'
    expect(User.count).to eq 0
  end
end
