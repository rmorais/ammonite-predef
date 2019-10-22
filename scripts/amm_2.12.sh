#!/usr/bin/env sh
test -e ~/.coursier/coursier || ( \
  mkdir -p ~/.coursier && \
  curl -Lso ~/.coursier/coursier https://git.io/vgvpD && \
  chmod +x ~/.coursier/coursier \
)

~/.coursier/coursier launch -q -P -M ammonite.Main \
  com.lihaoyi:ammonite_2.12.10:1.7.1 \
  org.typelevel:cats-core_2.12:2.0.0 \
  org.typelevel:cats-effect_2.12:2.0.0 \
  co.fs2:fs2-core_2.12:2.0.1 \
  -- --predef-code "\
        interp.configureCompiler(_.settings.YpartialUnification.value = true);\
      " < /dev/tty