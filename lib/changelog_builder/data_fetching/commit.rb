# frozen_string_literal: true

module ChangelogBuilder
  module DataFetching
    class Commit
      TAG_FROM_COMMIT_META_REG = Regexp.new(/tag: ((?<Tag>.*?)[,)])/)

      attr_reader :author, :comment, :meta, :hash, :created_at
      attr_accessor :tag

      def initialize(author: nil, commit_description: nil, commit_hash: nil, meta_info: nil, time: nil)
        @author = author
        @comment = commit_description
        @meta = meta_info
        @tag = parse_meta_and_set_tag(meta_info)
        @hash = commit_hash
        @created_at = time
      end

      private

      def parse_meta_and_set_tag(meta)
        match_result = meta.match(TAG_FROM_COMMIT_META_REG)
        @tag = match_result.named_captures['Tag'] if match_result
      end
    end
  end
end
