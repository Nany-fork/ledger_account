income_movement = MovementType.find_or_create_by(name: "Income")
egress_movement = MovementType.find_or_create_by(name: "Egress")
credit_movement = MovementType.find_or_create_by(name: "Credit")
payment_movement = MovementType.find_or_create_by(name: "Payment")
investment_movement = MovementType.find_or_create_by(name:"Investment")
MovementCategory.create([{ name: "Beauty", movement_type_id: egress_movement.id }, { name: "Health",movement_type_id: egress_movement.id }, { name: "Electronics",movement_type_id: egress_movement.id }, { name: "Food",movement_type_id: egress_movement.id }, { name: "Home",movement_type_id: egress_movement.id }, { name: "Maintenance",movement_type_id: egress_movement.id }, { name: "Others", movement_type_id: egress_movement.id }])
MovementCategory.create([{ name: "Beauty", movement_type_id: income_movement.id }, { name: "Health",movement_type_id: income_movement.id }, { name: "Electronics",movement_type_id: income_movement.id }, { name: "Food",movement_type_id: income_movement.id }, { name: "Home",movement_type_id: income_movement.id }, { name: "Maintenance",movement_type_id: income_movement.id }, { name: "Others", movement_type_id: income_movement.id}]) 
MovementCategory.create([{ name: "Credit", movement_type_id: payment_movement.id }, { name: "Department", movement_type_id: payment_movement.id }, { name: "Personal", movement_type_id: payment_movement.id }, { name: "Mortgage", movement_type_id: payment_movement.id }])
MovementCategory.create([{ name: "Credit", movement_type_id: credit_movement.id }, { name: "Department", movement_type_id: credit_movement.id }, { name: "Personal", movement_type_id: credit_movement.id }, { name: "Mortgage", movement_type_id: credit_movement.id }])
MovementCategory.create([{ name: "RealEstate", movement_type_id: investment_movement.id }, { name: "Cryptocurrency", movement_type_id: investment_movement.id }, { name: "Cetes", movement_type_id: investment_movement.id }, { name: "Stock", movement_type_id:investment_movement.id}])



