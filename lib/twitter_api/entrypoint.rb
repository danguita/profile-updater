require_relative "request"

ProfileUpdater::TwitterApi::Request.new(bio: ARGV[0]).call
