
// MongoDB Social Media Platform Project
//use social_media

// USERS
db.users.insertMany([
  { _id: 1, name: "Rutuja" },
  { _id: 2, name: "Aman" },
  { _id: 3, name: "Neha" },
  { _id: 4, name: "Vikram" }
])

// FOLLOWERS
db.followers.insertMany([
  { user_id: 1, follower_id: 2 },
  { user_id: 1, follower_id: 3 },
  { user_id: 2, follower_id: 1 },
  { user_id: 2, follower_id: 3 },
  { user_id: 3, follower_id: 1 }
])

// POSTS (Nested Structure)
db.posts.insertMany([
{
  user_id: 1,
  content: "Hello world",
  likes: [2,3],
  comments: [
    { user_id: 2, text: "Nice!" },
    { user_id: 3, text: "Great!" }
  ],
  created_at: new Date("2024-01-10")
},
{
  user_id: 2,
  content: "MongoDB is awesome",
  likes: [1],
  comments: [
    { user_id: 1, text: "Yes!" }
  ],
  created_at: new Date("2024-02-05")
}
])


// 1. Users with most followers
db.followers.aggregate([
  { $group: { _id: "$user_id", totalFollowers: { $sum: 1 } } },
  { $sort: { totalFollowers: -1 } }
])

// 2. Posts with most likes
db.posts.aggregate([
  { $addFields: { likeCount: { $size: "$likes" } } },
  { $sort: { likeCount: -1 } }
])

// 3. Posts with most comments
db.posts.aggregate([
  { $addFields: { commentCount: { $size: "$comments" } } },
  { $sort: { commentCount: -1 } }
])

// 4. Monthly user activity
db.posts.aggregate([
  {
    $group: {
      _id: { $month: "$created_at" },
      totalPosts: { $sum: 1 }
    }
  }
])