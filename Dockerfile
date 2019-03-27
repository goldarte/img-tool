#
# Dockerfile – os & toolchain for image-chroot.sh & image-resize.sh
# Copyright 2018 Artem B. Smirnov
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM debian

ENV DEBIAN_FRONTEND 'noninteractive'
ENV LANG 'C.UTF-8'
ENV LC_ALL 'C.UTF-8'

RUN apt-get update
RUN apt-get install -y --no-install-recommends bc jq unzip wget parted apt-utils git ca-certificates gawk lsof gcc libc-dev libcap2-bin
RUN apt-get clean

COPY ./src /usr/src/
COPY ./qemu-arm-static /usr/share/
COPY ./img-resize /usr/sbin/
COPY ./img-chroot /usr/sbin/

RUN gcc -static /usr/src/qemu-wrapper.c -O3 -s -o /usr/share/qemu-wrapper

WORKDIR /mnt
CMD ./builder/image-build.sh
