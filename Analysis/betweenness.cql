CALL algo.betweenness('User', 'RETWEETS_USER',
{write: true, writeProperty:'r-betweenness'})

// Betweenness centrality by user
MATCH (u:User) 
RETURN u.screen_name, u.`r-betweenness`
ORDER BY u.`r-betweenness` DESC LIMIT 10

// Check if those users are party members
MATCH (u:User) 
with u
optional MATCH (u)-[:MEMBER_OF]-(p)
RETURN u.screen_name, p.name, u.`r-betweenness`
ORDER BY u.`r-betweenness` DESC LIMIT 10