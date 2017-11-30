require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :tag_category, :image_location

  def initialize(options)
    @id = options['id'].to_i
    @tag_category = options['tag_category']
    @image_location = options['image_location']
  end


  def save()
    sql = "INSERT INTO tags
    (tag_category,
      image_location
    )
    VALUES (
      $1,$2
    )
    RETURNING *"
    values = [@tag_category, @image_location]
    tag = SqlRunner.run(sql,values)
    @id = tag.first()['id'].to_i
  end



  def update()
    sql = "UPDATE tags
    SET (
      tag_category,
      image_location
    )
    VALUES(
      $1,$2
    )
    WHERE id = $3"
    values = [@tag_category, @image_location, @id]
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
