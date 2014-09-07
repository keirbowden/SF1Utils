public with sharing class MentionUtils 
{
	public static void NotifyUser(Id userId, String message)
	{
		// can't notify yourself, so skip that
		if (userId!=UserInfo.getUserId())
		{
			ConnectApi.MessageBodyInput messageInput = new ConnectApi.MessageBodyInput();

			messageInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();

			// create and add the mention segment
			ConnectApi.MentionSegmentInput mentionSegment = new ConnectApi.MentionSegmentInput();
			mentionSegment.id = userId;
			messageInput.messageSegments.add(mentionSegment);

			// create and add the message body segment
			ConnectApi.TextSegmentInput textSegment;
			textSegment = new ConnectApi.TextSegmentInput();
			textSegment.text = message;
			messageInput.messageSegments.add(textSegment);

			// create the FeedItemInput and add the messageInput to it
			ConnectApi.FeedItemInput input = new ConnectApi.FeedItemInput();
			input.body = messageInput;

			// finally, post to the current user's feed
			ConnectApi.ChatterFeeds.postFeedItem(null, ConnectApi.FeedType.News, 'me', input, null);
		}
	}			
}