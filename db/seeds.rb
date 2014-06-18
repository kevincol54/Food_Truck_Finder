
u = user.new(
  email: 'companyuser@example.com',
  password: 'password',
  name: 'Doug Schmidt',
  user_type: 'Company',
  company_name: 'Good Food Inc',
  phone_number: '+12345678900'
  )
u.save!(validate: false)

u = user.new(
  email: 'foodieuser@example.com',
  password: 'password',
  name: 'Steven Tyler',
  user_type: 'Foodie',
  phone_number: '+18034682388'
  )
u.save!(validate: false)

#############################################################

Company.create!(
  name: 'Good Food Inc',
  description: 'This is a small local company that caters to anyone that loves good food. We are locally owned and operated',
  user_id: '1'
  )

#############################################################

FoodTruck.create!(
  name: 'Pigs Belly Pork',
  description: 'The Best BBQ this side of the silicon harbor.',
  company_id: '1',
  address: '316 Bayview Drive, Mount Pleasant, SC',
  latitude: '32.7938',
  longitude: '-79.8897',
  status: '1'
  )

FoodTruck.create!(
  name: 'Taco Guy',
  description: 'Some of the best tacos that have never existed and other delicous food.',
  company_id: '1',
  address: '85 Patriots Point Road, Mount Pleasant, SC',
  latitude: '32.7946',
  longitude: '-79.9046',
  status: '1'
  )

FoodTruck.create!(
  name: 'Finger Lickin Chickin',
  description: 'The best darn chickin out there, youll be likcin those fingers clean!',
  company_id: '1',
  address: '320 Molasses Lane, Mount Pleasant, SC',
  latitude: '32.8186',
  longitude: '-79.8886',
  status: '1'
  )

FoodTruck.create!(
  name: 'MMMMM Good Food',
  description: 'Food some good youll be walking away going, MMMMMMMMM',
  company_id: '1',
  address: '1107 Summersill Lane, Mount Pleasant, SC',
  latitude: '32.8183',
  longitude: '-79.8647',
  status: '1'
  )

FoodTruck.create!(
  name: 'Billy Bobs Peanut Butter and Jelly Mobile',
  description: 'This will be the best PB&J you have evre had the pleasure to eat.',
  company_id: '1',
  address: '709 Center Street, Mount Pleasant, SC',
  latitude: '32.784',
  longitude: '-79.8598',
  status: '1'
  )

FoodTruck.create!(
  name: 'Darn good Sub Sandwhiches',
  description: 'These subs will make you come back wanting more',
  company_id: '1',
  address: '1336 Shrimp Boat Lane, Mount Pleasant, SC',
  latitude: '32.7925',
  longitude: '-79.8829',
  status: '0'
  )

FoodTruck.create!(
  name: 'This Is Yum',
  description: 'A wide selection of food from many different corners of the world',
  company_id: '1',
  address: '114 Live Oak Drive, Mount Pleasant, SC',
  latitude: '32.7891',
  longitude: '-79.8823',
  status: '0'
  )

FoodTruck.create!(
  name: 'The Saltines Truck',
  description: 'This will be the most boring truck youve ever seen. We serve nothing but saltine crackers. Sometimes, Ritz crackers',
  company_id: '1',
  address: '748 Creekside Drive, Mount Pleasant, SC',
  latitude: '32.8025',
  longitude: '-79.8698',
  status: '0'
  )

#######################################################################

Like.create!(
  user_id: '1',
  food_truck_id: '1'
  status: '1'
  )

Like.create!(
  user_id: '1',
  food_truck_id: '3'
  status: '1'
  )

Like.create!(
  user_id: '1',
  food_truck_id: '4'
  status: '1'
  )

Like.create!(
  user_id: '1',
  food_truck_id: '6'
  status: '1'
  )

Like.create!(
  user_id: '1',
  food_truck_id: '7'
  status: '1'
  )

Like.create!(
  user_id: '1',
  food_truck_id: '8'
  status: '0'
  )

Like.create!(
  user_id: '1',
  food_truck_id: '5'
  status: '0'
  )

Like.create!(
  user_id: '1',
  food_truck_id: '2'
  status: '0'
  )

