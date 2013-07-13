require "i18n"
require './lib/colorize'
include Checkmate::Colorize

module Checkmate
  def self.delete(files)
    unless files.nil?
      unless files.empty?
        files.each do |file|
          File.delete(file) 
          print_message green(I18n.t("delete.success.deleted_file", file: file))
        end
      else
        print_message yellow(I18n.t("delete.errors.no_file"))
      end
    end
  end

  private

  def self.print_message(message)
    puts message
  end
end