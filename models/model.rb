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
    def get_author
        book_author = @client.book_by_title(@book_title).authors.author.name 
    end

end

catcher = Book.new("Catcher in the Rye")
puts catcher.get_author
#  user_book_author = client.book_by_title(user_book_title).authors.author.name 

# puts client.book_by_title(user_book_title)



# # # pp client.book_by_title("The Great Gatsby").popular_shelves.shelf[3]
# # author = client.author("3190")
# # puts author.about
# user_book_title = "Catcher in the Rye"
# puts client.book_by_title(user_book_title).title
# puts client.book_by_title(user_book_title).authors.author.name #argument will become variable for user input
# puts client.book_by_title(user_book_title).description #use regex to find tags and delete them so we can puts the quote
# puts client.book_by_title(user_book_title).img


