# frozen_string_literal: true

require "rake/clean"
require "rake/testtask"
require "rubocop/rake_task"
require "rubygems"
require "rubygems/package_task"
require "yard"

task default: %w[rubocop test yard]

spec = Gem::Specification.load("ncase.gemspec")
Gem::PackageTask.new(spec) do |pkg|
  pkg.need_tar_xz = true
  pkg.need_zip = true
end

RuboCop::RakeTask.new

Rake::TestTask.new do |test|
  test.libs << "test"
  test.pattern = "test/**/*_test.rb"
end

YARD::Rake::YardocTask.new do |yard|
  yard.options << "--fail-on-warning"
  yard.options << "--no-progress" if ENV["CI"]
end
