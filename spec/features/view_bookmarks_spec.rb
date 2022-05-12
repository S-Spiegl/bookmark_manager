require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can view bookmark' do
    Bookmark.add(url: 'http://www.makersacademy.com', title: "Makers")
    Bookmark.add(url: 'http://www.test.com', title: "Test")
    visit('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Test', href: 'http://www.test.com')
  end
end
