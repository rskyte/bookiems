def add_bookmark(name, tag)
  visit '/links/new'
  fill_in 'url',   with: 'http://www.makersacademy.com/'
  fill_in 'title', with: name
  fill_in 'tags',  with: tag
  click_button 'Create link'
end

def add_tag(tag)
  visit '/newtag'
  fill_in 'tag', with: tag
  fill_in 'title', with: 'Makers Academy'
  click_button 'Create tag'
end
