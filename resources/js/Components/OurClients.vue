<template>
     <div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">{{testimonial}}</p>
                        <h1 class="display-5 mb-5">{{title}}</h1>
                        <p class="mb-4"> {{desec}} </p>
                        <a class="btn btn-primary py-3 px-4" href="">See More</a>
                    </div>
                    <div class="col-lg-7 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="owl-carousel testimonial-carousel">
                            <div class="testimonial-item">
                                <img class="img-fluid rounded mb-3" src="img/testimonial-1.jpg" alt="" />
                                <p class="fs-5">
                                    I am Clara White and I Love stone jewelry. Stonearn is the
                                    brand that completes my dream of wearing unique and rare stone jewelry in amazing designs.
                                </p>
                                <h4 class="mb-2">Calera White</h4>
                            </div>
                            <div class="testimonial-item">
                                <img class="img-fluid rounded mb-3" src="img/testimonial-2.jpg" alt="" />
                                <p class="fs-5">
                                  I am Richard Andreson. I love to know about stone mining and
                                    different kinds of precious stones that can only be possible
                                </p>
                                <h4>Richard Andreson</h4>
                            </div>
                        </div>
                    </div>
</template>
<script>
export default {
    props: ['testiimonial', 'title', 'image', 'desec','clientname', 'clientreview']
}
</script>
