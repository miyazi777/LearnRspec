FactoryGirl.define do
  factory :phone do
    association :contact
    phone { Faker::PhoneNumber.phone_number }

    # 自宅用
    factory :home_phone do
      phone_type 'home'
    end

    # 仕事用
    factory :work_phone do
      phone_type 'work'
    end

    # 携帯用
    factory :mobile_phone do
      phone_type 'mobile'
    end
  end
end
