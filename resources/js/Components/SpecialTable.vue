<template>
    <div class="table-responsive">
        <table class="table table-tranx">
            <thead>
                <tr class="tb-tnx-head">
                    <slot name="head" />
                </tr>
            </thead>
            <tbody>
                <slot name="body"/>
            </tbody>
        </table>
    </div>
</template>

<script>
export default {

}
</script>

<style>

</style>