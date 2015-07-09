'use strict'

var gulp        = require('gulp')
  , bump        = require('gulp-bump')
  , filter      = require('gulp-filter')
  , git         = require('gulp-git')
  , purescript  = require('gulp-purescript')
  , run         = require('gulp-run')
  , runSequence = require('run-sequence')
  , tagVersion  = require('gulp-tag-version')
  ;

var paths =
    { src: 'src/**/*.purs'
    , bowerFFIJs: [ 'bower_components/purescript-*/src/**/*.js'
                  ]
    , bowerSrc: [ 'bower_components/purescript-*/src/**/*.purs'
                ]
    , dest: ''
    , docgen: { 'Optic.Core': 'docs/Optic/Core.md'
              , 'Optic.Getter': 'docs/Optic/Getter.md'
              , 'Optic.Internal.Prism': 'docs/Optic/Internal/Prism.md'
              , 'Optic.Internal.Setter': 'docs/Optic/Internal/Setter.md'
              , 'Optic.Laws.Lens': 'docs/Optic/Laws/Lens.md'
              , 'Optic.Lens': 'docs/Optic/Lens.md'
              , 'Optic.Prism': 'docs/Optic/Prism.md'
              , 'Optic.Setter': 'docs/Optic/Setter.md'
              , 'Optic.Types': 'docs/Optic/Types.md'
              }
    , outputJs: 'output/**/*.js'
    , test: 'test/**/*.purs'
    };

var options =
    { test: { main: 'Test.Main'
            }
    };

gulp.task('tag', function() {
    return gulp.src(['bower.json', 'package.json'])
        .pipe(git.commit('Update versions.'))
        .pipe(filter('bower.json'))
        .pipe(tagVersion());
});

// For whatever reason, these cannot be factored out...
gulp.task('bump-major', function() {
    return gulp.src(['bower.json', 'package.json'])
        .pipe(bump({type: 'major'}))
        .pipe(gulp.dest('./'));
});
gulp.task('bump-minor', function() {
    return gulp.src(['bower.json', 'package.json'])
        .pipe(bump({type: 'minor'}))
        .pipe(gulp.dest('./'));
});
gulp.task('bump-patch', function() {
    return gulp.src(['bower.json', 'package.json'])
        .pipe(bump({type: 'patch'}))
        .pipe(gulp.dest('./'));
});

gulp.task('psc', function() {
    return purescript.psc({
        src: paths.bowerSrc.concat(paths.src),
        ffi: paths.bowerFFIJs
    });
});

gulp.task('docs', function() {
    return purescript.pscDocs({
        src: paths.bowerSrc.concat(paths.src),
        docgen: paths.docgen
    });
});

gulp.task('test-compile', function() {
    return purescript.psc({
        src: paths.bowerSrc.concat(paths.src, paths.test),
        ffi: paths.bowerFFIJs
    });
});

gulp.task('test', ['test-compile'], function() {
    return purescript.pscBundle({
        src: paths.outputJs,
        main: options.test.main
    }).pipe(run('node'));
});

gulp.task('watch', function() {
    gulp.watch([paths.src, paths.test], function() {runSequence('psc', 'test', 'docs')});
});

gulp.task('default', function() {runSequence('psc', 'test', 'docs')});
