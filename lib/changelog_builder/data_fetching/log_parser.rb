# frozen_string_literal: true

module ChangelogBuilder
  module DataFetching
    class LogParser
      def parse_strings(strings)
        strings.map do |string|
          parse_string(string)
        end
      end

      def parse_string(string)
        string.split(DataFetching::SEP_SEQ).map do |group|
          group.split(':', 2)
        end.to_h
      end
    end
  end
end
