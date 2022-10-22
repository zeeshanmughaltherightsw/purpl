import moment from 'moment';
export default {
    methods: {
        formatDate(date){
            return moment(date).format("Do MMM YYYY"); 
        },

        formatDateTime(dateTime){
            return moment(dateTime).format("Do MMM YYYY HH:mm:ss"); 
        }
    }
} 