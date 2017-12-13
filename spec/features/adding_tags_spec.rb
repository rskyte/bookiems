feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    add_bookmark('Makers Academy', 'education')
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

end
