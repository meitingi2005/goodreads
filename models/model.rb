# key: apl03Pv1Wh1qnhUF6iuwQ
# secret: m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY
require 'goodreads'
require 'pp'
client = Goodreads::Client.new(api_key: "apl03Pv1Wh1qnhUF6iuwQ", api_secret: "m7bx1HSNHdMD36wUP7jhIyucmgt1gGpAnQJGkh7erY")

#puts displays string with quotes, pp does not
puts client.book_by_title("The Great Gatsby").authors.author.name
puts client.book_by_title("The Great Gatsby").description # use regex to rid of tags
