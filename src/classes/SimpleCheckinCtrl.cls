public with sharing class SimpleCheckinCtrl 
{
	@RemoteAction
	public static String Checkin(String userId, String inDetails,
									Double latitude, Double longitude) 
	{
		System.debug('### In Checkin');
		
		Check_In__c chkIn=
			 			new Check_In__c(
			 				OwnerId=userId,
			 				Date_Time__c=System.now(),
							Details__c=inDetails,
			    			Location__Latitude__s=latitude,
	    					Location__Longitude__s=longitude);
		
		insert chkIn;
		
		FeedItem fitem=new FeedItem();
		fItem.parentId=userId;
		fItem.linkUrl='/' + chkIn.id;
		fItem.title='Check In';
		fItem.body='I checked in - ' + inDetails;
		
		insert fItem;
		
		return 'SUCCESS';
	}
}