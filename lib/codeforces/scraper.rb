require 'open-uri'
require 'rubygems'
require 'nokogiri'

module Codeforces
  module Scraper
    extend self

    # @example
    #   Scraper.scrape(321)
    #   # {'A' => {
    #   #   :name => 'A. Ciel and Robot',
    #   #   :input => ["2 2\nRU\n", ...],
    #   #   :output => ["Yes\n", ...]
    #   # }, ...}
    def scrape(id)
      problems = {}

      ('A'..'Z').each do |letter|
        problem = Nokogiri::HTML URI.open("http://codeforces.ru/contest/#{id}/problem/#{letter}?locale=en")
        input, output = [], []

        problem.css('.sample-test').each do |test|
          input  << pre(test.at '.input pre')
          output << pre(test.at '.output pre')
        end

        break if input.empty? or output.empty?

        problems.merge! letter => {
          :name => problem.at('.header .title').text,
          :input => input,
          :output => output
        }
      end

      problems
    end

    private

    # Converts a <pre>...</pre> node into a string
    # 
    # @param node [Node] Nokogiri::HTML node
    # @return [String] processed text including newlines
    def pre(node)
      node.to_html.gsub(/<.+?>(.+)<\/.+?>/) { $1.gsub(/<br\/?>/, "\n") }
    end
  end
end
