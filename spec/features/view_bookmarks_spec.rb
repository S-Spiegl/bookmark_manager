require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can view bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES (1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES (2, 'http://www.orangepippintrees.co.uk');")
    connection.exec("INSERT INTO bookmarks VALUES (3, 'http://www.test.com');")
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.orangepippintrees.co.uk"
    expect(page).to have_content "http://www.test.com"
  end
end
