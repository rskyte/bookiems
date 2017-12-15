feature "create new links" do

  scenario "there is a button to add links" do
    visit('/links')
    find_button("Add link")
  end
  scenario "new links can be created and added to Bookmark Manager" do
    add_bookmark('Reddit', 'fun')
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content 'Reddit'
    end
  end
  scenario 'links can be created with multiple tags' do
    add_bookmark('Reddit', 'fun,procrastination,entertainment')
    within 'ul#links' do
      expect(page).to have_content '-fun -procrastination -entertainment'
    end
  end
end
