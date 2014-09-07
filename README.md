SF1Utils
========

Salesforce1 Utilities

Instructions
============

To access all functionality, install the managed package available at:

https://login.salesforce.com/packaging/installPackage.apexp?p0=04ti0000000LJ60

Take Ownership
==============

(For more information see the introductory blog post at : http://bobbuzz.me.uk/1y7QmeU)

If you haven't already, enable chatter and turn on feed tracking for leads and cases.
Edit the page layouts for lead and case, and add the Take Ownership publisher action.
Open the Salesforce1 application and take ownership of whatever records you are interested in.

Notifications
=============

(For more information see the blog post at: http://bobbuzz.me.uk/1nE4tSv)

If you haven't already, enable chatter.
Notify a user from Apex, executing code similar to the following:
```
User notifyUser=[select id from User where username like 'keir.chatter%'];
MentionUtils.NotifyUser(notifyUser.id, ' Test Notification');
```
