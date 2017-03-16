require 'goodreads'  
require 'pp'
# require 'googlebooks'

class Book
    attr_reader :book_title, :book_description, :book_img, :book_author, :similar_book_titles, :similar_book_authors, :similar_book_description, :book_pages, :book_location_name_link, :similar_books, :other_info, :similar_book_description, :error_message, :book_rating
    def initialize(book_title,other_info)
        @book_title = book_title
        @books = []
        @similar_books = []
        @other_info = other_info
         @book_pages = []
        @client = Goodreads::Client.new(api_key: "apl03Pv1Wh1qnhUF6iuwQ", api_secret: "m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY")
    end
    
    def get_title
        # begin 
            @book_title = @client.book_by_title(@book_title).title
        # rescue
        #     flash[:error] = "Your book was not found"
        #     render 'index.erb'
        # end
        
    end
    

    
    def get_author
        begin
        @book_author = @client.book_by_title(@book_title).authors.author.name
        rescue
        @book_title = @client.book_by_title(@book_title).authors.author[0]["name"]
        end
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
        # @similar_books = []
        for i in 0..2
            @similar_books << Book.new(@client.book_by_title(@book_title).similar_books.book[i].title,@client.book_by_title(@book_title).similar_books.book[i])
        end
        
    end
    
    def get_description
        @similar_book_description = []
      for i in 0..2
      title = @client.book_by_title(@book_title).similar_books.book[i].title
      description = @client.book_by_title(title).description
      @similar_book_description << description
      end
    end
    
        
    def get_pages
      for i in 0..2
      num_page = @client.book_by_title(@book_title).similar_books.book[i].num_pages.to_i
      @book_pages << {:pages => num_page, :message => get_message(num_page)}
      end
      @book_pages
    end
    
    def get_message(num)
        if num < 300
        "You can read this book in about 4 days."
        elsif num > 300 && num < 600
        "You can read this book in about a week."
        elsif num > 600 && num < 900
        "You can read this book in about a two weeks."
        else
        "This may take more than two weeks to read."
        end
    end
    
    def get_rating 
        @book_rating= @client.book_by_title(@book_title).average_rating
    end


end





# pp client.book_by_title("Catcher in the Rye").similar_books.book[1].authors.author.name

# catcher = Book.new("ThhDQV",{})
# puts catcher.get_title

# catcher = Book.new("Emma",{})
# puts catcher.get_title

# puts catcher.similar_book_title[0]
# puts catcher.similar_book_description

