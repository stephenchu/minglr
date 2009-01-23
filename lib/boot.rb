MINGLR_DIR = File.expand_path(File.dirname(__FILE__) + '/..')
$LOAD_PATH << MINGLR_DIR + "/lib"

Dir[MINGLR_DIR + "/vendor/*"].each do |lib_dir|
  $LOAD_PATH << lib_dir + "/lib"
end

Dir[MINGLR_DIR + "/lib/*rb"].each do |rb|
  require rb unless rb =~ /boot.rb/
end