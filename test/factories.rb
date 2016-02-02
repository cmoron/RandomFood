FactoryGirl.define do
  factory :user do
    email                 'john@randomfood.com'
    password              'password'
    password_confirmation 'password'
    admin                 false
  end

  factory :admin, class: User do
    email                 'admin@randomfood.com'
    password              'password'
    password_confirmation 'password'
    admin                 true
  end
end
