# require_relative ('../db/sql_runner')
# require_relative('./transaction')
#
# class Budget
#
# attr_reader :id
# attr_accessor :budget_amount
#
# def initialize (options)
#   @id = options['id'].to_i
#   @budget_amount = options['budget_amount'].to_i
# end
#
#
# def save()
#   sql = "INSERT INTO budgets
#   (
#     budget_amount
#     )
#     VALUES(
#       $1
#       )
#     RETURNING *"
#   values = [ @budget_amount]
#   budget = SqlRunner.run(sql,values)
#   @id = budget.first()['id'].to_i
# end
#
#
# def update
#   sql = "UPDATE budgets
#         SET
#         (
#         budget_amount
#
#       )
#       VALUES (
#         $1
#         )
#         WHERE id = $2"
#       values = [@budget_amount]
#       SqlRunner.run(sql,values)
#     end
# end
#
#
#
#
# # def total()
# #   sql = "SELECT SUM(amount)
# #         FROM transactions
# #         WHERE budget_id = $1"
# #       values= [@id]
# #       result = SqlRunner.run(sql,values)
# #       @total = result.first()['sum']
# #       update()
# # end
# #
# #
# # def total_by_tag(tag_id)
# #   sql = "SELECT SUM(value)
# #     FROM transactions
# #     WHERE id = $1
# #     AND budget_id= 2"
# #     values = [@id, @tag_id]
# #     result = SqlRunner.run(sql,values)
# #     @spendings_by_tag = result.first()['sum']
# #     update()
# # end
# #
# #
# # def self.all
# #   sql = "SELECT * FROM cashboards"
# #   values = []
# #   result = SqlRunner.run(sql,values)
# #   budgets = result.map{|budgets| Cashboard.new(budgets)}
# #   return budgets
# # end
