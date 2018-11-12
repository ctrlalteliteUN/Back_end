require 'squid'
class PostReport
  #// `include` instead of subclassing Prawn::Document
  #// as advised by the official manual
  include Prawn::View

  def initialize
    super()
    @posts = Post.all
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
    [["User name","Title","Created at","Post"]] +
    @posts.map do |post|
      [post.user.name,post.title,post.created_at.to_s[0..9],post.body]
    end

  end

  def graph
    #text "hola bebe"
    #draw_text "Goodbye World", :at => [0,0], :size => 16
    #circle [100,100], 25

    #image "#{Rails.root}/app/pdfs/images/image.jpg", :at => [50,450], :width => 450
    #image "#{Rails.root}/app/pdfs/images/image.jpg",  :width => 450


    data = {}
    @posts.each do |post|
      time = post.created_at.to_s[0..9]
      if data.keys.include? time
        data[time] = data[time] + 1
      else
        data[time] = 1
      end

    end


    chart views: data




  end
end
