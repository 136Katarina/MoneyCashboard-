require('pry-byebug')
require_relative ('../db/sql_runner')
require_relative('./tag')
require_relative('./store')
require_relative('./budget')


class Transaction

attr_accessor :id,:transaction_date,:store_id, :tag_id, :amount, :note

def initialize(options)
  @id = options['id'].to_i
  @transaction_date = options['transaction_date']
  @store_id = options['store_id'].to_i
  @tag_id = options['tag_id'].to_i
  @amount = options['amount'].to_i
  @note = options['note']
end



def save()
  sql = "INSERT INTO transactions
  (
    transaction_date,
    store_id,
    tag_id,
    amount,
    note
    )
    VALUES(
      $1,$2,$3,$4,$5
      ) RETURNING *"
    values = [@transaction_date,@store_id, @tag_id, @amount, @note]
    transaction = SqlRunner.run(sql,values)
    @id = transaction.first()['id'].to_i
end


def update()
  sql = "UPDATE transactions
  SET
  transaction_date = $1,
      store_id = $2,
      tag_id = $3,
      amount = $4,
      note = $5

    WHERE id =$6"
    values= [@transaction_date,@store_id, @tag_id,@amount,@note,@id]
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
    WHERE id = $1"
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

def self.tag_type(id)
    sql = "SELECT *
    FROM transactions
    WHERE tag_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map { |transaction| Transaction.new(transaction) }
end


def self.total_by_tag_category(tag_id)
  sql= "SELECT SUM(amount)
  FROM transactions
  WHERE tag_id= $1"
  values = [tag_id]
  result = SqlRunner.run(sql,values)
  return result[0]['sum'].to_i
end


def self.find_by_date(transaction_date)
  sql = "SELECT *
FROM transactions
WHERE transaction_date =$1"
values=[transaction_date]
result = SqlRunner.run(sql,values)
transactions= result.map { |transaction| Transaction.new(transaction)}
return transactions
end

# def self.budget
#   result = @@BUDGET - Transaction.total()
#   return result
#   update()
# end


# def status
#   if @total
# end



# def self.budget
#   @budget_amount = @budget_amount - Transaction.total()
#   update()
# end


end
