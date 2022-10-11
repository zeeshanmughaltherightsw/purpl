import moment from 'moment';
export default {
    methods: {
        formatDate(date){
            return moment(date).format("Do MMM YYYY"); 
        }
    }
}