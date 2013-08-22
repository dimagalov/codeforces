require 'optparse'
require 'codeforces/cli/flags'
require 'codeforces/contest'

module Codeforces
  class CLI
    include Flags

    def initialize(args = ARGV)
      @args = args.empty? ? %w[--help] : args
      @opts = {}

      OptionParser.new do |parser|
        @parser = parser
        Flags.instance_methods.each do |method|
          send method
        end
      end
    end

    def run!
      @parser.parse!(@args)
      Contest.new(@opts).run!
    end
  end
end
