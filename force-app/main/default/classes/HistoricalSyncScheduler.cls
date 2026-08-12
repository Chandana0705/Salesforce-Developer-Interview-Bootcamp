global with sharing class HistoricalSyncScheduler
    implements Schedulable {

    global void execute(
        SchedulableContext sc
    ) {
        Database.executeBatch(
            new HistoricalSyncBatch(),
            25
        );
    }
}