require('pry')
require_relative ('../models/budget')
require_relative ('../models/transaction')
require_relative ('../models/tag')
require_relative ('../models/store')





tag1 = Tag.new ({ "tag_category" => "Food",
  "image_location" => 'gallery/food.png'})
tag2 = Tag.new ({ "tag_category" => "Entertainment",
  "image_location" => 'gallery/entertainment.png'})
tag3 = Tag.new ({ "tag_category" => "Health",
  "image_location" => 'gallery/health.png'})
tag4 = Tag.new ({ "tag_category" => "Fashion",
  "image_location" => 'gallery/fashion.png'})
tag5 = Tag.new ({ "tag_category" => "Education",
  "image_location" => 'gallery/education.png'})
tag6 = Tag.new ({ "tag_category" => "Personal",
  "image_location" => 'gallery/personal.png'})
tag7 = Tag.new ({ "tag_category" => "Housing",
  "image_location" => 'gallery/housing.png'})

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
  "amount" => 15055,
  "note" => "medicine"
  })

transaction2 = Transaction.new ({
  "transaction_date" => "2017-10-11",
  "store_id" => store2.id,
  "tag_id" => tag2.id,
  "amount" => 30095,
  "note" => "colouring book"

  })


transaction3 = Transaction.new ({
  "transaction_date" => "2017-01-20",
  "store_id" => store3.id,
  "tag_id" => tag3.id,
  "amount" => 2020,
  "note" => "soap"
  })


transaction1.save
transaction2.save
transaction3.save

binding.pry
nil
