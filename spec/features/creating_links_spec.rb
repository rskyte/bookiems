feature "create new links" do
  scenario "add the site's address and title to my bookmark manager" do
    visit('/links')
    find_button("Add link")
  end
end
