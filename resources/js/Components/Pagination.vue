<template>
    <div v-if="meta.data.length > 0" class="d-flex px-4 justify-content-between mt-3 pb-1 pagination-container align-items-center border">
        <div>
            <p class="text-muted">
                Showing
                <span class="font-medium">{{meta.from}}</span>
                    to
                <span class="font-medium">{{meta.to}}</span>
                    of
                <span class="font-medium">{{meta.total}}</span>
                results
            </p>
        </div>
        <nav>
            <ul class="pagination pagination-sm">
                <div v-for="(link, index) in meta.links.slice(0,6)" :key="index">
                    <li class="paginate_button page-item" :class="{'active' : link.active }">
                        <Link v-if="link.url !== null"
                            class="page-link" :href="pageUrl(link.url)"
                            v-html="link.label">
                        </Link>
                        <a v-else class="page-link" v-html="link.label"></a>
                    </li>
                </div>
                <div v-if="meta.links.length >= 5" >
                    <li class="page-item">
                        <span class="page-link">
                            <em class="icon ni ni-more-h"></em>
                        </span>
                    </li>
                </div>
                <div v-if="meta.links.length >= 5">
                    <li  class="paginate_button page-item" :class="{ 'active' : meta.current_page == meta.last_page}">
                        <Link v-if="meta.last_page_url"
                            class="page-link" :href="pageUrl(meta.last_page_url)"
                            v-html="'Last'">
                        </Link>
                    </li>
                </div>
            </ul>
        </nav>
    </div>
</template>

<script>
    import { Link } from '@inertiajs/inertia-vue3';
    export default {
        name: "Pagination",
        props: ['meta', 'keyword', 'selectedFilters', 'callType', 'orderFrom', 'orderTo'],
        components: {
            Link
        },
        data() {
            return {
                selectedFilterData: this.selectedFilters ? this.selectedFilters : null,
            }
        },
        mounted(){
        },
        methods : {
            pageUrl(url) {
                let searchedKeyword =  this.keyword ? '&keyword=' + this.keyword : ''
                
                // switch (this.callType) {
                //     case 'products':
                //         return url + searchedKeyword + order + status + barMinValue + barMaxValue
                //     case 'business':
                //         return url + searchedKeyword + order + status + reviewRating + sortByOrder
                //     case 'order':
                //         return url + searchedKeyword + order + orderType + orderStatus + orderFrom + orderTo
                //     default:
                        return url + searchedKeyword
                // }
            }
        },
    }

</script>

<style scoped></style>
