require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
      result = connection.exec('SELECT * FROM bookmarks')
      result.map do |bookmark|
        Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.add(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
      # result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
      result = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, url, title;", [url, title])
      #exec_params(sql, params[, result_format ]) ⇒ PG::Result
#exec_params(sql, params[, result_format ]) {|pg_result| ... } ⇒ Object

      # SQL injection:
      # INSERT INTO bookmarks (url, title) VALUES ('http://www.myspace.com', 'Myspace'); DROP TABLE bookmarks;-- RETURNING id, url, title;
      # Myspace'); DROP TABLE bookmarks;--

      Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec_params("DELETE FROM bookmarks WHERE id = $1;", [id])
  end
end



#revisit the question of difference between:
# ENV['ENVIRONMENT'] = 'test'
# and:
# ENV['RACK_ENV'] = 'test'
