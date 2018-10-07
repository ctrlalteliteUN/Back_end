class Group < ApplicationRecord


  validates :name, presence: true, length:{minimum: 7}


  #associations
  has_many :posts


  has_many :group_has_tags
  has_many :tags, through: :group_has_tags

  has_many :post_has_tags
  has_many :posts, through: :post_has_tags

  has_many :user_has_groups
  has_many :users, through: :user_has_groups




  #muestra solo el id y body de todos los post
  scope :selectIdName, -> {select("id,name")}


  #grupos cuyo nombre contenga "sons"
  scope :nameSons, -> {where("name LIKE ?", "%sons%")}
  #id y name de grupos en los cuales este un usuario cuyo nombre tenga una o
  scope :groupsUseropluckIdName, -> {joins(:users).where("users.name LIKE ?", "%o%").pluck(:id,'groups.name')}

end
