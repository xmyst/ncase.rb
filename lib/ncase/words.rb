# frozen_string_literal: true

# Support library for +bin/ncase+.
module Ncase
  # Implements efficient conversion of a string into a multitude of case
  # styles.
  #
  # Guesses the separator in the string:
  #
  # 1. If the string contains spaces '+\x20+', any sequence of whitespace is a
  #    separator.
  # 2. If the string contains hyphens '+-+' or underscores '+_+', whichever of
  #    them is more frequent is a separator.
  # 3. A case-switch is a separator.
  #
  # @example Convert a string into +PascalCase+
  #   require "ncase"
  #
  #   w = Ncase::Words.new("this is a test string")
  #   p w.pascal_case  # => "ThisIsATestString"
  class Words
    # @param s [String] a string to prepare for conversion
    def initialize(s)
      ss = s.strip
      sep = guess_separator(ss)
      @words = ss.split(sep)
    end

    # @return [String] the +camelCase+ representation of the string
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

    # @return [String] the +PascalCase+ representation of the string
    def pascal_case
      @words.map {|s| s.capitalize}.join
    end

    # @return [String] the +kebab-case+ representation of the string
    def kebab_case
      @words.map {|s| s.downcase}.join("-")
    end

    # @return [String] the +KEBAB-CASE+ representation of the string
    def upper_kebab_case
      @words.map {|s| s.upcase}.join("-")
    end

    # @return [String] the +lower case+ representation of the string
    def lower_case
      @words.map {|s| s.downcase}.join(" ")
    end

    # @return [String] the +UPPER CASE+ representation of the string
    def upper_case
      @words.map {|s| s.upcase}.join(" ")
    end

    # @return [String] the +snake_case+ representation of the string
    def snake_case
      @words.map {|s| s.downcase}.join("_")
    end

    # @return [String] the +SNAKE_CASE+ representation of the string
    def upper_snake_case
      @words.map {|s| s.upcase}.join("_")
    end

    # @return [String] the +Title Case+ representation of the string
    def title_case
      @words.map {|s| s.capitalize}.join(" ")
    end

    # @return [String] the +tITLE cASE+ representation of the string
    def inver_title_case
      title_case.swapcase
    end

    # @return [String] a +rAnDOm CaSe+ representation of the string
    def random_case
      @words.join(" ")
        .chars
        .map {|c| if rand(2) == 0 then c.downcase else c.upcase end}
        .join
    end

    SPACE_SEP_REGEXP      = /\s+/
    HYPHEN_SEP_REGEXP     = /-/
    UNDERSCORE_SEP_REGEXP = /_/
    CASE_SEP_REGEXP       = /(?<=[[:lower:]]) (?=[[:upper:]]) | (?<=[[:upper:]]) (?=[[:upper:]] [[:lower:]])/x
    private_constant :SPACE_SEP_REGEXP, :HYPHEN_SEP_REGEXP, :UNDERSCORE_SEP_REGEXP, :CASE_SEP_REGEXP

    private

    # @return [Regexp] the most likely separator for the string
    def guess_separator(s)
      if s.include?(" ")
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
