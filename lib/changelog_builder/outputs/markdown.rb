# frozen_string_literal: true

module ChangelogBuilder
  module Outputs
    class Markdown
      def dump(commits)
        grouped_by_tag = commits.group_by(&:tag)

        [].tap do |rows|
          grouped_by_tag.map do |tag, array_of_commits|
            rows << "## #{tag}"
            rows << array_of_commits.map(&:comment).join("\n\n")
          end
        end.flatten.join("\n\n")
      end
    end
  end
end
