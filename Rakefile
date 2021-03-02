# frozen_string_literal: true

require "rake/clean"
require "rake/testtask"
require "rubygems"
require "rubygems/package_task"
require "yard"

task default: %w[test yard]

spec = Gem::Specification.load("ncase.gemspec")
Gem::PackageTask.new(spec) do |pkg|
  pkg.need_tar_xz = true
  pkg.need_zip = true
end

Rake::TestTask.new do |test|
  test.libs << "test"
  test.pattern = "test/**/*_test.rb"
end

YARD::Rake::YardocTask.new do |yard|
  yard.options << "--fail-on-warning"
  yard.options << "--no-progress" if ENV["CI"]
end
