require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can view bookmark' do
    Bookmark.add('http://www.makersacademy.com', "Makers")
    Bookmark.add('http://www.test.com', "Test")
    visit('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Test', href: 'http://www.test.com')
  end
end
