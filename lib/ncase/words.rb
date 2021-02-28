# frozen_string_literal: true

module Ncase
  class Words
    SPACE_SEP_REGEXP      = /\s+/
    DASH_SEP_REGEXP       = /-/
    UNDERSCORE_SEP_REGEXP = /_/
    CASE_SEP_REGEXP       = /(?<=[[:lower:]])(?=[[:upper:]])/

    # Returns Regexp for the most likely separator in a string.
    def self.guess_sep(s)
      if s.scan(SPACE_SEP_REGEXP).count > 0
        SPACE_SEP_REGEXP
      else
        num_total = s.count("-_")
        if num_total > 0
          num_dash = s.count("-")
          if num_dash * 2 >= num_total
            # More dashes.
            DASH_SEP_REGEXP
          else
            # More underscores.
            UNDERSCORE_SEP_REGEXP
          end
        else
          CASE_SEP_REGEXP
        end
      end
    end

    def initialize(s)
      ss = s.strip
      @words = ss.split(Words.guess_sep(ss))
    end

    # Returns a camelCase string.
    def camel_case
      first_word = @words.first
      if first_word.nil?
        ""
      else
        @words.drop(1)
          .map {|s| s.capitalize}
          .unshift(first_word.downcase)
          .join
      end
    end

    # Returns a PascalCase string.
    def pascal_case
      @words.map {|s| s.capitalize}.join
    end

    # Returns a kebab-case string.
    def kebab_case
      @words.map {|s| s.downcase}.join("-")
    end

    # Returns a KEBAB-CASE string.
    def upper_kebab_case
      @words.map {|s| s.upcase}.join("-")
    end

    # Returns a `lower case` string.
    def lower_case
      @words.map {|s| s.downcase}.join(" ")
    end

    # Returns an `UPPER CASE` string.
    def upper_case
      @words.map {|s| s.upcase}.join(" ")
    end

    # Returns a snake_case string.
    def snake_case
      @words.map {|s| s.downcase}.join("_")
    end

    # Returns a SNAKE_CASE string.
    def upper_snake_case
      @words.map {|s| s.upcase}.join("_")
    end

    # Returns a `Title Case` string.
    def title_case
      @words.map {|s| s.capitalize}.join(" ")
    end

    # Returns a `tITLE cASE` string.
    def inver_title_case
      title_case.swapcase
    end

    # Returns a `rAnDOm CaSe` string
    def random_case
      @words.join(" ")
        .chars
        .map {|c| if rand(2) == 0 then c.downcase else c.upcase end}
        .join
    end
  end
end
