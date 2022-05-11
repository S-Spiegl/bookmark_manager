
feature 'Adding new bookmarks' do
  scenario 'User can add a new bookmark to Bookmanager' do
    visit('/bookmarks/index')
    fill_in 'url', with: 'http://www.makersacademy.com'
    click_button 'Submit'
    expect(page).to have_content('http://www.makersacademy.com')
  end
end