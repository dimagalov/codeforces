require 'codeforces/scraper'
require 'codeforces/template'

module Codeforces
  class Contest
    def initialize(opts)
      opts.each do |k, v|
        instance_variable_set("@#{k}", v)
      end

      throw ArgumentError unless @id
    end

    def run!
      Template.generate! Scraper.scrape @id
    end
  end
end
