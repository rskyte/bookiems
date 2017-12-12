feature "bookmark links" do
  scenario "see a list of links on homepage" do
    visit('/links')
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content "capybara cheat sheet"
    end
  end
end
