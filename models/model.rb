# key: apl03Pv1Wh1qnhUF6iuwQ
# secret: m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY
require 'goodreads'
require 'pp'
# client = Goodreads::Client.new(api_key: "apl03Pv1Wh1qnhUF6iuwQ", api_secret: "m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY")
class Book
    attr_reader :book_title, :book_description, :book_img, :book_author
    def initialize(book_title)
        @book_title = book_title
        @client = Goodreads::Client.new(api_key: "apl03Pv1Wh1qnhUF6iuwQ", api_secret: "m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY")
        # @user_book_author = user_book_author
        # @user_book_description = user_book_description
        # @user_book_img = user_book_img
    end
    def get_title
        @book_title = @client.book_by_title(@book_title).title
    end
    def get_author
        @book_author = @client.book_by_title(@book_title).authors.author.name 
    end
    def get_description
        @book_description = @client.book_by_title(@book_title).description
    end
    # def get_image
    #      book_image = @client.book_by_title(@book_title).
    # end
end

book_title = Book.new("Catcher in the Rye")
puts book_title.get_description



