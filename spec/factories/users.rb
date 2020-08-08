FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"yyy000"}
    password_confirmation {password}
    first_name            {"坂本"}
    last_name             {"良彰"}
    first_name_kana       {"サカモト"}
    last_name_kana        {"ヨシアキ"}
    birthday              {"1931-02-02"}
  end
end