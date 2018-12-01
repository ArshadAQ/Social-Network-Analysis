call apoc.periodic.iterate("call apoc.load.csv('file:///C:/Users/Arshad/Downloads/SNAProject/Project/New%20folder/partyFollowers/AfD%20followers.csv') yield map as row", 
"with row unwind keys(row) as member match(m:Member{screen_name:member}) with m, member, toInteger(row[member]) as foll where not foll is null merge(f:Follower{id:foll}) with m,f merge(f) - [:FOLLOWS]->(m)",
{batchSize:10000,iterateList:true,parallel:true})

call apoc.periodic.iterate("call apoc.load.csv('file:///C:/Users/Arshad/Downloads/SNAProject/Project/New%20folder/partyFollowers/SPDfollowers1.csv') yield map as row", 
"with row unwind keys(row) as member match(m:Member{screen_name:member}) with m, member, toInteger(row[member]) as foll where not foll is null merge(f:Follower{id:foll}) with m,f merge(f) - [:FOLLOWS]->(m)",
{batchSize:10000,iterateList:true,parallel:true})

call apoc.periodic.iterate("call apoc.load.csv('file:///C:/Users/Arshad/Downloads/SNAProject/Project/New%20folder/partyFollowers/SPDfollowers2.csv') yield map as row", 
"with row unwind keys(row) as member match(m:Member{screen_name:member}) with m, member, toInteger(row[member]) as foll where not foll is null merge(f:Follower{id:foll}) with m,f merge(f) - [:FOLLOWS]->(m)",
{batchSize:10000,iterateList:true,parallel:true})

call apoc.periodic.iterate("call apoc.load.csv('file:///C:/Users/Arshad/Downloads/SNAProject/Project/New%20folder/partyFollowers/Linkefollowers.csv') yield map as row", 
"with row unwind keys(row) as member match(m:Member{screen_name:member}) with m, member, toInteger(row[member]) as foll where not foll is null merge(f:Follower{id:foll}) with m,f merge(f) - [:FOLLOWS]->(m)",
{batchSize:10000,iterateList:true,parallel:true})

call apoc.periodic.iterate("call apoc.load.csv('file:///C:/Users/Arshad/Downloads/SNAProject/Project/New%20folder/partyFollowers/CDUCSUfollowers.csv') yield map as row", 
"with row unwind keys(row) as member match(m:Member{screen_name:member}) with m, member, toInteger(row[member]) as foll where not foll is null merge(f:Follower{id:foll}) with m,f merge(f) - [:FOLLOWS]->(m)",
{batchSize:10000,iterateList:true,parallel:true})

call apoc.periodic.iterate("call apoc.load.csv('file:///C:/Users/Arshad/Downloads/SNAProject/Project/New%20folder/partyFollowers/FDPfollowers.csv') yield map as row", 
"with row unwind keys(row) as member match(m:Member{screen_name:member}) with m, member, toInteger(row[member]) as foll where not foll is null merge(f:Follower{id:foll}) with m,f merge(f) - [:FOLLOWS]->(m)",
{batchSize:10000,iterateList:true,parallel:true})

call apoc.periodic.iterate("call apoc.load.csv('file:///C:/Users/Arshad/Downloads/SNAProject/Project/New%20folder/partyFollowers/Grünefollowers.csv') yield map as row", 
"with row unwind keys(row) as member match(m:Member{screen_name:member}) with m, member, toInteger(row[member]) as foll where not foll is null merge(f:Follower{id:foll}) with m,f merge(f) - [:FOLLOWS]->(m)",
{batchSize:10000,iterateList:true,parallel:true})

