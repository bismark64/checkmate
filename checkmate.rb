# loader script
require "./loader"

root = "/media/bismark/3E64B77764B7310F/.share/"
query = ARGV.first

s = Checkmate::Search.new(root)
s.search(query)