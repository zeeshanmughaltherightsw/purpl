<template>
    <div class="table-responsive">
        <table class="table">
            <thead class="text-muted">
                <slot name="head"/>
            </thead>
            <tbody>
                <slot name="body"/>
            </tbody>
        </table>
    </div>
</template>