global with sharing class TakeOwnershipController 
{
	private static sObject createsObject(String typeName) {
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(typeName);
        return (null==targetType?null:targetType.newSObject());
    }
    
	@RemoteAction
	global static String TakeOwnership(String typeName, String recId) 
	{
		String result='SUCCESS';
		
		try
		{
			Id uid=UserInfo.getUserId();
			Sobject sobj=createSobject(typeName);
			if (null!=sobj)
			{
				sobj.put('id', recId);
				sobj.put('OwnerId', UserInfo.getUserId());
				upsert sobj;
			}
			else
			{
				result='Unable to locate type named ' + typeName;
			}
		}
		catch (Exception e)
		{
			result=e.getMessage();
		}
		
		return result;
	}
	
}