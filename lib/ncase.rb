# frozen_string_literal: true

require_relative "ncase/version"
require_relative "ncase/words"

# Contains convenience methods for one-off use.
module Ncase
  private

  # Delegate +<name>+ to +Words#<name>_case+ if it's defined.
  def method_missing(name, *args)
    words_name = "#{name}_case".to_sym
    if Words.respond_to?(words_name)
      Words.new(*args).public_send(words_name)
    else
      super
    end
  end

  def respond_to_missing?(name, *)
    Words.respond_to?("#{name}_case") || super
  end
end
