Gem::Specification.new do |s|
  s.name = 'codeforces'
  s.version = '0.1.0'
  s.license = 'WTFPL'
  s.summary = 'Codeforces automation suite'
  s.authors = ['Dima Galov']
  s.email = 'dimagalov@gmail.com'
  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
end
