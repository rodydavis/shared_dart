# Use Google's official Dart image.
# https://hub.docker.com/r/google/dart-runtime/
# FROM google/dart-runtime
FROM cirrusci/flutter:latest

RUN flutter doctor -v
RUN flutter channel dev
RUN flutter upgrade
