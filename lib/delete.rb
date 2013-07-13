require "i18n"
require './lib/colorize'
include Checkmate::Colorize

module Checkmate
  def self.delete(files)
    unless files.nil?
      unless files.empty?
        files.each do |file|
          delete_file(file)
        end
      else
        print_message yellow(I18n.t("delete.errors.no_file"))
      end
    end
  end

  private

  def self.delete_file
    begin
      File.delete(file) 
      print_message green(I18n.t("delete.success.deleted_file", file: file))
    rescue Errno::EACCES
      print_message red(I18n.t("delete.errors.permission_denied"))
    end
  end

  def self.print_message(message)
    puts message
  end
end