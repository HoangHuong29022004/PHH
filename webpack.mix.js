let mix = require('laravel-mix');

mix.js('docs/assets/js/common.js', 'docs/assets/js/compress-common.js');

mix.sass('docs/assets/sass/common.scss', 'docs/assets/css/common.css');

mix.sourceMaps();

mix.browserSync({
    server: './docs',
    files: [
        'docs/**/*.html',
        'docs/assets/css/**/*.css',
        'docs/assets/js/**/*.js'
    ]
}); 