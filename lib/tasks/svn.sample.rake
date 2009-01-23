namespace :svn do
  desc "Updates your local WC"
  task :up do
    `svn up`
  end
  
  task :add do
    `svn st | grep '^?' | xargs svn add`
  end
  
  task :rm do
    `svn st | grep '^!' | xargs svn rm`
  end
  
  desc "Check-in your local changes"
  task :ci do
    `svn ci -m "#{@comment}"`
  end
  
  desc "Checks if your WC has merge conflicts."
  task :conflict_check do
    `svn st | awk '{ if( $1 == "C" ) exit 1}'`
    raise 'You have conflicts!' unless $?.success?
  end
end