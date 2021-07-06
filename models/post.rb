class Post
  # making it public, so you don't have to be inside the class to make changes
  attr_accessor(:id, :title, :post_body)

  # creating a method to connect to the database
  def self.open_connection
    # A variable will run the method 'connect' using the gem 'PG'. Whenever ou want to use a database to get data you have to use this connection.
    conn = PG.connect(dbname: "blog")
  end

  # Setting up mario's instruction of what to do when looking for the data in the database
  def save
    conn = Post.open_connection
    if(!self.id)
      sql = "INSERT INTO post (title, post_body) VALUES ('#{self.title}','#{self.post_body}')"

      conn.exec(sql)
    else

      sql = "UPDATE post SET title='#{self.title}', post_body = '#{self.post_body}' WHERE id = #{self.id}"

      conn.exec(sql)

    end
  end

  def self.all
    # create a connection
    conn = self.open_connection
    sql = "SELECT id,title,post_body FROM post ORDER BY id"
    results = conn.exec(sql)
    posts = results.map do |result|
      self.hydrate(result)
    end
    posts
  end

  def self.find(id)
    conn = self.open_connection

    sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"

    posts_result = conn.exec(sql)

    post = self.hydrate(posts_result[0])
  end

  def self.destroy(id)
    conn = self.open_connection

    sql = "DELETE FROM post WHERE id = #{id}"

    conn.exec(sql)

  end

  def self.hydrate(post_data)
    post = Post.new

    post.id = post_data['id']
    post.title = post_data['title']
    post.post_body = post_data['post_body']

    post
  end

end

Post.all
