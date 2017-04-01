require_relative "client"

module ProfileUpdater
  module GithubApi
    class EmptyBioError < StandardError; end
    class Request
      attr_reader :bio

      def initialize(bio:)
        @bio = bio.to_s.strip.force_encoding(Encoding::UTF_8).freeze
      end

      def call
        raise EmptyBioError, "Bio can't be empty" if bio.empty?

        CLIENT.update_user(bio: bio)
      end
    end
  end
end
