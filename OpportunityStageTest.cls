@isTest
public class OpportunityStageTest
{

    static testmethod void testlstOpportunityHistory_testInsert()
    {          
        String testOpportunityId;
        List<Opportunity> lstOpportunityHistory = new List<Opportunity>();
        List<OpportunityHistory>  OpportunityHistoryRecord= new List<OpportunityHistory>();
        Opportunity oOpportunity = new Opportunity();
        oOpportunity.Name = 'New Opportunity';
        oOpportunity.StageName = 'Prospecting'; 
        oOpportunity.CloseDate = System.today();         
        lstOpportunityHistory.add(oOpportunity);
        insert lstOpportunityHistory;
        
        System.debug(lstOpportunityHistory);
        apexpages.currentpage().getparameters().put('Id',testOpportunityId);
        apexpages.standardcontroller controller;  
        
        Test.startTest();
            OpportunityStage oOpportunityStage =  new OpportunityStage(controller);
            OpportunityHistoryRecord= oOpportunityStage.getlstOpportunityHistory();
         Test.stopTest();
                  
         System.assertEquals(oOpportunity.Name, 'New Opportunity');
         System.assertEquals(oOpportunity.StageName,'Prospecting');   
    }
    
    static testmethod void testlstOpportunityHistory_TestUpdate()
    {          
        String testOpportunityId;
        List<Opportunity> lstOpportunityHistory = new List<Opportunity>();
        List<OpportunityHistory>  OpportunityHistoryRecord= new List<OpportunityHistory>();
        Opportunity oOpportunity = new Opportunity();
        oOpportunity.Name = 'New Opportunity';
        oOpportunity.StageName = 'Prospecting'; 
        oOpportunity.CloseDate = System.today();         
        lstOpportunityHistory.add(oOpportunity);
        insert lstOpportunityHistory;
        
        oOpportunity.StageName = 'Qualification';
        oOpportunity.Amount = 10000;
        lstOpportunityHistory.add(oOpportunity);
        
        Test.startTest();
            update lstOpportunityHistory;
        Test.stopTest();
        
        System.debug(lstOpportunityHistory);
        apexpages.currentpage().getparameters().put('Id',testOpportunityId);
        apexpages.standardcontroller controller;  
        
        //Test.startTest();
            OpportunityStage oOpportunityStage =  new OpportunityStage(controller);
            OpportunityHistoryRecord= oOpportunityStage.getlstOpportunityHistory();
        //Test.stopTest();
        
         System.assertEquals(oOpportunity.Name,'Qualification');
         System.assertEquals(2, lstOpportunityHistory.size());
    }

}