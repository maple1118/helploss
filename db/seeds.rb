# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'test@test.com',
   password: '123456',
)

Product.create!(
   name: 'サンプルデータ',
   product_image: 'http://placehold.jp/150x150.png',
   introduction: 'ここに商品の説明文が入ります。',
   price: 550,
)