public class OpportunityStage {
    
    public String currentId {get;set;}
    public List<OpportunityHistory> lstOpportunityHistory;
    
    public OpportunityStage(ApexPages.StandardController controller) {

        lstOpportunityHistory = new List<OpportunityHistory>();
        currentId=ApexPages.currentPage().getParameters().get('Id');  
    }
       
    public list<OpportunityHistory> getlstOpportunityHistory()
    {
        lstOpportunityHistory = [SELECT Opportunity.Id, StageName, CreatedDate FROM OpportunityHistory where Opportunity.Id=:currentId ORDER BY CreatedDate];
        return lstOpportunityHistory;
    }
}