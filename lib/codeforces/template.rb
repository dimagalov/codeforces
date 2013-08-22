require 'fileutils'

module Codeforces
  module Template
    extend self

    def generate!(problems)
      problems.each do |letter, problem|
        create_problem letter, problem
      end
    end

    private

    def create_problem(letter, problem)
      letter.downcase!
      create_directory letter
      change_directory letter

      create_directory 'examples'

      change_directory 'examples'
      create_examples problem[:input], problem[:output]
      change_directory '../..'
    end

    def create_examples(input, output)
      input.each_index do |i|
        create_file "#{i}.in", input[i]
        create_file "#{i}.out", output[i]
      end
    end

    def create_directory(path)
      FileUtils.mkdir path 
    end

    def change_directory(path)
      Dir.chdir path 
    end

    def create_file(path, content)
      File.write path, content
    end
  end
end
