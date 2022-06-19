# frozen_string_literal: true

require_relative "lib/ncase/version"

Gem::Specification.new do |spec|
  spec.name = "ncase"
  spec.version = Ncase::VERSION
  spec.authors = ["Stanislau Miasnikou"]
  spec.email = ["miasnikou@yandex.by"]
  spec.license = "ISC"
  spec.summary = "Enforce a case style."
  spec.homepage = "https://github.com/xmyst/ncase.rb"
  spec.metadata = {
    "source_code_uri" => "https://github.com/xmyst/ncase.rb"
  }
  spec.executables = ["ncase"]
  spec.files = Dir["lib/**/*"]

  spec.required_ruby_version = ">= 2.6"

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-minitest"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "yard"
end
