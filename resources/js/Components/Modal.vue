<template>
    
    <div
        class="modal fade"
        tabindex="-1"
        id="genericModal"
        aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{ title }}</h5>
                    <a
                        href="#"
                        class="close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                        @click="close"
                        ><em class="icon ni ni-cross"></em
                    ></a>
                </div>
                <div class="modal-body">
                    <slot/>
                </div>
                <div class="modal-footer bg-light">
                    <slot name="footer" />
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default{ 
        props: ['title'],
        methods: {
            close(){
                JQuery.noConflict();
                $("#genericModal").modal('hide');
            }
        },
        mounted(){
            // NioApp.BS.init()
        },
    }
</script>