## *vulkan* - Nim bindings for libusb, the API for access to graphics and
## compute on GPUs.
##
## This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
## See the file LICENSE included in this distribution for licensing details.
## GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

import strutils, vulkan

let major = vkApiVersion10 shr 22
let minor = (vkApiVersion10 shr 12) and 0x3ff
let patch = vkApiVersion10 and 0xfff

echo "Vulkan API Version: $#.$#.$#" % [$major, $minor, $patch]
echo "Vulkan Header Version: $#" % [$vkHeaderVersion]
