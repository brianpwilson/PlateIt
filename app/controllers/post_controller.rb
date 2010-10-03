class PostController < ApplicationController
  before_filter :authorize
  
  def post
    @post = Post.new(params[:post])
    if( request.post? )
      plate = Plate.new(:plateId => @post.plateId, :state => @post.state)
      if( !plate.does_it_exist? )
        plate.save
        plate = plate.find_plate
      end
      
      @post.plate = plate.id
      @post.from = session[:user_id]
      if( @post.save )
        flash.now[:notice] = "#{params[:plateId]} plated"
        @post = Post.new
        redirect_to(:controller => "login", :action => "index")
      else
        @post.errors.add_to_base("Post didn't save")
      end
    end
  end

  def all_posts
    @posts = Post.find(:all)
  end

  def all_plates
    @plates = Plate.find(:all)
  end
  
  def posts_by_plate
  end

  def posts_by_user
  end

  def followed_posts
  end

end
