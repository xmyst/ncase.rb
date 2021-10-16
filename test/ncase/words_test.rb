# frozen_string_literal: true

require "minitest/autorun"
require "ncase"

module Ncase
  class WordsTest < Minitest::Test
    parallelize_me!

    def test_new_no_separator_guess_space
      str = "this is-a_testString"
      act = Words.new(str).title_case
      assert_equal "This Is-a_teststring", act
    end

    def test_new_no_separator_guess_hyphen
      str = "this-is-a-test_string"
      act = Words.new(str).title_case
      assert_equal "This Is A Test_string", act
    end

    def test_new_no_separator_guess_hyphen_over_underscore
      str = "this_is-a_test-string"
      act = Words.new(str).title_case
      assert_equal "This_is A_test String", act
    end

    def test_new_no_separator_guess_underscore
      str = "this-is_a_test_string"
      act = Words.new(str).title_case
      assert_equal "This-is A Test String", act
    end

    def test_new_no_separator_guess_case
      str = "ThisIsATestString"
      act = Words.new(str).title_case
      assert_equal "This Is A Test String", act
    end

    TEST_STRING = "this is a test string"

    def test_new_separator_string
      sep = "is"
      act = Words.new(TEST_STRING, separator: sep).snake_case
      assert_equal "th_ _ a test string", act
    end

    def test_new_separator_regexp
      sep = /is?/
      act = Words.new(TEST_STRING, separator: sep).snake_case
      assert_equal "th_ _ a test str_ng", act
    end

    def test_camel_case
      w = Words.new(TEST_STRING)
      act = w.camel_case
      assert_equal "thisIsATestString", act
    end

    def test_pascal_case
      w = Words.new(TEST_STRING)
      act = w.pascal_case
      assert_equal "ThisIsATestString", act
    end

    def test_kebab_case
      w = Words.new(TEST_STRING)
      act = w.kebab_case
      assert_equal "this-is-a-test-string", act
    end

    def test_upper_kebab_case
      w = Words.new(TEST_STRING)
      act = w.upper_kebab_case
      assert_equal "THIS-IS-A-TEST-STRING", act
    end

    def test_lower_case
      w = Words.new(TEST_STRING)
      act = w.lower_case
      assert_equal "this is a test string", act
    end

    def test_upper_case
      w = Words.new(TEST_STRING)
      act = w.upper_case
      assert_equal "THIS IS A TEST STRING", act
    end

    def test_snake_case
      w = Words.new(TEST_STRING)
      act = w.snake_case
      assert_equal "this_is_a_test_string", act
    end

    def test_upper_snake_case
      w = Words.new(TEST_STRING)
      act = w.upper_snake_case
      assert_equal "THIS_IS_A_TEST_STRING", act
    end

    def test_title_case
      w = Words.new(TEST_STRING)
      act = w.title_case
      assert_equal "This Is A Test String", act
    end

    def test_inver_title_case
      w = Words.new(TEST_STRING)
      act = w.inver_title_case
      assert_equal "tHIS iS a tEST sTRING", act
    end

    def test_random_case
      w = Words.new(TEST_STRING)

      act1 = w.random_case
      act2 = w.random_case

      assert act1.casecmp?(act2)
      refute_equal act1, act2
    end
  end
end
