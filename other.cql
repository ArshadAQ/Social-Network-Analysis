// GET TOTAL RELATED MEMBERS OF EACH PARTY BY FOLLOWS
match(p:Party)
with p
Match(u:User)-[:FOLLOWS]-()-[:MEMBER_OF]->(p) return p.name, count(*) order by count(*) DESC

// GET TOTAL RELATED MEMBERS OF EACH PARTY BY RETWEETS
match(p:Party)
with p
Match(u:User)-[:RETWEETS_USER]-()-[:MEMBER_OF]->(p) return p.name, count(*) order by count(*) DESC

// GET TOTAL RELATED MEMBERS OF EACH PARTY
match(p:Party)
with p
Match(u:User)-[]-()-[:MEMBER_OF]->(p) return p.name, count(*) order by count(*) DESC

// count no.of tweets for every year
unwind ["2007","2008","2009","2010","2011","2012","2013","2014","2015", "2016","2017"] as year
match(t:Tweet) where right(t.timestamp,4) = year return year, count(t)

// No. of tweets leading into the election
unwind ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep", "Oct","Nov", "Dec"] as month
match(t:Tweet) where split(t.timestamp," ")[1] =  month return month, count(t) order by count(t) desc

// No. of newly created accounts leading into the election
unwind ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep", "Oct","Nov", "Dec"] as month
match(u:User) where (split(u.created_at," ")[1] =  month and split(u.created_at," ")[5] = 2017) return month, count(u) order by count(u) desc