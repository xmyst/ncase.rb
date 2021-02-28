# frozen_string_literal: true

require_relative "lib/ncase/version"

Gem::Specification.new do |spec|
  spec.name = "ncase"
  spec.version = Ncase::VERSION
  spec.authors = ["Stas Miasnikoŭ"]
  spec.email = ["miasnikou@yandex.by"]
  spec.license = "ISC"
  spec.summary = "Enforce a case style."
  spec.homepage = "https://github.com/xmyst/ncase"
  spec.metadata = {
    "source_code_uri" => "https://github.com/xmyst/ncase",
  }
  spec.executables = ["ncase"]
  spec.files = Dir["lib/**/*"]
end
