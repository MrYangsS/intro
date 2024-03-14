require 'json'

# 清除现有数据
Champion.destroy_all
Spell.destroy_all
Item.destroy_all

# 读取并解析 Items 数据
item_file = File.read(Rails.root.join('lib', 'assets', 'item.json'))
item_data = JSON.parse(item_file)['data']

# 导入 Items 数据
item_data.each do |key, item|
  Item.create!(
    name: item['name'],
    description: item['description'],
    cost: item['gold']['total'],
    icon: item['image']['full'] 
  )
end

# 确保推荐装备存在
infinity_force = Item.find_by(name: 'Infinity Force')
heartsteel = Item.find_by(name: 'Heartsteel')
rabadons_deathcap = Item.find_by(name: "Rabadon's Deathcap") 


# 读取并解析 Champions 数据
champion_file = File.read(Rails.root.join('lib', 'assets', 'championFull.json'))
champion_data = JSON.parse(champion_file)['data']

# 导入 Champions 数据和它们的 Spells
champion_data.each do |key, champion|
  champ = Champion.create!(
    name: champion['name'],
    title: champion['title'],
    icon: champion['image']['full']  
  )

  # 为每个英雄导入技能
  champion['spells'].each do |spell|
    Spell.create!(
      champion_id: champ.id,
      name: spell['name'],
      description: spell['description'],
      icon: spell['image']['full'] 
    )
  end

  # 为每个英雄添加默认推荐装备
  [infinity_force, heartsteel, rabadons_deathcap].each do |item|
    ChampionItem.create!(
      champion_id: champ.id,
      item_id: item.id
    )
  end
end

puts 'Seeds imported successfully!'
