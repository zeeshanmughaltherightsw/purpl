<template>
    <div class="card h-100">
        <div class="card-inner bg-purple rounded text-white">
            <div class="project">
                <div class="project-head">
                    <div class="project-info">
                        <h6 class="title">{{title}}</h6>
                    </div>
                </div>
                <div class="project-details">
                    <h4>{{content}}</h4>
                </div>
                <div class="project-meta">
                    <button class="btn btn-primary float-right">{{buttonText}} <em class="icon ni ni-arrow-right-round-fill"></em><span></span></button>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: ['title', 'content', 'buttonText']
}
</script>