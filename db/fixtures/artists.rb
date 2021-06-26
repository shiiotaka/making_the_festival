10.times do |n|
  Artist.seed do |s|
    s.name = "アーティスト#{n}"
  end
end
