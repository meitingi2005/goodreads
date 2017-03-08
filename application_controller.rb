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
    # book_title = params[:book_title]
    # @book = Book.new(book_title)
    # @book.get_title
    # @book.get_author
    # @book.get_image
    
    erb :result
  end
  
end
