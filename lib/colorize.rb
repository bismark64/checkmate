module Checkmate
  module Colorize
    def green(text)
      colorize(text, "\e[32m")
    end  

    def yellow(text)
      colorize(text, "\e[33m")
    end

    def red(text)
      colorize(text, "\e[31m")
    end

    private

    def colorize(text, color_code)
      "#{color_code}#{text}\e[0m"
    end
  end
end