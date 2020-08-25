class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 
  #grab all notes (NOTE, for some reason, it follow by update, check order!)
 def index
  @posts = Post.all.order('id')
end

#grab one note
def show
  #@post = Post.find(params[:id])
end

#show the new view page
def new
  @post = Post.new
  render :_form
end

# create function for the new notes page
def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path
    else
      render :new #method to create
    end
end

def destroy #delete function, follow via Rails Route list
#binding.pry
  #Post.find(params[:id]).destroy
  @post.destroy
  redirect_to posts_path
end


def edit
render :_form
end

  # update/edit function for the edit notes page
  #find the note via its ID for edit
def update
  #@post = Post.find(params[:id])
  if @post.update(posts_params) #pass to the private below
    redirect_to posts_path
  else
    render :edit #method to update
  end
end

private

# this help the controller understand what the data is being entered
# into SQL database. Need to be in private
def set_post
  @post = Post.find(params[:id])
end

def posts_params
   params.require(:post).permit(:title, :color, :body)
 end


end
