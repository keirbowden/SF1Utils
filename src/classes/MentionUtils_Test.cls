@IsTest
private class MentionUtils_Test 
{
	private static User setupUser(String username, String profileName)
	{
		Profile p=[select id from Profile where name=:profileName];
		User u=new User(profileId=p.id, 
						username=username,
						lastname='Unit Test',
						alias='unittest',
						Email='unit.test@unit.test',
						CommunityNickName='unittest',
						emailencodingkey='UTF-8', 
						languagelocalekey='en_US',
                 		localesidkey='en_GB', 
                 		timezonesidkey='Europe/London');
		insert u;
		
		return u;
	}
	
	@IsTest(seeAllData=true)
	private static void TestPostUserFeed()
	{
		User user=setupUser('user1@unit.test', 'System Administrator');
		
		List<FeedItem> feedItems=[select id from FeedItem where ParentId=:user.id];
		System.assertEquals(0, feedItems.size());
		
		MentionUtils.NotifyUser(user.id, 'Test Message');

		// should now be one post on the user feed		
		feedItems=[select id from FeedItem where ParentId=:user.id];
		System.assertEquals(1, feedItems.size());
	}
}