/*
    Page rank for FOLLOWS relationship
*/
CALL algo.pageRank('MEMBER', 'FOLLOWS',
{write: true, writeProperty:'pagerank'})

// Top parties with most no.of followers
MATCH (t:Member)-[:MEMBER_OF]->(p:Party)
RETURN t.screen_name,p.name, t.pagerank 
ORDER BY t.pagerank DESC LIMIT 10

// Commonality between users who were followed the most
MATCH (t:Member)-[:MEMBER_OF]->(p:Party)
RETURN t.screen_name, t.location, p.name, t.pagerank 
ORDER BY t.pagerank DESC LIMIT 10

/*
    Page rank for RETWEETS_USER relationship
*/

CALL algo.pageRank('User', 'RETWEETS_USER',{write: true, writeProperty:'r-pagerank'})

// User with most no.of retweets
MATCH (t:User) 
RETURN t.screen_name, t.`r-pagerank`
ORDER BY t.`r-pagerank` DESC LIMIT 10

// Top parties with most no.of retweets
MATCH (t:Member)-[:MEMBER_OF]->(p:Party)
RETURN t.screen_name,p.name, t.`r-pagerank`
ORDER BY t.`r-pagerank` DESC LIMIT 10

// Commonality between users who were retweeted the most
MATCH (t:Member)-[:MEMBER_OF]->(p:Party)
RETURN t.screen_name, t.location, p.name, t.`r-pagerank` 
ORDER BY t.`r-pagerank` DESC LIMIT 10



// 
MATCH (m:Member)-[:MEMBER_OF]->(p:Party) Return p.name, sum(m.pagerank) order by sum(m.pagerank) DESC limit 10

MATCH (m:Member)-[:MEMBER_OF]->(p:Party) return m.name, p.name, m.pagerank order by m.pagerank DESC limit 10