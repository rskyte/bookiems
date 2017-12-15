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

def signup(email: 'joebloggs@hotmail.com', pass: 'joebloggs', pass_conf: 'joebloggs')
  visit '/signup'
  fill_in :email, with: email
  fill_in :password, with: pass
  fill_in :password_confirmation, with: pass_conf
  click_on 'Sign up'
end
