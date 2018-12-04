FactoryBot.define do
  factory :bill_line do
    sequence(:concept) {|n| "Concept #{n}" }
  end
end
