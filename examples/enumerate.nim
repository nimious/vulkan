## *vulkan* - Nim bindings for libusb, the API for access to graphics and
## compute on GPUs.
##
## This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
## See the file LICENSE included in this distribution for licensing details.
## GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

import vulkan

var appInfo = VkApplicationInfo(
  sType: VkStructureType.applicationInfo,
  pNext: nil,
  pApplicationName: "Enumerate Example",
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
if result != VkResult.success:
  quit "Failed to create instance: " & $result

# get number of physical devices
var deviceCount: uint32
result = vkEnumeratePhysicalDevices(instance, addr deviceCount, nil)
if result != VkResult.success:
  quit "Failed to get physical device count: " & $result
if deviceCount == 0:
  quit "Didn't find any devices"

# get devices
var devices = newSeq[VkPhysicalDevice](deviceCount)
result = vkEnumeratePhysicalDevices(instance, addr deviceCount, addr devices[0])
if result != VkResult.success:
  quit "Failed to get devices: " & $result

# print device info
for d in devices:
  var deviceProperties: VkPhysicalDeviceProperties
  vkGetPhysicalDeviceProperties(d, addr deviceProperties)
  echo $deviceProperties.deviceName & " (" & $deviceProperties.deviceType & ")"

# clean up
vkDestroyInstance(instance, nil)
