require_relative "request"

ProfileUpdater::GithubApi::Request.new(bio: ARGV[0]).call
