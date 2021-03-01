# frozen_string_literal: true

module Ncase
  # @example Convert a string to `PascalCase`
  #   require "ncase"
  #
  #   w = Ncase::Words.new("this is a test string")
  #   puts w.pascal_case  # => "ThisIsATestString"
  class Words
    def initialize(s)
      ss = s.strip
      @words = ss.split(Words.guess_sep(ss))
    end

    # @return [String] the `camelCase` representation of the string
    def camel_case
      first_word = @words.first
      if first_word
        @words.drop(1)
          .map {|s| s.capitalize}
          .unshift(first_word.downcase)
          .join
      else
        ""
      end
    end

    # @return [String] the `PascalCase` representation of the string
    def pascal_case
      @words.map {|s| s.capitalize}.join
    end

    # @return [String] the `kebab-case` representation of the string
    def kebab_case
      @words.map {|s| s.downcase}.join("-")
    end

    # @return [String] the `KEBAB-CASE` representation of the string
    def upper_kebab_case
      @words.map {|s| s.upcase}.join("-")
    end

    # @return [String] the `lower case` representation of the string
    def lower_case
      @words.map {|s| s.downcase}.join(" ")
    end

    # @return [String] the `UPPER CASE` representation of the string
    def upper_case
      @words.map {|s| s.upcase}.join(" ")
    end

    # @return [String] the `snake_case` representation of the string
    def snake_case
      @words.map {|s| s.downcase}.join("_")
    end

    # @return [String] the `SNAKE_CASE` representation of the string
    def upper_snake_case
      @words.map {|s| s.upcase}.join("_")
    end

    # @return [String] the `Title Case` representation of the string
    def title_case
      @words.map {|s| s.capitalize}.join(" ")
    end

    # @return [String] the `tITLE cASE` representation of the string
    def inver_title_case
      title_case.swapcase
    end

    # @return [String] a `rAnDOm CaSe` representation of the string
    def random_case
      @words.join(" ")
        .chars
        .map {|c| if rand(2) == 0 then c.downcase else c.upcase end}
        .join
    end

    private

    SPACE_SEP_REGEXP      = /\s+/
    HYPHEN_SEP_REGEXP     = /-/
    UNDERSCORE_SEP_REGEXP = /_/
    CASE_SEP_REGEXP       = /(?<=[[:lower:]]) (?=[[:upper:]]) | (?<=[[:upper:]]) (?=[[:upper:]] [[:lower:]])/x

    # @return [Regexp] the most likely separator for the string
    def self.guess_sep(s)
      if s.scan(SPACE_SEP_REGEXP).count > 0
        SPACE_SEP_REGEXP
      else
        num_both = s.count("-_")
        if num_both > 0
          num_hyphens = s.count("-")
          if num_hyphens * 2 >= num_both
            HYPHEN_SEP_REGEXP
          else
            UNDERSCORE_SEP_REGEXP
          end
        else
          CASE_SEP_REGEXP
        end
      end
    end
  end
end
