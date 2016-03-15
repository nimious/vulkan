## *io-vulkan* - Nim bindings for libusb, the API for access to graphics and
## compute on GPUs.
##
## This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
## See the file LICENSE included in this distribution for licensing details.
## GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

import strutils, vulkan

let major = vkApiVersion shr 22
let minor = (vkApiVersion shr 12) and 0x3ff
let patch = vkApiVersion and 0xfff

echo "Vulkan API Version: $#.$#.$#\n" % [$major, $minor, $patch]
