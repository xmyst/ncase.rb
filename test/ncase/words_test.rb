# frozen_string_literal: true

require "minitest/autorun"
require "ncase"

module Ncase
  class WordsTest < Minitest::Test
    TEST_STRING = "this is a test string"

    def test_guess
      {
        "this is-a test_string" => Words::SPACE_SEP_REGEXP,
        "this-is-a-test_string" => Words::DASH_SEP_REGEXP,
        "this_is-a_test-string" => Words::DASH_SEP_REGEXP,
        "this_is_a_test-string" => Words::UNDERSCORE_SEP_REGEXP,
        "ThisIsATestString"     => Words::CASE_SEP_REGEXP,
        ""                      => Words::CASE_SEP_REGEXP,
      }.each do |s, sep|
        assert_equal sep, Words.guess_sep(s)
      end
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
        inver_title_case: "tHIS iS a tEST sTRING",
      }.each do |m, s|
        assert_equal s, (w.send m)
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
