# loader script
require "./loader"

def search(root_path, query)
  Checkmate::Search.new(root_path).perform_search(query)
end

def delete(root_path, query)
  found_files = Checkmate::Search.new(root_path).search(query)
  Checkmate.delete(found_files)
end

def create
  File.new("remove.txt", "w")
  File.new("removeit.txt", "w")
  File.new("removeme.txt", "w")
  File.new("removemetoo.txt", "w")
end