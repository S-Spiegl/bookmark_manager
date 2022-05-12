require 'pg'

class Bookmark

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
      result = connection.exec('SELECT * FROM bookmarks')
      result.map {|bookmark| Bookmark.new(id: bookmark['id']) }
      # Bookmarks.new(id: bookmark[‘id’]
  end

  def self.add(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
  end
end

#revisit the question of difference between:
# ENV['ENVIRONMENT'] = 'test'
# and:
# ENV['RACK_ENV'] = 'test'
