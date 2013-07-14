require 'ruby-progressbar'

module Checkmate
  module Progressbar
    def new_progressbar
      ProgressBar.create(:format => '%a |%b>>%i| %p%% %t %e')
    end

    def estimated_progress_rate(path)
      FileTest.size(path)*0.000000014
    end
  end
end
