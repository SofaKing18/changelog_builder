# frozen_string_literal: true

module ChanglelogBuilder
  module DataFetching
    class LogParser
      def parse_strings(strings)
        strings.map do |string|
          parse_string(string)
        end
      end

      def parse_string(string); end
    end
  end
end
