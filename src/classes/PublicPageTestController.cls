public with sharing class PublicPageTestController {
	public String objectId {get;set;}
	
	public PublicPageTestController () {
		objectId = ApexPages.currentPage().getParameters().get('objectId');
	}
	public void InitPage() {
		List<Account> accountList = [SELECT Id, Receive_Newsletter__c, Test_Date__c FROM Account WHERE Id=:objectId LIMIT 1];
		if(!accountList.IsEmpty()){
			Date myDate = Date.newInstance(1960, 2, 17);
			accountList[0].Test_Date__c = myDate;
			accountList[0].Receive_Newsletter__c = false;
			update accountList[0];
		}
	}
}