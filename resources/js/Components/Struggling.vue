<template>
     <div class="card">
        <div class="nk-ecwg nk-ecwg6">
            <div class="card-inner">
                <div class="card-title-group">
                    <div class="card-title">
                        <h5 class="title text-primary border-bottom font-weight-bold">Struggling</h5>
                    </div>
                </div>
                <div class="data">
                   <Table>
                        <template #head>
                            <tr>
                                <th>Joining date</th>
                                <th>Last login</th>
                                <th>Membership type</th>
                                <th>Upgrade Expires</th>
                            </tr>
                        </template>
                        <template #body>
                            <tr>
                                <td>{{ formatDate(user.created_at) }}</td>
                                <td>{{user ? user.created_at: '' }}</td>
                                <td>{{ user.created_at }}</td>
                                <td>{{ user.created_at }}</td>
                            </tr>
                        </template>
                   </Table>
                </div>
            </div><!-- .card-inner -->
        </div><!-- .nk-ecwg -->
    </div><!-- .card -->
</template>
<script>
import Table from '@/Components/BasicTable.vue'
import Helpers from '@/Mixins/Helpers'
export default {
    props: ['users'],
    components: { Table },
    data(){
        return {
            user: this.$page.props.auth.user
        }
    },
    mixins: [Helpers]
}
</script>
