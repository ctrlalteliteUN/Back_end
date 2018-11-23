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
  scope :nameGroup, -> (name){where("name LIKE ?", name )}

  scope :groupsUserbyid, ->(id){joins(:users).where("users.id = ?",id)}
  scope :groupsUserbyname, ->(name){joins(:users).where("users.name LIKE ?",name)}



def self.gu(id)


   groupsUserbyid(id)


end


  def self.gu2(nombre)


    groupsUserbyname(nombre)


  end


end
