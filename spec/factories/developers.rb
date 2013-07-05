FactoryGirl.define do
  factory :developer do
    email 'dummyemail@dummy.com'
    name 'Dummy user'
    password '12345678'
    admin false
  end
end
