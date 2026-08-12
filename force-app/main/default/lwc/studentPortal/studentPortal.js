import { LightningElement } from 'lwc';

export default class StudentPortal extends LightningElement {

    handleProfileSaved() {

        const eligibleJobs =
            this.template.querySelector(
                'c-eligible-jobs'
            );

        if (eligibleJobs) {

            eligibleJobs.refreshJobs();

        }

    }
}