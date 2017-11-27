require('pry')
require_relative ('../models/budget')
require_relative ('../models/transaction')
require_relative ('../models/tag')
require_relative ('../models/store')





tag1 = Tag.new ({ "tag_category" => "Food"})
tag2 = Tag.new ({ "tag_category" => "Entertainment"})
tag3 = Tag.new ({ "tag_category" => "Health"})
tag4 = Tag.new ({ "tag_category" => "Fashion"})
tag5 = Tag.new ({ "tag_category" => "Education"})
tag6 = Tag.new ({ "tag_category" => "Personal"})
tag7 = Tag.new ({ "tag_category" => "Housing"})

tag1.save
tag2.save
tag3.save
tag4.save
tag5.save
tag6.save
tag7.save


store1 = Store.new ({"name" => "Tesco"})
store2 = Store.new ({"name" => "Cooperative"})
store3 = Store.new ({"name" => "Marks&Spencer"})
store4 = Store.new ({"name" => "House of Fraser"})
store5 = Store.new ({"name" => "Jenners"})
store6 = Store.new ({"name" => "Waterstones"})

store1.save
store2.save
store3.save
store4.save
store5.save
store6.save


transaction1 = Transaction.new ({
  "transaction_date" => "2017-11-22",
  "store_id" => store1.id,
  "tag_id" => tag3.id,
  "amount" => 150
  })

transaction2 = Transaction.new ({
  "transaction_date" => "2017-10-11",
  "store_id" => store2.id,
  "tag_id" => tag2.id,
  "amount" => 300

  })


transaction3 = Transaction.new ({
  "transaction_date" => "2017-01-20",
  "store_id" => store3.id,
  "tag_id" => tag3.id,
  "amount" => 20
  })


transaction1.save
transaction2.save
transaction3.save

binding.pry
nil
