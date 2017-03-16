require 'goodreads'  #using the gem "goodreads" which is the api for this project
require 'pp'

class Book 
    attr_reader :book_title, :book_description, :book_img, :book_author, :similar_book_titles, :similar_book_authors, :similar_book_description, :book_pages, :book_location_name_link, :similar_books, :other_info, :similar_book_description, :error_message, :book_rating
    def initialize(book_title,other_info) #every new book will be asked for a title and other information including author, rating, descriptive and etc. The other other info will be in the form of a big hash.
        @book_title = book_title
        @similar_books = [] #this array will be used in the similar books method and will hold all the information of the similar books including title and the other info.
        @other_info = other_info 
        @book_pages = [] #the array holds the three similar book pages
        @client = Goodreads::Client.new(api_key: "apl03Pv1Wh1qnhUF6iuwQ", api_secret: "m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY") 
    end
    
    def get_title
        begin 
            @book_title = @client.book_by_title(@book_title).title #gets user input as book_title and finds that book_title within the Goodreads hash --> it will return the title or name of the book
            erb:result #direction is set to result.erb page
        rescue
            @book_title != @client.book_by_title(@book_title).title
            "Sorry, your book was not found"  #if user input of book_title is not found within the hash this quote is displayed 
        end
    end
    def get_author
        begin
        @book_author = @client.book_by_title(@book_title).authors.author.name #uses the book title the user enters to find the author in the the "authors" hash and that name will equal to book _author variable.
        rescue #for this api, some books have an array in their "other_info"
        @book_title = @client.book_by_title(@book_title).authors.author[0]["name"]
        end
    end

    def get_image
        @book_image = @client.book_by_title(@book_title).image_url 

    end
    
    
    def get_similar_books
        # @similar_books = []
        for i in 0..2  #using a for loop to go through the first three similar books, it will stop once it hits 2.
            @similar_books << Book.new(@client.book_by_title(@book_title).similar_books.book[i].title,@client.book_by_title(@book_title).similar_books.book[i]) #to make the method more efficient, the computer will go inside user_book hash and take the similar title and other info to make a new instance of the class Book. In this case, the three books will be instances of the class thus can use all the instance methods. We push all three new instances into the similar_books array.
        end
        
    end
    
    def get_description #this is only for the similar books
        @similar_book_description = [] #we use an array to hold the description because we will call it using index number in the result.erb page. It is easier to organize the three descriptions
        for i in 0..2 
        title = @client.book_by_title(@book_title).similar_books.book[i].title #in the user_book has, all the similar books don't have desciptions in the similar_books hash so we need to take the title for each books and set it to a new variable.
        description = @client.book_by_title(title).description #use the new varible "title" to get all the information about that particular book which is a big hash that has the title, author, desciption, list of similar books, etc.
        @similar_book_description << description
        end
    end
    
        
    def get_pages
      for i in 0..2
      num_page = @client.book_by_title(@book_title).similar_books.book[i].num_pages.to_i #the num_pages in the hash is in the form of a string and since we want to use the page num to compare to another number, we will have to turn it into an integer.
      @book_pages << {:pages => num_page, :message => get_message(num_page)} #we want to pass the num page we got from the hash to the get_message method so we use a hash to assign num_page as the key and the message as the value so that we can call it in the result page 
      end
      @book_pages # to avoid the computer from displaying the "0..2", we want to return the bool_pages array.
    end
    
    def get_message(num)
        if num < 300 # if the page_num is less than 300, it will return the message below
        "You can read this book in about 4 days."
        elsif num > 300 && num < 600 # if the page_num is greater than 300 or less than 600
        "You can read this book in about a week."
        elsif num > 600 && num < 900 # if the page_num is greater than 600 or less than 900
        "You can read this book in about a two weeks."
        else
        "This may take more than two weeks to read."
        end
    end
    
    def get_rating 
        @book_rating= @client.book_by_title(@book_title).average_rating
    end


end




