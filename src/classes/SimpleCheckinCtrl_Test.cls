@IsTest
private class SimpleCheckinCtrl_Test 
{
	private static TestMethod void TestController()
	{
		Double latitude=0.1;
		Double longitude=0.1;
		SimpleCheckinCtrl.Checkin(UserInfo.getUserId(), 'Unit Test', latitude, longitude);
		// should be one checkin sobect now
		List<Check_In__c> checkins=[select id, Details__c from Check_In__c];
		System.assertEquals(1, checkins.size());
		System.assertEquals('Unit Test', checkins[0].Details__c);
	}
}