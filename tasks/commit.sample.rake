require 'minglr'

desc "Run this if you have new code to check in"
task :check_in => %w( minglr:dev_complete:prepare
                      svn:add
                      svn:rm
                      svn:up
                      svn:conflict_check
                      db:migrate
                      test
                      svn:ci  
                      minglr:dev_complete:transition )  

namespace :minglr do  
  task :prepare do
    @host_port  = 'mingle-host:8080' # REPLACE WITH YOUR MINGLE HOST AND PORT
    @project    = 'project_4808'   # REPLACE WITH YOUR MINGLE PROJECT IDENTIFIER
  end
  
  namespace :dev_complete do
    desc "Gather inputs to execute a 'Development Complete' card transition."
    task :prepare => 'minglr:prepare' do
      @transition     = 'Transition Uno' # REPLACE WITH THE TRANSITION YOU WANT TO EXECUTE
      @username       = prompt 'Please enter your Mingle username', :cache_key => 'username'
      @password       = prompt 'Please enter your Mingle password', :secure => true
      @card           = prompt 'Please enter a Mingle card number', :cache_key => 'card'
      @commit_message = prompt 'Please enter a commit message', :cache_key => 'commit_message'
      @comment        = prompt 'Please enter a comment for the transition', :cache_key => 'transition_comment'
      @properties     = ['Actual Effort', 'Property Dos'].inject([]) do |memo, property_name|
        memo << [ %Q|"#{escape(property_name)}"|,
                  %Q|"#{prompt(%Q{Please enter the value for the property "#{property_name}"}, :cache_key => property_name)}"|]
        memo
      end.flatten.join(',')
      @story_complete = prompt('Is the story complete? (y/N)', :cache_key => 'story_complete').to_s.downcase == 'y'
    end

    desc "Executes a 'Development Complete' card transition."
    task :transition => 'minglr:dev_complete:prepare' do
      if @story_complete
        cmd = %Q|#{Minglr::ROOT}/bin/mtx --username "#{@username}" --password "#{@password}" --card "#{@card}" --comment "#{@comment}" --transition "#{@transition}" --properties #{@properties} --host_port "#{@host_port}" --project "#{@project}"|
        `#{cmd}`
        raise "Minglr transition failed with exit status #{$?}." unless $?.success?
      end
    end
  end
  
  private
  
  def prompt(message, options = { :secure => false })
    require 'rubygems'
    begin
      require 'password' rescue Exception 
    rescue Exception
       @clear_text_password = true
    end
    
    user_input = if options[:secure]
        if @clear_text_password
          puts "NOTE: You do not have the 'rb-password' port installed. Perform 'sudo port install rb-password' to avoid your password shown in clear text as you type below."
          print "#{message}: "
          $stdin.gets.chop
        else
          Password.get "#{message}: "
        end
      else
        print "#{message}"
        if cache = InputCache.get(options[:cache_key])
          print " [#{cache}]"
        end
        print ": "
        $stdin.gets.chop
      end

    if !options[:secure] && cache_key = options.delete(:cache_key)
      user_input = InputCache.get(cache_key) if user_input.blank?
      InputCache.put(cache_key, user_input)
    end
    
    user_input = escape(user_input)
  end
  
  def escape(user_input)
    user_input.gsub(/["]/, %q{\"}) if user_input
  end
  
end