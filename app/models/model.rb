# coding: UTF-8

class Model < ActiveRecord::Base

  # includes
  include Model::Structure
  include Model::Validation
  include Model::Feature
  include Model::Behavior
  include Model::Klass
  include Model::CallBack
  include Model::Skope
  include Model::Origin
  include Model::Vendor


end

