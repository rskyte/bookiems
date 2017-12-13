feature 'Tagging' do

  scenario 'links can be filtered by tag' do
    add_bookmark('Google', 'bubbles')
    add_bookmark('Reddit', 'fun')
    visit '/tags/bubbles'
    expect(page).to_not have_content 'Reddit'
  end
end
