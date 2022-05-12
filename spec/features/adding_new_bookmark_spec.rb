
feature 'Adding new bookmarks' do
  scenario 'User can add a new bookmark to Bookmanager' do
    visit('/bookmarks/add')
    fill_in 'url', with: 'http://www.makersacademy.com'
    fill_in 'title', with: 'Makers'
    click_button 'Submit'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
  end
end
