class PostController < ApplicationController
  before_filter :authorize
  
  def post
    @post = Post.new(params[:post])
    if( request.post? )
      plate = Plate.new(:plateId => @post.plateId, :state => @post.state)
      if( !plate.does_it_exist? )
        plate.save
      end
      plate = plate.find_plate
      
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
    @plate = Plate.find( :first, :conditions => { :plateId => params[:post]["plateId"],
                                                  :state => params[:post]["state"] } )
    @posts = Post.find( :all, :conditions => { :plate => @plate.id } )
  end

  def posts_by_user
    @user = User.find_by_id(session[:user_id])
    @posts = Post.find( :all, :conditions => { :from => session[:user_id] } )
  end

  def followed_posts
  end

end
