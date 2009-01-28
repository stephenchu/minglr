Gem::Specification.new do |s|
  s.name     = "minglr"
  s.version  = "0.1.0"
  s.date     = "2009-01-20"
  s.summary  = "Consists of Rake task helpers and a command line utility to help transitioning story cards on Mingle through the Mingle API. Plugs right into your routine \"test > code > check-in > move card\" build process."
  s.email    = "github@stephenchu.com"
  s.homepage = "http://github.com/stephenchu/minglr/tree/master"
  s.description = "Do you forget to update a story card on Mingle when the card has moved into developers' hands? How about forgetting to update the story card to kick-off its sign off process when story is completed? If we let these sloppiness happen too often, communication flow will be hindered, and the time it takes to provide business value through story completions will be lengthened. Fortunately, Minglr can help."
  s.has_rdoc = false
  s.authors  = ["Stephen Chu", "Chris O'Meara"]
  s.files    = ["bin/mtx", "History.txt", "lib/minglr/card.rb", "lib/minglr/input_cache.rb", "lib/minglr/mingle_resource.rb", "lib/minglr/minglr_options_parser.rb", "lib/minglr/transition_execution.rb", "lib/minglr.rb", "Manifest.txt", "minglr.gemspec", "PostInstall.txt", "Rakefile", "README.rdoc", "tasks/commit.sample.rake", "tasks/svn.sample.rake"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
end