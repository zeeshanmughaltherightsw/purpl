<template>
    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
        <div class="service-item rounded d-flex h-100">
            <div class="service-img rounded">
                <img class="img-fluid" :src="image" alt="" />
            </div>
            <div class="service-text rounded p-5">
                <h4>{{title}}</h4>
                <p class="mb-5">
                    {{ description }}
                </p>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: ['title', 'image', 'description']
}
</script>