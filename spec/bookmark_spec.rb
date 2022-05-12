require 'bookmark'
require 'pg'

describe Bookmark do
  describe '#all' do
    it 'returns a list of bookmarks' do
      bookmark = Bookmark.add("http://www.makersacademy.com", 'Makers')
      Bookmark.add("http://www.orangepippintrees.co.uk", 'Orange')
      Bookmark.add("http://www.test.com", 'Test')
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title). to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

#
#    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
#   end
# end

  describe '#add' do
    it 'adds a bookmark' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      url = 'www.makers.com'
      title = 'Makers'
      Bookmark.add(url, title)
      expect(Bookmark.all.first).to eq([url, title])
    end
  end
end

# Test drive a refactor of the code to use a Model, that returns the list of bookmarks.
# You'll probably want to create a Bookmark model that responds to the class method .all with a hard-coded array of Bookmark instances.
