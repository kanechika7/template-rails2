# coding: UTF-8

# KLASS
class Model
  module Klass

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
    end

  end
end
