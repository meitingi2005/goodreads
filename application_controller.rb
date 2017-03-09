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
    @user_book = Book.new(book_title)
    
    erb :result
  end
  
end
