import { LightningElement } from 'lwc';
import verifyCertification from '@salesforce/apex/CertificationVerificationController.verifyCertification';

export default class CertificationVerification extends LightningElement {

    certificationNumber = '';
    result = '';
    errorMessage = '';
    isLoading = false;

    handleChange(event) {
        this.certificationNumber = event.target.value;
        this.result = '';
        this.errorMessage = '';
    }

    async handleVerify() {

        this.result = '';
        this.errorMessage = '';

        if (!this.certificationNumber) {
            this.errorMessage = 'Please enter a certification number.';
            return;
        }

        this.isLoading = true;

        try {

            const response = await verifyCertification({
                certificationNumber: this.certificationNumber
            });

            this.result = response;

        } catch (error) {

            this.errorMessage =
                error?.body?.message ||
                'Unable to verify certification.';

        } finally {

            this.isLoading = false;
        }
    }
}