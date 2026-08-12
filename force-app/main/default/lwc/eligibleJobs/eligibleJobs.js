import { LightningElement, wire ,api} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getEligibleJobs
    from '@salesforce/apex/EligibleJobsController.getEligibleJobs';

import submitApplication
    from '@salesforce/apex/ApplicationController.submitApplication';

import { ShowToastEvent }
    from 'lightning/platformShowToastEvent';


export default class EligibleJobs extends LightningElement {

    // Jobs retrieved from Salesforce
    jobs = [];

    // Job currently selected for viewing
    selectedJob = null;

    // Loading state
    isLoading = true;

    // Error message
    errorMessage = '';

    // Job currently being submitted
    applyingJobId = null;

    // Successfully applied jobs
    appliedJobIds = [];


    // Retrieve eligible jobs
  wiredJobsResult;

@wire(getEligibleJobs)
wiredJobs(result) {

    this.wiredJobsResult = result;

    const { data, error } = result;

    this.isLoading = false;

    if (data) {

        this.jobs = data;
        this.errorMessage = '';

    } else if (error) {

        this.jobs = [];

        this.errorMessage =
            'Unable to load eligible jobs.';

        console.error(error);

    }
}
@api
async refreshJobs() {

    this.isLoading = true;

    try {

        await refreshApex(this.wiredJobsResult);

    } catch (error) {

        this.errorMessage =
            'Unable to refresh eligible jobs.';

        console.error(error);

    } finally {

        this.isLoading = false;

    }
}
    // Adds UI-related information to each job
    get displayJobs() {

        return this.jobs.map(job => ({

            ...job,

            isApplied:
                this.appliedJobIds.includes(job.Id),

            isSubmitting:
                this.applyingJobId === job.Id

        }));

    }


    // Checks whether jobs are available
    get hasJobs() {

        return this.jobs.length > 0;

    }


    // Checks whether an error exists
    get hasError() {

        return this.errorMessage !== '';

    }


    // ----------------------------------------------------
    // CHILD → PARENT : viewdetails
    // ----------------------------------------------------

    handleViewDetails(event) {

        // Receive only the information sent by JobCard
        const jobId = event.detail.jobId;

        // Parent decides what to do with that information
        this.selectedJob =
            this.jobs.find(
                job => job.Id === jobId
            );
    }


    // Close the selected job details
    handleCloseDetails() {

        this.selectedJob = null;

    }


    // ----------------------------------------------------
    // CHILD → PARENT : apply
    // ----------------------------------------------------

    async handleApply(event) {

        // Receive jobId from JobCard
        const jobId = event.detail.jobId;

        // Parent controls the submission state
        this.applyingJobId = jobId;


        try {

            // Parent performs the actual business operation
            const applicationId =
                await submitApplication({
                    jobId: jobId
                });


            // Mark this job as successfully applied
            this.appliedJobIds = [
                ...this.appliedJobIds,
                jobId
            ];


            // Inform the user that the operation succeeded
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message:
                        'Application submitted successfully.',
                    variant: 'success'
                })
            );


            console.log(
                'Application Id:',
                applicationId
            );


        } catch (error) {

            let message =
                'Unable to submit application.';


            if (
                error.body &&
                error.body.message
            ) {

                message =
                    error.body.message;

            }


            // Inform the user that the operation failed
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Application Failed',
                    message: message,
                    variant: 'error'
                })
            );


            console.error(error);


        } finally {

            // Stop the submitting state
            this.applyingJobId = null;

        }

    }

}