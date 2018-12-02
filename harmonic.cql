CALL algo.closeness.harmonic('User', 'RETWEETS_USER', 
{writeProperty:'h-centrality'})
YIELD nodes,loadMillis, computeMillis, writeMillis;

// Harmonic centrality by user
MATCH (u:User) 
RETURN u.screen_name, u.`h-centrality`
ORDER BY u.`h-centrality` DESC LIMIT 10

// Check if those users are party members
MATCH (u:User) 
with u
optional MATCH (u)-[:MEMBER_OF]-(p)
RETURN u.screen_name, p.name, u.`h-centrality`
ORDER BY u.`h-centrality` DESC LIMIT 10