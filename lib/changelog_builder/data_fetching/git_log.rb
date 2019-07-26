# frozen_string_literal: true

module ChangelogBuilder
  module DataFetching
    class GitLog
      def fetch_commits
        `git log --pretty="%h %d %s" --decorate=full`.split("\n") || []
      end
    end
  end
end
