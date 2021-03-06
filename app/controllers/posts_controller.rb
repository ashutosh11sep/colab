class PostsController < ApplicationController
 
	def index
 		@posts = Post.all
	end

 	def new
        @users = User.all
        @posts = Post.all
 		    @post = Post.new
      
       session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
 	end
    
    def edit
    @users = User.all  
    @posts = Post.all  
    @post = Post.find(params[:id])
    end
    
    def tag
   
    Tagging.create(user_id: params[:userId],post_id: params[:postID])
    redirect_to 'posts/#{:postId}'
    end

 	def create
 	   @post = Post.new(post_params)
 		
     params[:xyz].each do |userid|
     @pst_id=@post.id
     Tagging.create(user_id: userid,post_id: @pst_id)
     @post.save
     
     end
     redirect_to new_post_path
	 end
 
	def show
		@posts = Post.all
		@users = User.all
		@post = Post.find(params[:id])
	end

	def upvote
    
      @post = Post.find(params[:id])
      @post.upvote_from current_user
       respond_to do |format|
      format.js { render :file => 'posts/post.js.erb'}
      end
    end

  def downvote
  
      @post = Post.find(params[:id])
      @post.downvote_from current_user
       respond_to do |format|
      format.js { render :file => 'posts/post.js.erb'}
     end
  end  

     def update
  	    @post = Post.find(params[:id])
     if @post.update(post_params)
          redirect_to @post
     else
          render 'edit'
  end
end




   def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
  end
 private
  def post_params
    params.require(:post).permit(:title, :descrption)
  end
end





































# class PostsController < ApplicationController
#   before_action :set_post, only: [:show, :edit, :update, :destroy]

#   # GET /posts
#   # GET /posts.json
#   def index
#     @posts = Post.all
#   end

#   # GET /posts/1
#   # GET /posts/1.json
#   def show
#   end

#   # GET /posts/new
#   def new
#     #byebug
#     @post = Post.new
#     @current_user= current_user
#   end

#   # GET /posts/1/edit
#   def edit
#   end

#   # POST /posts
#   # POST /posts.json
#   def create
    
#     @post = Post.new(post_params)
#         @post.user_id=current_user.id


#     #respond_to do |format|
#        @post.save
#     redirect_to new_post_path

#        # format.html { redirect_to @post, notice: 'Post was successfully created.' }
#         #format.json { render :show, status: :created, location: @post }
#       #else
#         #format.html { render :new }
#         #format.json { render json: @post.errors, status: :unprocessable_entity }
#       #end
#     #end
#   end

#   # PATCH/PUT /posts/1
#   # PATCH/PUT /posts/1.json
#   def update
#     respond_to do |format|
#       if @post.update(post_params)
#         format.html { redirect_to @post, notice: 'Post was successfully updated.' }
#         format.json { render :show, status: :ok, location: @post }
#       else
#         format.html { render :edit }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /posts/1
#   # DELETE /posts/1.json
#   def destroy
#     @post.destroy
#     respond_to do |format|
#       format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_post
#       @post = Post.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def post_params
#       params.require(:post).permit(:title, :descrption)
#     end
# end
