public with sharing class CertificationVerificationController {

    @AuraEnabled
    public static String verifyCertification(String certificationNumber) {

        if (String.isBlank(certificationNumber)) {
            throw new AuraHandledException(
                'Certification number is required.'
            );
        }

        HttpRequest request = new HttpRequest();

        request.setEndpoint(
            'callout:Recruitment_API/certifications/' +
            EncodingUtil.urlEncode(certificationNumber, 'UTF-8')
        );

        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');

        try {

            Http http = new Http();

            HttpResponse response = http.send(request);

            System.debug(
                'Certification Verification Status: ' +
                response.getStatusCode()
            );

            System.debug(
                'Certification Verification Response: ' +
                response.getBody()
            );

            if (response.getStatusCode() == 200) {
                return response.getBody();
            }

            if (response.getStatusCode() == 404) {
                throw new AuraHandledException(
                    'Certification not found.'
                );
            }

            if (response.getStatusCode() == 401) {
                throw new AuraHandledException(
                    'Authentication failed.'
                );
            }

            if (response.getStatusCode() == 403) {
                throw new AuraHandledException(
                    'Access forbidden.'
                );
            }

            throw new AuraHandledException(
                'External API returned status ' +
                response.getStatusCode()
            );

        } catch (AuraHandledException e) {

            throw e;

        } catch (Exception e) {

            System.debug(
                'Certification Verification Error: ' +
                e.getMessage()
            );

            throw new AuraHandledException(
                'Unable to verify certification: ' +
                e.getMessage()
            );
        }
    }
}