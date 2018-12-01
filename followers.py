"""
http://stackoverflow.com/questions/31000178/how-to-get-large-list-of-followers-tweepy
ask user for account name to harvest follower names from.
print follower names to screen
pause  users to screen
"""
import tweepy
import time
import csv
import sys
import json
import itertools as it


#Twitter API credentials
consumer_key = "6kuQb2veZHiMQXhtsRHe7VW9e"
consumer_secret = "aZk7f5y5qSiaakwikTtPvCg6fh8cvkgORLb1mjaMJxgRpinOsy"
access_key = "1050717607454601216-sLhELq2o8l1QsrBOKP3v0ofYYXrtxw"
access_secret = "da8dRrW7hO1N4VOmas5BQyToEjILrkWiTXvNHXjZa0hAE"


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
# auth.set_access_token(access_token, access_token_secret)
auth.set_access_token(access_key, access_secret)
api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True)
#refer http://docs.tweepy.org/en/v3.2.0/api.html#API
#tells tweepy.API to automatically wait for rate limits to replenish

with file("followed-accounts.json", 'r') as infile:
    parties = json.load(infile)

for party in parties:

    memberList = parties[party]
    memberList = list(set([name.lower() for name in memberList]))

    party = party.replace('/','')

    outputfilecsv = "partyFollowers/" + party +"followers.csv"
    fc = csv.writer(open(outputfilecsv, 'wb'))
    # fc.writerow(["screen_name","followers_count","statuses_count","location","geo_enabled"])
    # fc.writerow(memberList)
    partyFollowerList = []
    print "searching for party followers of "+party

    memProcessed = 0
    newMemberList = []
    validMember = False

    for accountvar in memberList:
        memProcessed += 1

        followerList = ()

        print "searching for followers of "+accountvar

        # protected account
        if accountvar.lower() == "kemmerichthl":
            continue

        users = tweepy.Cursor(api.followers_ids, screen_name=accountvar).items()

        count = 0
        errorCount=0

        while True:
            try:
                user = next(users)
                count += 1

            except tweepy.TweepError as e:
                #catches TweepError when rate limiting occurs, sleeps, then restarts.
                #nominally 15 minutes, make a bit longer to avoid attention.
                # if e.api_code == 88:
                if e.api_code == None:
                    if e == "Not authorized.":
                        break
                    # if 
                    print "sleeping...."
                    print e
                    # print e.args[0][0]['message']
                    print e.api_code
                    # print e.reason
                    print "Members processed = ", memProcessed, "of party", party
                    time.sleep(60*1)
                else:
                    print e
                    time.sleep(30*1)
                    break
                    
                # else:
                    # error code 34   
                    #If page doesn't exist - the account is not there - break loop and continue with next account
                    # print e
                    # break
                # time.sleep(60)
                user = next(users)
            except StopIteration:
                break
            try:
                validMember = True
                print user
                followerList += (str(user),)

            except UnicodeEncodeError:
                errorCount += 1
                print "UnicodeEncodeError,errorCount ="+str(errorCount)
                
        if validMember:
            newMemberList.append(accountvar)
            partyFollowerList.append(followerList)

        #apparently don't need to close csv.writer.
        print "completed, errorCount = "+str(errorCount)+" total users = "+str(count)

    fc.writerow(newMemberList)
    
    for row in it.izip_longest(*partyFollowerList):
        fc.writerow(list(row))



"""
http://docs.tweepy.org/en/v3.5.0/api.html?highlight=tweeperror#TweepError
NB: RateLimitError inherits TweepError.
http://docs.tweepy.org/en/v3.2.0/api.html#API  wait_on_rate_limit & wait_on_rate_limit_notify
NB: possibly makes the sleep redundant but leave until verified.

todo: add log file functions to record triggers of wait_on_rate_limit & error messages.

"""
