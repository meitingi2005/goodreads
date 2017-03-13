require 'goodreads' 
require 'pp'
class Book
    attr_reader :book_title, :book_description, :book_img, :book_author, :similar_books, :other_info
    def initialize(book_title,other_info)
        @book_title = book_title
        @books = []
        @other_info = other_info
        @client = Goodreads::Client.new(api_key: "apl03Pv1Wh1qnhUF6iuwQ", api_secret: "m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY")
    end
    def get_title
        @book_title = @client.book_by_title(@book_title).title
        # pp @client.book_by_title("Jane Eyre")
    end
    
    def get_author
        @book_author = @client.book_by_title(@book_title).authors.author.name 
    end

    def get_image
        @book_image = @client.book_by_title(@book_title).image_url
    end

    def get_location
        @book_location_name_link = []
        @book_location_name_link << @client.book_by_title(@book_title).buy_links.buy_link.first.name
        @book_location_name_link << @client.book_by_title(@book_title).buy_links.buy_link.first.link
    end

    def get_similar_books
        
        @similar_books = []
        for i in 0..2
            @similar_books << Book.new(@client.book_by_title(@book_title).similar_books.book[i].title,@client.book_by_title(@book_title).similar_books.book[i])
        end
    end
  

end

# book_title = Book.new("Catcher in the Rye")

# pp book_title.similar_book_image
# pp book_title.get_title
# pp book_title.get_image 



# pp client.book_by_title("Catcher in the Rye").similar_books.book[1].authors.author.name

  
# catcher = Book.new("Catcher in the Rye")
# puts catcher.get_title
# puts catcher.similar_book_title[0]
# puts catcher.similar_book_description

