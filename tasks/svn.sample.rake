namespace :svn do
  desc "Updates your local WC"
  task :up do
    `svn up`
  end

  desc "Adds new local WC files"
  task :add do
    `svn st | grep '^?' | xargs svn add`
  end
  
  desc "Removes deleted local WC files"
  task :rm do
    `svn st | grep '^!' | xargs svn rm`
  end
  
  desc "Check-in your local WC changes"
  task :ci do
    `svn ci -m "#{@commit_message || ENV['commit_message']}"`
  end
  
  desc "Checks if your WC has merge conflicts."
  task :conflict_check do
    `svn st | awk '{ if( $1 == "C" ) exit 1}'`
    raise 'You have conflicts!' unless $?.success?
  end
end