
class Champion < ApplicationRecord
    validates :name, presence: true
    has_many :spells
    has_many :champion_items
    has_many :items, through: :champion_items
  end
  

  class Item < ApplicationRecord
    validates :name, presence: true
    has_many :champion_items
    has_many :champions, through: :champion_items
  end
  
 
  class Spell < ApplicationRecord
    belongs_to :champion
  end
  
 
  class ChampionItem < ApplicationRecord
    belongs_to :champion
    belongs_to :item
  end
  