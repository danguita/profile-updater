require "octokit"

module ProfileUpdater
  module GithubApi
    CLIENT = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end
end
