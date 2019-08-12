# frozen_string_literal: true

module ChangelogBuilder
  module Outputs
    class Json
      def dump(commits)
        hash_array = commits.map do |commit|
          commit_to_hash(commit)
        end

        Oj.dump(hash_array)
      end

      private

      def commit_to_hash(commit)
        {
          author: commit.author,
          comment: commit.comment,
          tag: commit.tag,
          hash: commit.hash,
          created_at: commit.created_at
        }
      end
    end
  end
end
