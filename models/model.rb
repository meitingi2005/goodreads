require 'goodreads' 
require 'pp'
class Book
    attr_reader :book_title, :book_description, :book_img, :book_author, :similar_book_titles, :similar_book_authors, :similar_book_description, :book_pages, :book_location_name_link
    def initialize(book_title)
        @book_title = book_title
        @client = Goodreads::Client.new(api_key: "apl03Pv1Wh1qnhUF6iuwQ", api_secret: "m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY")
    end
    def get_title
        @book_title = @client.book_by_title(@book_title).title
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

    # pp @client.book_by_title("Catcher in the Rye")
    # pp @client.book_by_title("Catcher in the Rye").similar_books.book[0].description

    # def get_description
    #     @book_description = @client.book_by_title(@book_title).description
    # end
    
        
    def get_pages
        # @book_pages = []
        # @book_pages << @client.book_by_title(@similar_book_titles).similar_books.book[0].num_pages
        # @book_pages << @client.book_by_title(@similar_book_titles).similar_books.book[1].num_pages
        # @book_pages << @client.book_by_title(@similar_book_titles).similar_books.book[2].num_pages
        @book_pages = @client.book_by_title(@book_title).num_pages
    end
    
    def days_to_read_book
        if @book_pages[0] < 300
        puts "You can read this book in about 4 days."
        elsif @book_pages[0] > 300 && @book_pages[0] < 600
        puts "You can read this book in about a week."
        elsif @book_pages[0] > 600 && @book_pages[0] < 900
        puts "You can read this book in about a two weeks."
        else
        puts "This may take more than two weeks to read."
        end
    end

    def days_to_read_book
        if @book_pages[1] < 300
        puts "You can read this book in about 4 days."
        elsif @book_pages[1] > 300 && @book_pages[1] < 600
        puts "You can read this book in about a week."
        elsif @book_pages[1] > 600 && @book_pages[1] < 900
        puts "You can read this book in about a two weeks."
        else
        puts "This may take more than two weeks to read."
        end
    end
    
        def days_to_read_book
        if @book_pages[2] < 300
        puts "You can read this book in about 4 days."
        elsif @book_pages[2] > 300 && @book_pages[2] < 600
        puts "You can read this book in about a week."
        elsif @book_pages[2] > 600 && @book_pages[2] < 900
        puts "You can read this book in about a two weeks."
        else
        puts "This may take more than two weeks to read."
        end
    end
    
end

# book_title = Book.new("Catcher in the Rye")
# puts book_title.get_image 
# puts book_title.get_location[0]
# puts book_title.get_location[1]
# puts book_title.get_pages
# puts book_title.days_to_read_book


# pp client.book_by_title("Catcher in the Rye").similar_books.book[1].authors.author.name

  
# catcher = Book.new("Catcher in the Rye")
# puts catcher.get_author
# puts catcher.similar_book_title[0]
# puts catcher.similar_book_description

