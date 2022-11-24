import moment from 'moment';
export default {
    methods: {
        formatDate(date){
            return moment(date).format("Do MMM YYYY"); 
        },

        formatDateTime(dateString) {
            console.log(dateString)
            return moment(dateString).format("Do MMM YYYY h:mm A");
        },
        formatCurrency(currency = 0){
            return parseInt(currency).toFixed(2)
        },
        
        getClass(status){
            if(status == 'active' || status == 1)
                return 'success';
            else if(status == 'inactive' || status == 'baned'){
                return 'danger';
            }
        }
    }
} 