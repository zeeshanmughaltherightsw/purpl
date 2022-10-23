 <template>
    <div class="col-lg-4 wow fadeIn" data-wow-delay="0.1s">
        <div class="bg-white shadow d-flex align-items-center h-100 px-5" style="min-height: 160px;">
            <div class="d-flex">
                <div class="flex-shrink-0 btn-lg-square rounded-circle bg-light">
                    <i :class="icon"></i>
                </div>
                
                <div class="ps-3">
                    <h4>{{ title }}</h4>
                    <span></span>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: ['icon', 'title']
}
</script> 
