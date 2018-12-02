# Social-Network-Analysis
### Twitter German 2017 election campaign analysis
## Overview
This work tries to investigate the part that social media plays in driving election campaigns and results

Dataset source: https://zenodo.org/record/835735#.XAKJw2gzbQA

## Project Workflow

#### 1. Dataset collection
- Get party-member followers from Twitter

#### 2. Preprocessing
- Minify JSON files to reduce size. Initial dataset size amounted to 10GB
- Detect invalid JSON files and discard them
- Concatenate 1308 JSON files to 13 files

#### 3. Importing
- Import party-member
  - Relate every member with a party using a _MEMBER_OF_ relationship
- Import party-member followers
  - Relate follower with party-member using a _FOLLOWS_ relationship
- Import tweets
  - Create user _POSTS_ tweet relationship
  - Create tweet _RETWEETS_ tweet relationship
- Set members, followers as users
- Set database constraints
#### 4. Graph algorithms and related analysis
- Page rank
  - Users who were followed the most
  - Users who were retweeted the most
  - Distinct characteristics of the above users
- Harmonic
- Betweenness
- Other analysis
#### 5. Results
