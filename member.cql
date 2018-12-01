CALL apoc.load.json("file:///C:/Users/Arshad/Downloads/SNAProject/Project/New%20folder/followed-accounts.json") YIELD value
unwind keys(value) as partyName
merge(p:Party{name:partyName})
with value, p, partyName as partyName
unwind value[partyName] as member
merge(mem:Member{screen_name:toLower(member)})
merge(mem)-[:MEMBER_OF]->(p)