require 'dotenv/load'
require 'bundler'
require 'goodreads'
# require 'googlebooks'

Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    puts params
    book_title = params[:book_title] #sets book title variable equal to the user input of book_title
    @user_book = Book.new(book_title,{}) #creates new book (set to the variable @user_book) with the arguments of an empty array and book_title (user input)
    @user_book.get_similar_books
    @user_book.get_description
    @user_book.get_pages
    @user_book.get_rating
    
    erb :result
  end
  
end
