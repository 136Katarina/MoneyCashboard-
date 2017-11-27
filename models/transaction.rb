require_relative ('../db/sql_runner')
require_relative('./tag')
require_relative('./store')
require_relative('./budget')


class Transaction

attr_accessor :id,:transaction_date,:store_id, :tag_id, :amount

def initialize(options)
  @id = options['id'].to_i
  @transaction_date = options['transaction_date']
  @store_id = options['store_id'].to_i
  @tag_id = options['tag_id'].to_i
  @amount = options['amount'].to_i
end



def save()
  sql = "INSERT INTO transactions
  (
    transaction_date,
    store_id,
    tag_id,
    amount
    )
    VALUES(
      $1,$2,$3,$4
      ) RETURNING *"
    values = [@transaction_date,@store_id, @tag_id, @amount]
    transaction = SqlRunner.run(sql,values)
    @id = transaction.first()['id'].to_i
end


def update()
  sql = "UPDATE transactions
  SET
  (
    transaction_date,
    store_id,
    tag_id,
    amount
    )
    VALUES(
      $1,$2,$3,$4
      )
      WHERE id =$5"
    values= [@transaction_date,@store_id, @tag_id,@amount,@id]
    SqlRunner.run(sql,values)
  end


  def self.all()
    sql = "SELECT * FROM transactions"
    values = []
    transactions = SqlRunner.run(sql,values)
    result = transactions.map {|transaction| Transaction.new(transaction)}
    return result
  end


  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    transaction = SqlRunner.run(sql, values)
    result = Transaction.new(transaction.first)
    return result
  end


  def self.delete_all
  sql = "DELETE FROM transactions"
  SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

  def find_tag_category()
    sql = "SELECT * FROM tags
    WHERE ID = $1"
    values = [@tag_category]
    tag = SqlRunner.run(sql,values)
    tag_name = Tag.new(tag.first)
    return tag_name
  end


def store
  sql = "SELECT * FROM stores
  WHERE id =$1"
  values = [@store_id]
  store = SqlRunner.run(sql,values)
  result = Store.new(store.first)
  return result
end


def tag
  sql = "SELECT * FROM tags
  WHERE id=$1"
  values = [@tag_id]
  tag = SqlRunner.run(sql,values)
  result = Tag.new(tag.first)
  return result
end



def self.total()
  sql = "SELECT SUM(amount) FROM transactions"
  values = []
  results = SqlRunner.run(sql,values)
  return results.first['sum'].to_i
  update()
end

def self.total_by_tag_type(id)
  sql= "SELECT SUM(amount)
  FROM transactions
  WHERE tag_id= $1"
  values = [id]
  result = SqlRunner.run(sql,values)
  return result.first['sum'].to_i
end

def self.budget
  result = 1000 - Transaction.total()
  return result
  update()
end



# def self.budget
#   @budget_amount = @budget_amount - Transaction.total()
#   update()
# end


end
