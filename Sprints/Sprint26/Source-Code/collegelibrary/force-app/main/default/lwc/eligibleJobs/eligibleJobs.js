import { LightningElement, wire } from 'lwc';

import getEligibleJobs
    from '@salesforce/apex/EligibleJobsController.getEligibleJobs';

import submitApplication
    from '@salesforce/apex/ApplicationController.submitApplication';

import { ShowToastEvent }
    from 'lightning/platformShowToastEvent';


export default class EligibleJobs extends LightningElement {

    jobs = [];

    selectedJob = null;

    isLoading = true;

    errorMessage = '';

    // Job currently being submitted
    applyingJobId = null;

    // Successfully applied jobs
    appliedJobIds = [];


    @wire(getEligibleJobs)
    wiredJobs({ data, error }) {

        this.isLoading = false;

        if (data) {

            this.jobs = data;
            this.errorMessage = '';

        }

        if (error) {

            this.errorMessage =
                'Unable to load eligible jobs.';

            console.error(error);

        }
    }


    get displayJobs() {

        return this.jobs.map(job => ({

            ...job,

            isApplied:
                this.appliedJobIds.includes(job.Id),

            isSubmitting:
                this.applyingJobId === job.Id

        }));

    }


    get hasJobs() {

        return this.jobs.length > 0;

    }


    get hasError() {

        return this.errorMessage !== '';

    }


    // Receives View Details event from child
    handleViewDetails(event) {

        const jobId =
            event.detail.jobId;

        this.selectedJob =
            this.jobs.find(
                job => job.Id === jobId
            );

    }


    handleCloseDetails() {

        this.selectedJob = null;

    }


    // Receives Apply event from child
    async handleApply(event) {

        const jobId =
            event.detail.jobId;

        this.applyingJobId = jobId;


        try {

            const applicationId =
                await submitApplication({
                    jobId: jobId
                });


            // Mark job as successfully applied
            this.appliedJobIds = [
                ...this.appliedJobIds,
                jobId
            ];


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


            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Application Failed',
                    message: message,
                    variant: 'error'
                })
            );


            console.error(error);


        } finally {

            this.applyingJobId = null;

        }

    }

}