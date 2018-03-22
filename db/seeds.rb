###########################
### SEED USERS ############
###########################

User.create(
  first_name: 'Admin',
  last_name: 'Admin',
  email: 'hello@world.com',
  username: 'admin',
  password: '123',
  password_confirmation: '123',
  is_admin: true,
  is_sysop: true,
  active: true
)

# %w[1A 2B 5B 3C 5C 6A].each do |number|
#   floor, letter = number.split(//, 2)
#   Unit.find_or_create_by(floor: floor.to_i, letter: letter) do |unit|
#     unit.number_of_bedrooms = rand(2) + 1
#     unit.number_of_bathrooms = rand(2) + 1
#     unit.interior_square_feet = 1000 + rand(10) * 100
#     unit.exterior_square_feet = 1000 + rand(10) * 100
#     unit.price = 2_000_000
#     unit.monthly_common_charges = 1000 + rand(2) * 100
#     unit.monthly_taxes = 1000 + rand(2) * 100
#   end
# end

Page.find_or_create_by(name: 'Home') do |p|
  p.editable = false
  p.in_primary_nav = false
end

Page.find_or_create_by(
  name: 'Residences'
)

Page.find_or_create_by(
  name: 'Amenities'
)

Page.find_or_create_by(
  name: 'Design Vision'
)

Page.find_or_create_by(
  name: 'Neighborhood'
)

Page.find_or_create_by(name: 'Availability') do |p|
  p.editable = false
end

Page.find_or_create_by(
  name: 'Team'
)

Page.find_or_create_by(name: 'Contact') do |p|
  p.editable = false
end

Page.find_or_create_by(name: 'Press') do |p|
  p.editable = false
end