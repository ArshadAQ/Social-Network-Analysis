
match(f:Follower)-[:FOLLOWS]->(m:Member) where not f:User 
match(u:User) where u.id = f.id 
with f, m, u
merge(u)-[:FOLLOWS]->(m)
detach delete f
set u:Follower

match(m:Member)<-[:FOLLOWS]-(f:Follower) where not m:User 
match(u:User) where u.id = m.id 
with f, m, u
merge(u)<-[:FOLLOWS]-(f)
detach delete m
set u:Member

match(m:Member) where not m:User 
match(u:User) where u.screen_name = m.screen_name
with u,m
match (m)<-[:FOLLOWS]-(f:Follower) 
merge(f)-[:FOLLOWS]->(u)
with m, u
detach delete m
set u:Member

MATCH p=(t1:Tweet)-[r:RETWEETS]->(t2)
with t2, collect(t1) as t3
merge(t5:Tweet{id:t2.id})
with t2, t3, t5
unwind t3 as t4
merge(t4)-[:RETWEETS]->(t5)
detach delete t2