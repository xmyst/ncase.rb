# frozen_string_literal: true

require "minitest/autorun"
require "ncase"

module Ncase
  class WordsTest < Minitest::Test
    parallelize_me!

    TEST_STRING = "this is a test string"

    def test_new_no_separator
      {
        "this is-a_testString"  => "This Is-a_teststring",
        "this-is-a-test_string" => "This Is A Test_string",
        "this_is-a_test-string" => "This_is A_test String",
        "this-is_a_test_string" => "This-is A Test String",
        "ThisIsATestString"     => "This Is A Test String"
      }.each do |x, y|
        assert_equal y, Words.new(x).title_case
      end
    end

    def test_new_separator_string
      {
        "is" => "th_ _ a test string",
        ""   => "t_h_i_s_ _i_s_ _a_ _t_e_s_t_ _s_t_r_i_n_g",
      }.each do |x, y|
        assert_equal y, Words.new(TEST_STRING, separator: x).snake_case
      end
    end

    def test_new_separator_regexp
      {
        /is?/ => "th_ _ a test str_ng",
        //    => "t_h_i_s_ _i_s_ _a_ _t_e_s_t_ _s_t_r_i_n_g",
      }.each do |x, y|
        assert_equal y, Words.new(TEST_STRING, separator: x).snake_case
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
        inver_title_case: "tHIS iS a tEST sTRING"
      }.each do |x, y|
        assert_equal y, w.__send__(x)
      end
    end

    def test_random_case
      w = Words.new(TEST_STRING)
      r1 = w.random_case
      r2 = w.random_case

      assert TEST_STRING.casecmp?(r1)
      assert TEST_STRING.casecmp?(r2)
      assert r1.casecmp?(r2)
      refute_equal r1, r2
    end
  end
end
