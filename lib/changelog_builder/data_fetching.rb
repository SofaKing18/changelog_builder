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
  end
end
