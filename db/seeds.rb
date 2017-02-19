# Seed person would be full_name: Person_num LLL_num
100.times do |count|
  Person.create!(f_name: "Person_#{count}", l_name: "LLL_#{count}")
end

# Seed skill would be title: Skill_num
100.times do |count|
  Skill.create(title: "Skill_#{count}")
end

1000.times do
  Rank.create(person: Person.find(rand(10..100)), skill: Skill.find(rand(4..100)))
end

Rank.all.each do |rank|
  rank.thumb_ups = rand(10..20)
  rank.thumb_downs = rand(10)
  rank.save
end