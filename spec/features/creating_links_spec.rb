feature "create new links" do

  scenario "there is a button to add links" do
    visit('/links')
    find_button("Add link")
  end
  scenario "new links can be created and added to Bookmark Manager" do
    visit('/links')
    click_button("Add link")
    fill_in 'title', with: 'Reddit'
    fill_in 'url', with: "http://www.reddit.com"
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content 'Reddit'
    end
  end
end
