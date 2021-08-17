10.times do |i|
  user = User.find_or_initialize_by(email: "user+#{i}@gmail.com")
  user.update!(
    name: "#{i}#{i}",
    password: "#{i}#{i}#{i}#{i}#{i}#{i}",
    confirmed_at: DateTime.now,
  )
end

[
  { shop: "Eggs 'n Things", location: "銀座", content: "映画にもなった有名なパンケーキ屋さん！", owner_id: 1, status: 0, end_on: DateTime.now + 10 },
  { shop: "スシロー", location: "どこでも", content: "うまい！やすい！", owner_id: 2, status: 0, end_on: DateTime.now + 11 },
  { shop: "とみ田", location: "松戸", content: "日本一のつけ麺", owner_id: 3, status: 0, end_on: DateTime.now + 12 },
  { shop: "叙々苑", location: "どこでも", content: "奢ってください。", owner_id: 1, status: 0, end_on: DateTime.now + 13 },
  { shop: "たいめいけん", location: "日本橋", content: "店長さんを生で見てみたい", owner_id: 1, status: 0, end_on: DateTime.now + 14 },
  { shop: "ひみつ堂", location: "台東区", content: "夏はかき氷", owner_id: 2, status: 0, end_on: DateTime.now + 14 },
].each do |recruit|
  Recruit.find_or_create_by!(recruit)
end
