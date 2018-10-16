# == Schema Information
#
# Table name: groups
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord

  scope :groupsUser, ->(id){joins(:users).where("users.id = ?",id)}
  scope :groupsUser2, ->(name){joins(:users).where("users.name LIKE ?",name)}
  validates :name, presence: true, length:{minimum: 7}


  #associations
  has_many :posts


  has_many :group_has_tags
  has_many :tags, through: :group_has_tags


  has_many :posts

  has_many :user_has_groups
  has_many :users, through: :user_has_groups




  #muestra solo el id y body de todos los post
  scope :selectIdName, -> {select("id,name")}


  #grupos cuyo nombre contenga "sons"
  scope :nameSons, -> {where("name LIKE ?", "%sons%")}
  #id y name de grupos en los cuales este un usuario cuyo nombre tenga una o
  #scope :groupsUseropluckIdName, -> (name){joins(:users).where("users.name LIKE ?", name)}

def self.gu(id)


   groupsUser(id)


end


  def self.gu2(nombre)


    groupsUser2(nombre)


  end


end
