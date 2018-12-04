FactoryBot.define do
  factory :bill do

    factory :bill_with_bill_lines do
      # offers_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        bill_lines_count { 2 }
      end

      # the after(:create) yields two values; the supplier instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the supplier is associated properly to the offer
      after(:create) do |bill, evaluator|
        create_list(:bill_line, evaluator.bill_lines_count, bill: bill)
      end
    end
  end
end
