// Create tweet object with below properties
// User POSTS tweet
// Tweet is RETWEET of another tweet

// Run this query for 14 files - [0.json, 1.json, 2.json, ...., 13.json]

CALL apoc.periodic.iterate(
"CALL apoc.load.json('file:///C:/Users/Arshad/Downloads/SNAProject/Project/New%20folder/recorded-tweets_minify/5.json') YIELD value as tweet",
"with tweet where tweet.id is not null MERGE(t:Tweet{id:tweet.id})
SET
t.timestamp = tweet.created_at, 
t.favourite_count = tweet.favorite_count, 
t.retweet_count = tweet.retweet_count

WITH t, tweet

UNWIND tweet.user as user
with t, tweet, user
WHERE user.id is not null
MERGE (u:User{id:user.id})
SET
u.screen_name = user.screen_name,
u.location = user.location

MERGE (u) - [:POSTS] -> (t)

WITH distinct t, tweet
WHERE tweet.retweeted_status is not null
MERGE (t) - [:RETWEETS] -> (Tweet{id:tweet.retweeted_status.id})",
{batchSize:1, iterateList:true, parallel:true})