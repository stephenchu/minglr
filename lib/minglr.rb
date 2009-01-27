require 'rubygems'
require 'activesupport'
require 'activeresource'
require 'optparse'

require File.dirname(__FILE__) + '/minglr/mingle_resource'
require File.dirname(__FILE__) + '/minglr/minglr_options_parser'
require File.dirname(__FILE__) + '/minglr/card'
require File.dirname(__FILE__) + '/minglr/transition_execution'
require File.dirname(__FILE__) + '/minglr/input_cache'

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Minglr
  VERSION = '0.1.0'
  ROOT    = File.expand_path File.join(File.dirname(__FILE__), '..')
end