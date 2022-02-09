# MovementTYpes Defined
MovementType.create([{ id: 1, name: "Income" }, { id: 2, name: "Egress" }, { id: 3, name: "Credit" }, { id: 4, name: "Payment" }, { id: 5, name: "Investment" }])
MovementCategory.create([{ name: "Beauty", movement_type_id: 2 }, { name: "Health", movement_type_id: 2 }, { name: "Electronics", movement_type_id: 2 }, { name: "Electronics", movement_type_id: 2 }, { name: "Food", movement_type_id: 2 }, { name: "Home", movement_type_id: 2 }, { name: "Maintenance", movement_type_id: 2 }, { name: "Others", movement_type_id: 2 }])
MovementCategory.create([{ name: "Beauty", movement_type_id: 1 }, { name: "Health", movement_type_id: 1 }, { name: "Electronics", movement_type_id: 1 }, { name: "Electronics", movement_type_id: 2 }, { name: "Food", movement_type_id: 1 }, { name: "Home", movement_type_id: 1 }, { name: "Maintenance", movement_type_id: 1 }, { name: "Others", movement_type_id: 1 }]) 
MovementCategory.create([{ name: "Credit", movement_type_id: 4 }, { name: "Department", movement_type_id: 4 }, { name: "Personal", movement_type_id: 4 }, { name: "Mortgage", movement_type_id: 4 }])
MovementCategory.create([{ name: "Credit", movement_type_id: 3 }, { name: "Department", movement_type_id: 3 }, { name: "Personal", movement_type_id: 3 }, { name: "Mortgage", movement_type_id: 3 }])
MovementCategory.create([{ name: "RealEstate", movement_type_id: 5 }, { name: "Cryptocurrency", movement_type_id: 5 }, { name: "Cetes", movement_type_id: 5 }, { name: "Stock", movement_type_id:5}])



