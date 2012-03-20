# coding: UTF-8

# BEHAVIOR
class Model
  module Behavior

    def self.included(base)
      base.__send__ :include ,InstanceMethods
    end

    module InstanceMethods
    end

  end
end
