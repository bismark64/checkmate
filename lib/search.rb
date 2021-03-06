require 'find'
require 'i18n'
require './lib/colorize'
require './lib/progressbar'
include Checkmate::Colorize
include Checkmate::Progressbar

module Checkmate
  class Search
    def initialize(root_path)
      @root_path ||= root_path
    end

    def perform_search(query)
      found_files = search(query)
      generate_message(found_files, query)
    end

    def search(query)
      begin
        find_files(query)
      rescue Errno::ENOENT
        puts red(I18n.t("search.errors.invalid_path"))
      end
    end

    private

    def find_files(query)
      pb = new_progressbar
      results = []
      Find.find(@root_path) do |path|
        unless FileTest.directory?(path)
          file = File.basename(path)
          results << path if file.include?(query)
          pb.progress += estimated_progress_rate(@root_path)
          pb.refresh
        end
      end
      pb.finish
      results
    end

    def generate_message(found_files, query)
      unless found_files.nil?
        if found_files.empty?
          message = yellow I18n.t("search.errors.not_found", query: query)
        else
          message = green(found_files.size)
          message << green(I18n.t("search.success.files_found", query: query))
          message << found_files.join("\n")
        end
        system("clear")
        puts message
      end
    end

  end

end