'use strict'

var gulp        = require('gulp')
  , purescript  = require('gulp-purescript')
  , runSequence = require('run-sequence')
  ;

var paths = {
    src: 'src/**/*.purs',
    bowerSrc: [
      'bower_components/purescript-*/src/**/*.purs',
      'bower_components/purescript-*/src/**/*.purs.hs'
    ],
    dest: '',
    docs: {
        'Control.Lens': {
            dest: 'src/Control/README.md',
            src: 'src/Control/Lens.purs'
        },
        'Control.Lens.*': {
            dest: 'src/Control/Lens/README.md',
            src: 'src/Control/Lens/*.purs'
        }
    }
};

var options = {};

var compile = function(compiler) {
    var psc = compiler(options);
    psc.on('error', function(e) {
        console.error(e.message);
        psc.end();
    });
    return gulp.src([paths.src].concat(paths.bowerSrc))
        .pipe(psc)
        .pipe(gulp.dest(paths.dest));
};

function docs (target) {
    return function() {
        return gulp.src(paths.docs[target].src)
            .pipe(purescript.docgen())
            .pipe(gulp.dest(paths.docs[target].dest));
    }
}

gulp.task('make', function() {
    return compile(purescript.pscMake);
});

gulp.task('browser', function() {
    return compile(purescript.psc);
});

gulp.task('docs-Control.Lens', docs('Control.Lens'));
gulp.task('docs-Control.Lens.*', docs('Control.Lens.*'));

gulp.task('docs', ['docs-Control.Lens', 'docs-Control.Lens.*']);

gulp.task('watch-browser', function() {
    gulp.watch(paths.src, function() {runSequence('browser', 'docs')});
});

gulp.task('watch-make', function() {
    gulp.watch(paths.src, function() {runSequence('make', 'docs')});
});

gulp.task('default', function() {runSequence('make', 'docs')});
