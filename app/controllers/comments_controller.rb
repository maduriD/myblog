class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  
  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id]) 
    @comment = @post.comments.create!(params[:comment])

    respond_to do |format|
        format.html { redirect_to @post, :notice => 'Comment was successfully created! Congrats :).' }
        format.json { render :json => @comment, :status => :created, :location => @comment }
        format.js #create.js.erb
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :ok }
    end
  end
end
