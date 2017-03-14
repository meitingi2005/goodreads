require 'dotenv/load'
require 'bundler'
require 'goodreads'

Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    puts params
    book_title = params[:book_title]
    @user_book = Book.new(book_title,{})
    @user_book.get_similar_books
    @user_book.get_description
    # puts @error_message 
    @user_book.get_pages


    
    erb :result
  end
  
end
