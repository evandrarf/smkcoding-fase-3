<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title inertia>{{ config('app.name', '') }}</title>
    <link rel="shortcut icon" href="/assets/logo.png" type="image/png">
    @routes

    @vite(["resources/js/app.js", "resources/css/app.css"])
    @inertiaHead

</head>

<body>
    @inertia
</body>

</html>