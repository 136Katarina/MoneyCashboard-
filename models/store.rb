require_relative('../db/sql_runner')
require_relative('./transaction')

class Store

  attr_reader :id, :name


  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO stores
    (name
    )
    VALUES
    ($1)
    RETURNING *"
    values = [@name]
    store = SqlRunner.run(sql,values)
    @id = store.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM stores"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM stores"
    values = []
    stores = SqlRunner.run(sql,values)
    result = stores.map { |store| Store.new(store)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM stores
    WHERE id = $1"
    values = [id]
    store = SqlRunner.run(sql,values)
    result = Store.new(store.first)
    return result
  end





end
