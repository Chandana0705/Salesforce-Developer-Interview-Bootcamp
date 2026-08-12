import { LightningElement, wire } from 'lwc';

import getCurrentStudentId
    from '@salesforce/apex/StudentProfileController.getCurrentStudentId';

import { ShowToastEvent }
    from 'lightning/platformShowToastEvent';


export default class StudentProfile extends LightningElement {

    studentId;

    errorMessage = '';

    isLoading = true;


    @wire(getCurrentStudentId)
    wiredStudent({ data, error }) {

        this.isLoading = false;

        if (data) {

            this.studentId = data;
            this.errorMessage = '';

        } else if (error) {

            this.studentId = null;

            this.errorMessage =
                'Unable to load student profile.';

            console.error(error);
        }
    }


   handleSuccess() {

    this.dispatchEvent(
        new ShowToastEvent({
            title: 'Success',
            message: 'Profile updated successfully.',
            variant: 'success'
        })
    );

    this.dispatchEvent(
        new CustomEvent('profilesaved')
    );
}

    handleError(event) {

        this.errorMessage =
            event.detail?.message ||
            'Unable to update your profile.';

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: this.errorMessage,
                variant: 'error'
            })
        );
    }
}