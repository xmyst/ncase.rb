# frozen_string_literal: true

require "rake/clean"
require "rake/testtask"
require "yard"

task default: %w[test yard]

Rake::TestTask.new do |test|
  test.libs << "test"
  test.pattern = "test/**/*_test.rb"
end

YARD::Rake::YardocTask.new do |yard|
  yard.options << "--fail-on-warning"
  yard.options << "--markup" << "markdown"
  yard.options << "--no-progress" if ENV["CI"]
end
