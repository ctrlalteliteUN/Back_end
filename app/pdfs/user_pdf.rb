require 'squid'
class PostReport
  include Prawn::View

  def initialize(id)
    super()
    @user = User.find(id)
    graph
    posts
  end

  def posts
    table post_all do
      row(0).font_style =:bold
      row(0).background_color = "79CD55"
      self.row_colors = ["DDDDDD","FFFFFF"]
      self.header = true
    end
  end

  def post_all
    [["User name","Title","Post"]] +
    @user.posts.map do |post|
      [post.user.name,post.title,post.body]
    end
  end

  def graph
    #text "hola bebe"
    #draw_text "Goodbye World", :at => [0,0], :size => 16
    #circle [100,100], 25

    #image "#{Rails.root}/app/pdfs/images/image.jpg", :at => [50,450], :width => 450
    #image "#{Rails.root}/app/pdfs/images/image.jpg",  :width => 450

    data = {}
    for x in 1..10 do
      data[x] = 10-x
    end
    chart views: data

  end
end
