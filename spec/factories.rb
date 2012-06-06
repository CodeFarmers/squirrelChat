FactoryGirl.define do
  factory :user do
    sequence(:nickname)  { |n| "Person #{n}" }
  end
  
  factory :post do
    content "Just some content"
    user  
  end
end

