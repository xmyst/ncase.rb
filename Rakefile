# frozen_string_literal: true

require "rake/testtask"

task default: %w[test]

Rake::TestTask.new do |test|
  test.libs << "test"
  test.pattern = "test/**/*_test.rb"
  test.warning = false
end
