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
    , bowerSrc: [ 'bower_components/purescript-*/src/**/*.purs'
                ]
    , dest: ''
    , docs: { 'Optic.*': { dest: 'src/Optic/README.md'
                         , src: 'src/Optic/*.purs'
                         }
            }
    , test: 'test/**/*.purs'
    };

var options =
    { test: { main: 'Test.Optic'
            }
    };

var compile = function(compiler, src, opts) {
    var psc = compiler(opts);
    psc.on('error', function(e) {
        console.error(e.message);
        psc.end();
    });
    return gulp.src(src.concat(paths.bowerSrc))
        .pipe(psc)
        .pipe(gulp.dest(paths.dest));
};

function docs (target) {
    return function() {
        var pscDocs = purescript.pscDocs();
        pscDocs.on('error', function(e) {
            console.error(e.message);
            pscDocs.end();
        });
        return gulp.src(paths.docs[target].src)
            .pipe(pscDocs)
            .pipe(gulp.dest(paths.docs[target].dest));
    }
}

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

gulp.task('make', function() {
    return compile(purescript.pscMake, [paths.src], {});
});

gulp.task('browser', function() {
    return compile(purescript.psc, [paths.src], {});
});

gulp.task('docs-Optic.*', docs('Optic.*'));

gulp.task('docs', ['docs-Optic.*']);

gulp.task('watch-browser', function() {
    gulp.watch(paths.src, function() {runSequence('browser', 'docs')});
});

gulp.task('watch-make', function() {
    gulp.watch(paths.src, function() {runSequence('make', 'docs')});
});

gulp.task('test', function() {
    return compile(purescript.psc, [paths.src, paths.test], options.test)
        .pipe(run('node').exec());
});

gulp.task('default', function() {runSequence('make', 'docs')});
