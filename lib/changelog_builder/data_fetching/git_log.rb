# frozen_string_literal: true

module ChangelogBuilder
  module DataFetching
    class GitLog
      class GitNotFound < StandardError; end

      def fetch_commits
        check_git_installed!

        pretty_params = DataFetching::FIELDS.map do |key, value|
          "#{key}:#{value}"
        end

        command = "git log --pretty='#{pretty_params.join(DataFetching::SEP_SEQ)}'"

        `#{command}`.split("\n") || []
      end

      private

      def check_git_installed!
        raise GitNotFound, 'Check git installation' if `which git`.empty?
      end
    end
  end
end
