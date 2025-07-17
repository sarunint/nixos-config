{ ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      jdk8 = prev.jdk8.overrideAttrs {
        postFixup = ''
          # Build the set of output library directories to rpath against
          LIBDIRS=""
          for output in "out jre"; do
            if [ "$output" = debug ]; then continue; fi
            LIBDIRS="$(find $(eval echo \$$output) -name \*.so\* -exec dirname {} \+ | sort | uniq | tr '\n' ':'):$LIBDIRS"
          done
          # Add the local library paths to remove dependencies on the bootstrap
          for output in $(getAllOutputNames); do
            if [ "$output" = debug ]; then continue; fi
            OUTPUTDIR=$(eval echo \$$output)
            BINLIBS=$(find $OUTPUTDIR/bin/ -type f; find $OUTPUTDIR -name \*.so\*)
            echo "$BINLIBS" | while read i; do
              patchelf --set-rpath "$LIBDIRS:$(patchelf --print-rpath "$i")" "$i" || true
              patchelf --shrink-rpath "$i" || true
            done
          done
      '';
      };
    })
  ];
}