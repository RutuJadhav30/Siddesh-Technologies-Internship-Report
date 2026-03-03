
//use online_store


db.products.insertMany([
  { _id: 1, name: "Laptop", category: "Electronics", price: 60000 },
  { _id: 2, name: "Phone", category: "Electronics", price: 30000 },
  { _id: 3, name: "Shoes", category: "Fashion", price: 2000 },
  { _id: 4, name: "Watch", category: "Fashion", price: 5000 }
])


db.customers.insertMany([
  { _id: 1, name: "Rutuja" },
  { _id: 2, name: "Aman" },
  { _id: 3, name: "Neha" }
])


db.orders.insertMany([
{
  customer_id: 1,
  date: new Date("2024-01-10"),
  items: [
    { product_id: 1, qty: 1, price: 60000 },
    { product_id: 3, qty: 2, price: 2000 }
  ]
},
{
  customer_id: 2,
  date: new Date("2024-02-15"),
  items: [
    { product_id: 2, qty: 1, price: 30000 },
    { product_id: 4, qty: 1, price: 5000 }
  ]
}
])


db.reviews.insertMany([
  { product_id: 1, rating: 5 },
  { product_id: 1, rating: 4 },
  { product_id: 2, rating: 3 },
  { product_id: 3, rating: 4 }
])



db.orders.aggregate([
  { $unwind: "$items" },
  {
    $group: {
      _id: "$items.product_id",
      totalSold: { $sum: "$items.qty" }
    }
  },
  { $sort: { totalSold: -1 } }
])



db.orders.aggregate([
  {
    $group: {
      _id: "$customer_id",
      totalOrders: { $sum: 1 }
    }
  }
])


//  Monthly revenue
db.orders.aggregate([
  { $unwind: "$items" },
  {
    $group: {
      _id: { $month: "$date" },
      revenue: {
        $sum: { $multiply: ["$items.qty", "$items.price"] }
      }
    }
  }
])


// Product rating analysis
db.reviews.aggregate([
  {
    $group: {
      _id: "$product_id",
      avgRating: { $avg: "$rating" }
    }
  }
])