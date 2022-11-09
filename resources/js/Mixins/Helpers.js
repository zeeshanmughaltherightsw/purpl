import moment from 'moment';
export default {
    methods: {
        formatDate(date){
            return moment(date).format("Do MMM YYYY"); 
        },

        formatDateTime(dateString) {
            return moment(dateString).format("Do MMM YYYY h:mm A");
        },
        formatCurrency(currency = 0){
            return parseInt(currency).toFixed(2)
        },
    }
} 