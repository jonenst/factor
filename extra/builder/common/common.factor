
USING: kernel namespaces sequences splitting
       io io.files io.launcher io.encodings.utf8 prettyprint
       vars builder.util ;

IN: builder.common

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SYMBOL: builds-dir

: builds ( -- path )
  builds-dir get
  home "/builds" append
  or ;

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

VAR: stamp

: builds/factor ( -- path ) builds "factor" append-path ;
: build-dir     ( -- path ) builds stamp>   append-path ;

: create-build-dir ( -- )
  datestamp >stamp
  build-dir make-directory ;
  
: enter-build-dir  ( -- ) build-dir set-current-directory ;

: clone-builds-factor ( -- )
  { "git" "clone" builds/factor } to-strings try-process ;

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

: prepare-build-machine ( -- )
  builds make-directory
  builds
    [ { "git" "clone" "git://factorcode.org/git/factor.git" } try-process ]
  with-directory ;

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

: builds-check ( -- ) builds exists? not [ prepare-build-machine ] when ;

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SYMBOL: status-vm
SYMBOL: status-boot
SYMBOL: status-test
SYMBOL: status-build
SYMBOL: status-release
SYMBOL: status

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

: reset-status ( -- )
  { status-vm status-boot status-test status-build status-release status }
    [ off ]
  each ;

! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SYMBOL: upload-to-factorcode

