# coding: UTF-8

# VALIDATION
class Model
  module Validation

    def self.included(base)
      base.__send__ :include ,InstanceMethods
    end

    module InstanceMethods
    end

  end
end
