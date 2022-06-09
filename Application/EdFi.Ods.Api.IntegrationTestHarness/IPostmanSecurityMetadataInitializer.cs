namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public interface IPostmanSecurityMetadataInitializer
    {
        void LoadRecordOwnershipData();

        void LoadMultipleAuthorizationStrategyData();
    }
}
