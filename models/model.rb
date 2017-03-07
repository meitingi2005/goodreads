
require 'goodreads'
require 'pp'
client = Goodreads::Client.new(api_key: "apl03Pv1Wh1qnhUF6iuwQ", api_secret: "m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY")
# pp client.book_by_title("The Great Gatsby").popular_shelves.shelf[3]
#author = client.author("3190")
#puts author.about
#puts client.book_by_title("Catcher in the Rye").authors.author.name #argument will become variable for user input
#puts client.book_by_title("Catcher in the Rye").description #use regex to find tags and delete them so we can pust the quote

# user_book_author = client.book_by_title(user_book_title).authors.author.name 




















class Book
    attr_accessor :user_book_title, :client, :description
   
    
    def initialize(user_book_title)
        @user_book_title = user_book_title
    end
    
    def book_infor
        @client = client.book_by_title(@user_book_title)
        description = client.book_by_title(@user_book_title).description

    end
end

Gatsby = Book.new("The Great Gatsby")
Gatsby.book_infor


# pp client.book_by_title("Catcher in the Rye").similar_books.book[1].authors.author.name