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
        
        getClass(status){
            if(status == 'active' || status == 1)
                return 'success';
            else if(status == 'inactive' || status == 'baned'){
                return 'danger';
            }
        },
        // generic function to get images
        getImage(path, isSaved = true, type = 'avatar', isExternal = 0) {
            const baseUrl = window.location.protocol + "//" + window.location.host
            if (isExternal) {
                return path
            } else {
                return this.$page.props.ziggy.url + '/storage/' + path
            }
            
        },
    }
} 