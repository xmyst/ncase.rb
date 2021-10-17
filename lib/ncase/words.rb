# frozen_string_literal: true

module Ncase
  # Implements efficient conversion of a string into a multitude of case
  # styles.
  #
  # By default will guess the separator in the string:
  #
  # 1. If the string contains spaces '+\x20+', any sequence of whitespace is a
  #    separator.
  # 2. If the string contains hyphens '+-+' or underscores '+_+', whichever is
  #    more frequent is a separator.
  # 3. A case-switch is a separator.
  #
  # @example Convert a string into +PascalCase+
  #   require "ncase"
  #
  #   w = Ncase::Words.new("this is a test string")
  #   p w.pascal_case  # => "ThisIsATestString"
  class Words
    # @param str [String] the string to convert
    # @param separator [Regexp] the pattern to split the string into words.
    #   If +nil+, it will guess the separator as described in {Words}.
    # @see String#split
    def initialize(str, separator: nil)
      sstr = str.strip
      separator ||= guess_separator(sstr)
      @words = sstr.split(separator)
    end

    # @return [String] the +camelCase+ representation of the string
    def camel_case
      return "" if @words.empty?

      @words.each(&:capitalize!)
      @words.first.downcase!
      @words.join
    end

    # @return [String] the +PascalCase+ representation of the string
    def pascal_case
      @words.each(&:capitalize!).join
    end

    # @return [String] the +kebab-case+ representation of the string
    def kebab_case
      @words.each(&:downcase!).join("-")
    end

    # @return [String] the +KEBAB-CASE+ representation of the string
    def upper_kebab_case
      @words.each(&:upcase!).join("-")
    end

    # @return [String] the +lower case+ representation of the string
    def lower_case
      @words.each(&:downcase!).join(" ")
    end

    # @return [String] the +UPPER CASE+ representation of the string
    def upper_case
      @words.each(&:upcase!).join(" ")
    end

    # @return [String] the +snake_case+ representation of the string
    def snake_case
      @words.each(&:downcase!).join("_")
    end

    # @return [String] the +SNAKE_CASE+ representation of the string
    def upper_snake_case
      @words.each(&:upcase!).join("_")
    end

    # @return [String] the +Title Case+ representation of the string
    def title_case
      @words.each(&:capitalize!).join(" ")
    end

    # @return [String] the +tITLE cASE+ representation of the string
    def inver_title_case
      @words.each(&:capitalize!).each(&:swapcase!).join(" ")
    end

    # @return [String] a +rAnDOm CaSe+ representation of the string
    def random_case
      @words.join(" ")
            .chars
            .each { |c| rand(2).zero? ? c.downcase! : c.upcase! }
            .join
    end

    SPACE_SEP_REGEXP      = /\s+/.freeze
    HYPHEN_SEP_REGEXP     = /-/.freeze
    UNDERSCORE_SEP_REGEXP = /_/.freeze
    CASE_SEP_REGEXP       = / (?<=[[:lower:]]) (?=[[:upper:]])              # z|A
                            | (?<=[[:upper:]]) (?=[[:upper:]] [[:lower:]])  # A|Bc
                            /x.freeze
    private_constant :SPACE_SEP_REGEXP, :HYPHEN_SEP_REGEXP, :UNDERSCORE_SEP_REGEXP, :CASE_SEP_REGEXP

    private

    # @param str [String] the string to guess the separator
    # @return [Regexp] the most likely separator for the string
    def guess_separator(str)
      return SPACE_SEP_REGEXP if str.include?(" ")

      num_both = str.count("-_")
      if num_both.positive?
        return HYPHEN_SEP_REGEXP if str.count("-") * 2 >= num_both

        return UNDERSCORE_SEP_REGEXP
      end
      CASE_SEP_REGEXP
    end
  end
end
