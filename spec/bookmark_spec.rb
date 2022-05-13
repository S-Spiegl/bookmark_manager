require 'bookmark'
require 'pg'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: 'Makers')
      Bookmark.add(url: "http://www.orangepippintrees.co.uk", title: 'Orange')
      Bookmark.add(url: "http://www.test.com", title: 'Test')
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title). to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.add' do
    it 'adds a bookmark' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.add(url: 'http://www.makers.com', title: 'Makers')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Makers'
      expect(bookmark.url).to eq 'http://www.makers.com'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.add(url: "http://www.makersacademy.com", title: 'Makers')
      Bookmark.add(url: "http://www.orangepippintrees.co.uk", title: 'Orange')
      Bookmark.add(url: "http://www.test.com", title: 'Test')
      Bookmark.delete(id: 1)
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 2
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title). to eq 'Orange'
      expect(bookmarks.first.url).to eq 'http://www.orangepippintrees.co.uk'
    end
  end
end

# Test drive a refactor of the code to use a Model, that returns the list of bookmarks.
# You'll probably want to create a Bookmark model that responds to the class method .all with a hard-coded array of Bookmark instances.
