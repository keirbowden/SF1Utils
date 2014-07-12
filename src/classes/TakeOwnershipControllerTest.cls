@IsTest
private class TakeOwnershipControllerTest 
{
	private static User setupUser()
	{
		Profile p=[select id from Profile where name='System Administrator'];
		User u=new User(profileId=p.id, 
						username='unit.test@unit.test',
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
	
	private static testMethod void TestControllerLead() {
		User u=setupUser();
		Lead ld=new Lead(OwnerId=u.id, lastname='Test', Company='unit test');
		insert ld;
		
		System.assertEquals('SUCCESS', TakeOwnershipController.takeOwnership('Lead', ld.id));
		Lead fromDb=[select id, OwnerId from Lead where id=:ld.id];
		System.assertEquals(fromDb.ownerId, UserInfo.getUserId());
	}

	private static testMethod void TestControllerCase() {
		User u=setupUser();
		Case cs=new Case(OwnerId=u.id, subject='Unit Test', Description='Unit Test Case');
		insert cs;
		
		System.assertEquals('SUCCESS', TakeOwnershipController.takeOwnership('Case', cs.id));
		Case fromDb=[select id, OwnerId from Case where id=:cs.id];
		System.assertEquals(fromDb.ownerId, UserInfo.getUserId());
	}
}