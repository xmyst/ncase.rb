# frozen_string_literal: true

require_relative "ncase/version"
require_relative "ncase/words"

# Contains convenience methods for one-off use.
module Ncase
  module_function

  # Delegate +<name>+ to +Words#<name>_case+ if it's defined.
  def method_missing(name, *args)
    if (method = Words.public_instance_method("#{name}_case"))
      method.bind(Words.new(*args)).call
    else
      super
    end
  end

  def respond_to_missing?(name, *)
    Words.public_instance_method("#{name}_case") || super
  end
end
