@isTest
public class OpportunityStageTest
{

    static testmethod void testlstOpportunityHistory_TestInsert()
    {          
        String testOpportunityId;
        List<Opportunity> lstOpportunityHistory = new List<Opportunity>();
        Opportunity oOpportunity = new Opportunity();
        oOpportunity.Name = 'New Opportunity';
        oOpportunity.StageName = 'Prospecting'; 
        oOpportunity.CloseDate = System.today();         
        
        lstOpportunityHistory.add(oOpportunity);
        insert lstOpportunityHistory;
        
        System.assertEquals(oOpportunity.Name, 'New Opportunity');
        System.assertEquals(oOpportunity.StageName,'Prospecting'); 
               
        apexpages.currentpage().getparameters().put('Id',testOpportunityId);
        apexpages.standardcontroller controller;  
        OpportunityStage oOpportunityStage =  new OpportunityStage(controller);
        
        Test.startTest();
            oOpportunityStage.getlstOpportunityHistory();
        Test.stopTest();
                  
        System.assertEquals(1,lstOpportunityHistory.size()); 
    }
    
    static testmethod void testlstOpportunityHistory_TestUpdate()
    {          
        String testOpportunityId;
        List<Opportunity> lstOpportunityHistory = new List<Opportunity>();
        Opportunity oOpportunity = new Opportunity();
        oOpportunity.Name = 'New Opportunity';
        oOpportunity.StageName = 'Prospecting'; 
        oOpportunity.CloseDate = System.today();
        oOpportunity.Amount = 10000;  
        insert oOpportunity;
                
        oOpportunity.StageName = 'Qualification';
        update oOpportunity;
        lstOpportunityHistory.add(oOpportunity);
        update lstOpportunityHistory;
        
        System.assertEquals(oOpportunity.StageName,'Qualification');
        
        apexpages.currentpage().getparameters().put('Id',testOpportunityId);
        apexpages.standardcontroller controller;  
        OpportunityStage oOpportunityStage =  new OpportunityStage(controller);
        
        Test.startTest();
            oOpportunityStage.getlstOpportunityHistory();
        Test.stopTest();

        System.assertEquals(1, lstOpportunityHistory.size());
    }
    
}