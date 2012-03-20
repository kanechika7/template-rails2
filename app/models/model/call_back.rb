# coding: UTF-8

# CALLBACK
class Model
  module CallBack

    def self.included(base)
      base.__send__ :include ,InstanceMethods
    end

    module InstanceMethods
    end

  end
end
