class ChampionsController < ApplicationController
  def index
    @champions = Champion.all

    if params[:search].present?
      case params[:category]
      when 'name'
        @champions = @champions.where("name LIKE ?", "%#{params[:search]}%")
      when 'skills'
        # 假设每个技能有一个 'description' 字段
        @champions = @champions.joins(:spells).where("spells.name LIKE ?", "%#{params[:search]}%").distinct
      when 'items'
        # 类似地，对于物品，您可能需要根据物品描述或名称进行过滤
        @champions = @champions.joins(:items).where("items.name LIKE ?", "%#{params[:search]}%").distinct
      end
    end

    
    @champions = @champions.page(params[:page]).per(36)
  end

  def show
    @champion = Champion.find(params[:id])
  end  
end
