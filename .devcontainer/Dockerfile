# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use ubuntu-22.04 or ubuntu-18.04 on local arm64/Apple Silicon): ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

ARG FLUTTER_VERSION=3.3.8
ARG FLUTTER_CHANNEL=stable
ARG ANDROID_PLATFORM_VERSION=29
ARG USER="vscode"

#
# Android SDK (CLI Tools)
# https://developer.android.com/studio#downloads
ENV ANDROID_SDK_TOOLS_VERSION 9123335
ENV ANDROID_PLATFORM_VERSION 33
ENV ANDROID_BUILD_TOOLS_VERSION 33.0.1
ENV ANDROID_DOWNLOAD_URL=https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS_VERSION}_latest.zip
ENV ANDROID_HOME=/opt/android-sdk-linux
ENV ANDROID_SDK_ROOT="$ANDROID_HOME"
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/emulator

#
# Flutter SDK
# https://flutter.dev/docs/development/tools/sdk/releases?tab=linux
ENV FLUTTER_CHANNEL=stable
ENV FLUTTER_VERSION=3.3.9
ENV FLUTTER_DOWNLOAD_URL=https://storage.googleapis.com/flutter_infra_release/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz
ENV FLUTTER_HOME=/opt/flutter
ENV PATH=${PATH}:${FLUTTER_HOME}/bin:$HOME/.pub-cache/bin:/usr/local/go/bin


#
# Install packages and clean up.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y xz-utils \
    && apt-get install -y openjdk-11-jdk --no-install-recommends \
    # clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

#
# Android SDK	
RUN cd /opt \
	&& curl -C - --output android-sdk-tools.zip $ANDROID_DOWNLOAD_URL \
	&& mkdir -p ${ANDROID_HOME}/cmdline-tools/ \
	&& unzip -q android-sdk-tools.zip -d ${ANDROID_HOME}/cmdline-tools/ \
	&& rm android-sdk-tools.zip \
    && mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools/ ${ANDROID_HOME}/cmdline-tools/latest/ \
	&& yes | sdkmanager --licenses \
	&& sudo touch ${HOME}/.android/repositories.cfg \
	&& yes | sdkmanager platform-tools \
	&& yes | sdkmanager emulator \
	&& yes | sdkmanager "platforms;android-$ANDROID_PLATFORM_VERSION" "build-tools;$ANDROID_BUILD_TOOLS_VERSION" \
    && chown -R vscode ${ANDROID_HOME}

#
# Flutter SDK
RUN cd /opt \
    && curl -C - --output flutter.tar.xz $FLUTTER_DOWNLOAD_URL \
    && tar xf flutter.tar.xz -C . \
    && rm flutter.tar.xz \
    && git config --global --add safe.directory /opt/flutter \
    && yes | flutter doctor --android-licenses \
    && flutter config --no-analytics \
    && flutter update-packages \
    && chown -R vscode /opt/flutter