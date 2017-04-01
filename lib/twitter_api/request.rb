require_relative "client"

module ProfileUpdater
  module TwitterApi
    class EmptyBioError < StandardError; end
    class Request
      attr_reader :bio

      def initialize(bio:)
        @bio = bio.to_s.strip.force_encoding(Encoding::UTF_8).freeze
      end

      def call
        raise EmptyBioError, "Bio can't be empty" if bio.empty?

        CLIENT.update_profile(description: bio)
      end
    end
  end
end
