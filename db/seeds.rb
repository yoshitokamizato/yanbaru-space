# Menuのダミーデータ
# Topicのダミーデータ
# Userのダミーデータ
# Eventのダミーデータ

menu_params = []
topic_params = []
user_params = []
event_params = []

# 既存のデータを削除
Menu.delete_all
Topic.delete_all
User.delete_all
Event.delete_all

100.times do
  # Menuのダミーデータ作成
  name = Faker::Food.dish
  price = Faker::Number.number(digits: 5)
  description = Faker::Food.description

  menu_params << { name: name, price: price, description: description }

  # Topicのダミーデータ
  title = Faker::Types.rb_string
  contents = Faker::Types.rb_string

  topic_params << { title: title, contents: contents }

  # ユーザーのダミーデータ
  nickname = Faker::Name.name
  image = Faker::Types.rb_string
  password = "AAaa#{Faker::Internet.password(mix_case: true, special_characters: true)}#{Faker::Number.number(digits: 10)}"
  email = Faker::Internet.unique.email

  user_params << { nickname: nickname, image: image, password: password, email: email }

  # Eventのダミーデータ
  name = Faker::Book.title
  event_date = Faker::Time.backward(days: 5, period: :morning, format: :short)
  details = Faker::Types.rb_string

  event_params << { name: name, event_date: event_date, details: details }
end

# データ登録
Menu.create!(menu_params)
Topic.create!(topic_params)
User.create!(user_params)
Event.create!(event_params)