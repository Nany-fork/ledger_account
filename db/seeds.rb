# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
MovementType.create([{id:1,name: "Income"},{id:2,name: "Egress"},{id:3,name: "Credit"},{id:4,name: "Payment"},{id:5,name: "Investment"}])
MovementCategory.create([{name: "Beauty",movement_type_id:1},{name: "Beauty",movement_type_id:2},{name: "Health",movement_type_id:2},{name: "Health",movement_type_id:1},
{name: "Electronics",movement_type_id:1},{name: "Electronics",movement_type_id:2},{name: "Food",movement_type_id:2},{name: "Food",movement_type_id:1},{name: "Home",movement_type_id:2},
{name: "Maintenance",movement_type_id: 2},{name: "Maintenance",movement_type_id: 1},{name: "Others",movement_type_id:1},{name: "Others",movement_type_id:2},{name: "Credit cards", movement_type_id:3},{name: "Credit cards", movement_type_id:4},
{name: "Department cards",movement_type_id: 4},{name: "Department cards",movement_type_id: 3},{name: "Personal loans",movement_type_id:3},{name: "Personal loans",movement_type_id:4},{name: "Mortgage credit",movement_type_id:4},{name: "Mortgage credit",movement_type_id:3},
{name: "Mortgage credit",movement_type_id: 3},{name: "Mortgage credit",movement_type_id: 4},{name: "Real estate",movement_type_id:5},{name: "Cryptocurrency",movement_type_id:5},{name: "Cetes",movement_type_id:5},{name: "Shares of stock",movement_type_id:5}])