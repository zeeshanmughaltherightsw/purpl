<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title inertia>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.bunny.net/css2?family=Nunito:wght@400;600;700&display=swap">
        <!-- Styles -->
        <link rel="stylesheet" href="{{ mix('css/app.css') }}">

        <!-- Scripts -->
        @routes
        @inertiaHead
    </head>
    <body class="nk-body bg-lighter npc-default has-sidebar">
        @inertia
        
        <script src="{{ mix('js/app.js') }}"></script>
        <script src="{{ mix('js/theme.js') }}"></script>
        @env ('local')
            {{-- <script src="http://localhost:8080/js/bundle.js"></script> --}}
            <script src="http://localhost:3000/browser-sync/browser-sync-client.js"></script>
        @endenv
    </body>
</html>
