feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    add_bookmark('Makers Academy', 'education')
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

  scenario 'I can add multiple tags to a new link' do
    add_bookmark('Makers Academy', 'education')
    add_tag('growth')
    add_tag('coding')
    link = Link.first
    expect(page).to have_content '-education -growth -coding'
  end

end
