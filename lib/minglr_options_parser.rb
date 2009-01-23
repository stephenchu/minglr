require 'optparse'

class MinglrOptionsParser
  def self.parse(args, *required_by_command)
    uri_options = {}
    command_options = {}

    parser = OptionParser.new do |opts|
      opts.banner = "Usage: mtx [options]"
      opts.on("--transition TRANSITION", "Transition name.") do |transition|
        command_options[:transition] = transition
      end

      opts.on("--card CARD", "Card number.") do |card|
        command_options[:card] = card
      end

      opts.on("--properties ARGS", Array, "User-entered properties and values for the transition in array format. Must be an even number of comma-delimited values, like \"A,B,'C with spaces','D with spaces'\".") do |args|
        command_options[:properties] = args.in_groups_of(2).map { |key, value| {'name' => key, 'value' => value} }
      end
      
      opts.on("--comment COMMENT", "Transition comment. This may be required depending on your transition settings.") do |comment|
        command_options[:comment] = comment
      end

      opts.on("--username USERNAME", "Mingle username.") do |username|
        uri_options[:username] = username
      end

      opts.on("--password PASSWORD", "Mingle password.") do |password|
        uri_options[:password] = password
      end

      opts.on("--host_port HOST_PORT", "Host and port.") do |host_and_port|
        uri_options[:host_and_port] = host_and_port
      end

      opts.on("--project PROJECT", "Project name.") do |project|
        uri_options[:project] = project
      end
    end
    
    parser.parse! args

    ([:project, :host_and_port] | required_by_command).each do |arg|
      unless command_options[arg] || uri_options[arg]
        # TODO: let commands handle their own errors
        $stderr.puts "Missing command-line argument --#{arg.to_s}, use --help for command-line options."
        exit 1
      end
    end

    [uri_options, command_options]
  end
end