# coding: UTF-8

# FEATURE
class Model
  module Feature

    def self.included(base)
      base.__send__ :include ,InstanceMethods
    end

    module InstanceMethods
    end

  end
end
