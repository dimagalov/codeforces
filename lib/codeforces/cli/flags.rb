module Codeforces
  class CLI
    module Flags
      def parse_contest
        @parser.on('-c', '--contest <id>', 'Specify the contest') do |id|
          @opts[:id] = id
        end
      end

      def parse_help
        @parser.on('-h', '--help', 'Print this message') do
          abort @parser.to_s
        end
      end

      def parse_version
        @parser.on('-v', '--version', 'Print the version') do
          require 'codeforces/version'
          abort "Codeforces #{VERSION}"
        end
      end
    end
  end
end
