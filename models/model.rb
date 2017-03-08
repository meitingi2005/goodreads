require 'goodreads'
require 'pp'



class Book
    attr_reader :book_title, :book_description, :book_img, :book_author, :book_location, :book_location_link, :book_pages
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
    
    def get_location
        @book_location_name_link = []
        @book_location_name_link << @client.book_by_title(@book_title).buy_links.buy_link.first.name
        @book_location_name_link << @client.book_by_title(@book_title).buy_links.buy_link.first.link
    end
    
    def get_pages
        @book_pages = @client.book_by_title(@book_title).work_num_pages
    end
end

book_title = Book.new("Catcher in the Rye")
#puts book_title.get_description
#puts book_title.get_location[0]
#puts book_title.get_location[1]
puts book_title.get_pages




























#pp client.book_by_title("Catcher in the Rye").buy_links.buy_link.first.name
pp client.book_by_title("Catcher in the Rye").buy_links.buy_link.first.link

# pp client.book_by_title("Catcher in the Rye").similar_books.book[1].authors.author.name

#pp client.book_by_title("Catcher in the Rye").buy_links.buy_link.first.link