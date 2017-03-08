require 'goodreads' 
require 'pp'
class Book
    attr_reader :book_title, :book_description, :book_img, :book_author, :similar_book_titles, :similar_book_authors, :similar_book_description
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
    
    def get_image
         book_image = @client.book_by_title(@book_title).image_url
    end
    
    def get_location
        @book_location_name_link = []
        @book_location_name_link << @client.book_by_title(@book_title).buy_links.buy_link.first.name
        @book_location_name_link << @client.book_by_title(@book_title).buy_links.buy_link.first.link
    end
    
    def similar_book_author
        @similar_book_authors = []
        @similar_book_authors << @client.book_by_title(@book_title).similar_books.book[0].authors.author.name
        @similar_book_authors << @client.book_by_title(@book_title).similar_books.book[1].authors.author.name
        @similar_book_authors << @client.book_by_title(@book_title).similar_books.book[2].authors.author.name
        # client.book_by_title("Catcher in the Rye").similar_books.book[0].authors.author.name
    end
    def similar_book_title
        @similar_book_titles = []
        @similar_book_titles << @client.book_by_title(@book_title).similar_books.book[0].title
        @similar_book_titles << @client.book_by_title(@book_title).similar_books.book[1].title
        @similar_book_titles << @client.book_by_title(@book_title).similar_books.book[2].title
    end
    def similar_book_description
        @similar_book_description = []
        title = @client.book_by_title(@book_title).similar_books.book[0].title
        description = @client.book_by_title(title).description
        @similar_book_description << description
    end
    
    
end
  
catcher = Book.new("Catcher in the Rye")
puts catcher.get_author
puts catcher.similar_book_title[0]
puts catcher.similar_book_description 