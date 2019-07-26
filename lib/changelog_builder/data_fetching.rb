# frozen_string_literal: true

require_relative 'data_fetching/commit'
require_relative 'data_fetching/git_log'
require_relative 'data_fetching/log_parser'

module ChangelogBuilder
  module DataFetching
    SEP_SEQ = '<-^_^->'

    FIELDS = {
      'commit_hash' => '%h',
      'commit_description' => '%s',
      'author' => '%an',
      'time' => '%ct',
      'meta_info' => '%d'
    }.freeze

    def self.history
      commit_strings = GitLog.new.fetch_commits
      parsed_strings = LogParser.new.parse_strings(commit_strings)

      intermediate_tag = nil
      parsed_strings.map do |hash|
        hash = Hash[hash.map { |k, v| [k.to_sym, v] }]

        Commit.new(hash).tap do |commit|
          intermediate_tag = commit.tag || intermediate_tag
          commit.tag = intermediate_tag
        end
      end
    end
  end
end
