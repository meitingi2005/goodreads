# key: apl03Pv1Wh1qnhUF6iuwQ
# secret: m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY
require 'goodreads' 
require 'pp'
client = Goodreads::Client.new(api_key: "apl03Pv1Wh1qnhUF6iuwQ", api_secret: "m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY")
# pp client.book_by_title("The Great Gatsby").authors.author.name
# pp client.book_by_title("The Great Gatsby").description
# pp client.book_by_title("The Great Gatsby").popular_shelves.shelf[3]
author = client.author("3190")
puts author.about