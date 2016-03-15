## *io-vulkan* - Nim bindings for libusb, the API for access to graphics and
## compute on GPUs.
##
## This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
## See the file LICENSE included in this distribution for licensing details.
## GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

import vulkan

var appInfo = VkApplicationInfo(
  sType: VkStructureType.applicationInfo,
  pNext: nil,
  pApplicationName: "Instance Example",
  applicationVersion: 1,
  pEngineName: "Nimious",
  engineVersion: 1,
  apiVersion: vkMakeVersion(1, 0, 2))

var instanceCreateInfo = VkInstanceCreateInfo(
  sType: VkStructureType.instanceCreateInfo,
  pNext: nil,
  flags: 0,
  pApplicationInfo: addr appInfo,
  enabledLayerCount: 0,
  ppEnabledLayerNames: nil,
  enabledExtensionCount: 0,
  ppEnabledExtensionNames: nil)

# create an instance
var instance: VkInstance
var result = vkCreateInstance(addr instanceCreateInfo, nil, addr instance)
if result == VkResult.errorIncompatibleDriver:
  quit "Cannot find a compatible Vulkan ICD"
elif result != VkResult.success:
  quit "Failed to create instance: " & $result
else:
  echo "Success"

# clean up
vkDestroyInstance(instance, nil)
