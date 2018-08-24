# The symbol "<" well inherit all the code from an exisiting class
class PostsController < Sinatra::Base
  # sets the root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, 'views')}

  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
      id:0,
      title: 'Post 0',
      post_body: 'This is the first post'
    },
    {
      id:1,
      title: 'Post 1',
      post_body: 'This is the second post'
    },
    {
      id:2,
      title: 'Post 2',
      post_body: 'This is the third post'
    },
    {
      id:3,
      title: 'Post 3',
      post_body: 'This is the third post'
    }]

  # root
  get "/" do
    @title = "Blog Post"
    @posts = Post.all
    erb :'posts/index'

  end

  get "/new" do
    @title = "New Post"
    @post = Post.new

    erb :'posts/new'
  end

  post "/" do
    post = Post.new

    post.title = params[:title]
    post.post_body = params[:post_body]

    post.save

    redirect "/"
  end

  get "/:id" do
    # stored in params
    id = params[:id].to_i

    @post = Post.find(id)
    erb :'posts/show'
  end


  get "/:id/edit" do
    @title = "Edit Post"
    id = params[:id].to_i

    @post = Post.find(id)

    erb :'posts/edit'
  end

  put "/:id" do
    id = params[:id].to_i

    post = Post.find(id)

    post.title = params[:title]
    post.post_body = params[:post_body]

    post.save

    redirect "/"
  end

  delete "/:id" do
    id = params[:id].to_i

    Post.destroy(id)



    redirect '/'
  end

end
