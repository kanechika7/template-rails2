# coding: UTF-8
Factory.define :member do |f|
  f.sequence(:login){|n| "member#{n}" }
  f.sequence(:me){|n| "member#{n}" }
  f.sequence(:email){|n| "member#{n}@galileoscope.com" }
  f.password "abcd1234"
  f.password_confirmation "abcd1234"
  f.role_id 2
  f.unit{ Factory(:unit) }
end
