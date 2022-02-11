require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

      bookmarks = Bookmark.all
      
      expect(bookmarks).to include ('http://www.makersacademy.com')
      expect(bookmarks).to include ('http://www.destroyallsoftware.com')
      expect(bookmarks).to include ('http://www.google.com')
    end
  end

    describe '.create' do
      it 'creates a new bookmark' do
        Bookmark.create(url: 'http://www.example.com')

        expect(Bookmark.all).to include 'http://www.example.com'
      end
  end
end
