require 'dotenv/load'
require 'bundler'
require 'goodreads'
require 'pry'
require './config/environment'

Bundler.require

require_relative '../models/book.rb'


class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do 
    erb :index
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.savedbooks = []
    @user.save
    session[:id] = @user.id
    redirect '/'
  end
  

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params["email"], password: params["password"])
    session[:id] = @user.id
    redirect '/'
  end

  get '/sessions/logout' do 
    session.clear
    redirect '/'
  end

  get '/users/home' do
   @user = User.find(session[:id])
    erb :'/users/home'
  end
  

  post '/result' do
    
    puts params
    book_title = params[:book_title] #sets book title variable equal to the user input of book_title
    @user_book = Book.new(book_title,{}) #creates new book (set to the variable @user_book) with the arguments of an empty array and book_title (user input)
    # allows the following methods to be visible in the result.erb
    # @user = User.find_by(:id => session[:user_id])
    @user_book.get_similar_books  
    @user_book.get_description
    @user_book.get_pages
    @user_book.get_goodreads_url
    @user_book.get_rating
    
    erb :result
  end
  
  get '/wishlist' do
    @user = User.find_by(:id => session[:id])
    
    erb :wishlist
  end
  
  post '/wishlist' do
    book_title = params[:book_title]
    @user = User.find_by(:id => session[:id])
    @book_title = Book.new(book_title: book_title)
    @book_title.save
    @user.savedbooks << @book_title
    @user.save
    
    # @book_title.save_books(@user,@book_title)
    # session[:id] = @user.id / book.user.id = user.id
    # @savedbook = Book.new(book_title, {})
  erb :wishlist
  end
  
end


# @current_book = Book.find_by_id(params[:id])


#where do I put the client code? 
#current book. How to I get the current book and add that to the user's database?
#how to add the current book to user wishlist?
#find book by id and to use the id to get the book information(title,author,image)
#push the book into the array and to iterate ot in the wishlist.erb
#Book.new(current book title and other stuff)??? when the user click it.
#Not touch the similar books Book.new?

  # Book.create(:user_id => params[:user_id], :status => params[:status]) 
