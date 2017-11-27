require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :tag_category

  def initialize(options)
    @id = options['id'].to_i
    @tag_category = options['tag_category']

  end


  def save()
    sql = "INSERT INTO tags
    (tag_category
    )
    VALUES (
      $1
    )
    RETURNING *"
    values = [@tag_category]
    tag = SqlRunner.run(sql,values)
    @id = tag.first()['id'].to_i
  end



  def update()
    sql = "UPDATE tags
    SET (
      tag_category
    )
    VALUES(
      $1
    )
    WHERE id = $2"
    values = [@tag_category, @id]
    tag = SqlRunner.run(sql,values)
    result = tags.map {|tag| Tag.new(tag)}
    return result
  end


  def self.all()
    sql = "SELECT * FROM tags"
    values = []
    tags = SqlRunner.run(sql,values)
    result = tags.map{|tag| Tag.new(tag)}
    return result
  end


  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    tag = SqlRunner.run(sql, values)
    result = Tag.new(tag.first)
    return result
  end

end
