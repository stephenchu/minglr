Gem::Specification.new do |s|
  s.name     = "minglr"
  s.version  = "0.1.0"
  s.date     = "2009-01-20"
  s.summary  = "Consists of Rake task helpers and a command line utility to help transitioning story cards on Mingle through the Mingle API. Plugs right into your routine \"test > code > check-in > move card\" build process."
  s.email    = "github@stephenchu.com"
  s.homepage = "http://github.com/stephenchu/minglr/tree/master"
  s.description = "Do you forget to update a story card on Mingle when the card has moved into developers' hands? How about forgetting to update the story card to kick-off its sign off process when story is completed? If we let these sloppiness happen too often, communication flow will be hindered, and the time it takes to provide business value through story completions will be lengthened. Fortunately, Minglr can help."
  s.has_rdoc = true
  s.authors  = ["Stephen Chu", "Chris O'Meara"]
  s.files    = ["History.txt", 
		"README.txt", 
		"Rakefile", 
		"grit.gemspec", 
		"lib/grit/actor.rb", 
		"lib/grit/blob.rb", 
		"lib/grit/commit.rb", 
		"lib/grit/commit_stats.rb", 
		"lib/grit/config.rb", 
		"lib/grit/diff.rb", 
		"lib/grit/errors.rb", 
		"lib/grit/git-ruby/commit_db.rb", 
		"lib/grit/git-ruby/file_index.rb", 
		"lib/grit/git-ruby/git_object.rb", 
		"lib/grit/git-ruby/internal/loose.rb", 
		"lib/grit/git-ruby/internal/mmap.rb", 
		"lib/grit/git-ruby/internal/pack.rb", 
		"lib/grit/git-ruby/internal/raw_object.rb", 
		"lib/grit/git-ruby/object.rb", 
		"lib/grit/git-ruby/repository.rb", 
		"lib/grit/git-ruby.rb", 
		"lib/grit/git.rb", 
		"lib/grit/head.rb", 
		"lib/grit/index.rb", 
		"lib/grit/lazy.rb", 
		"lib/grit/ref.rb", 
		"lib/grit/repo.rb", 
		"lib/grit/status.rb", 
		"lib/grit/submodule.rb", 
		"lib/grit/tag.rb", 
		"lib/grit/tree.rb", 
		"lib/grit.rb",
		"lib/open3_detach.rb"]
  s.test_files = ["test/test_actor.rb", 
      "test/test_blob.rb", "test/test_commit.rb", 
      "test/test_config.rb", 
      "test/test_diff.rb", 
      "test/test_git.rb", 
      "test/test_grit.rb", 
      "test/test_head.rb", 
      "test/test_real.rb", 
      "test/test_reality.rb",
      "test/test_remote.rb", 
      "test/test_repo.rb", 
      "test/test_tag.rb", 
      "test/test_tree.rb"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
end