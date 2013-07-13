require 'find'

module Checkmate
  class Search
    def initialize(root)
      @root = root
    end

    def search(query)
      Find.find(@root) do |path|
        unless FileTest.directory?(path)
          file = File.basename(path)
          puts file if file.include?(query)
        end
      end
    end
  end
end