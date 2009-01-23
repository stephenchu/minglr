require 'activesupport'
require 'activeresource'

class MingleResource < ActiveResource::Base
  def self.configure(uri_options)
    self.site = "http://#{uri_options[:username]}:#{uri_options[:password]}@#{uri_options[:host_and_port]}/projects/#{uri_options[:project]}"
  end
end


class TransitionExecution < MingleResource
end

class Card < MingleResource
end

