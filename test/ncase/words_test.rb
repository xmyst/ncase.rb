# frozen_string_literal: true

require "minitest/autorun"
require "ncase"

module Ncase
  class WordsTest < Minitest::Test
    TEST_STRING = "this is a test string"

    def test_guess_separator
      {
        "this is-a test_string" => "This Is-a Test_string",
        "this-is-a-test_string" => "This Is A Test_string",
        "this_is-a_test-string" => "This_is A_test String",
        "this_is_a_test-string" => "This Is A Test-string",
        "ThisIsATestString"     => "This Is A Test String"
      }.each do |s, t|
        assert_equal t, Words.new(s).title_case
      end
    end

    def test_guess_separator_string
      s = "this is a test string"
      t = "His is a Es sRing"
      assert_equal t, Words.new(s, separator: "t").camel_case
    end

    def test_guess_separator_regex
      s = "this is a test string"
      t = "HS S a Es sRNg"
      assert_equal t, Words.new(s, separator: /t|i/).camel_case
    end

    def test_non_random_cases
      w = Words.new(TEST_STRING)
      {
        camel_case:       "thisIsATestString",
        pascal_case:      "ThisIsATestString",
        kebab_case:       "this-is-a-test-string",
        upper_kebab_case: "THIS-IS-A-TEST-STRING",
        lower_case:       "this is a test string",
        upper_case:       "THIS IS A TEST STRING",
        snake_case:       "this_is_a_test_string",
        upper_snake_case: "THIS_IS_A_TEST_STRING",
        title_case:       "This Is A Test String",
        inver_title_case: "tHIS iS a tEST sTRING"
      }.each do |m, s|
        assert_equal s, (w.__send__ m)
      end
    end

    def test_random_case
      w = Words.new(TEST_STRING)
      r1 = w.random_case
      r2 = w.random_case

      assert TEST_STRING.casecmp?(r1)
      assert TEST_STRING.casecmp?(r2)
      assert r1.casecmp?(r2)
      refute r1 == r2
    end
  end
end
