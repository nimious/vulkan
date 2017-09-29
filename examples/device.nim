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
  pApplicationName: "Create Device Example",
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

# get queues of first device
var queueCount: uint32
vkGetPhysicalDeviceQueueFamilyProperties(devices[0], addr queueCount, nil)
if queueCount == 0:
  quit "First device doesn't have any queues"

# get queue properties
var queueProps = newSeq[VkQueueFamilyProperties](queueCount)
vkGetPhysicalDeviceQueueFamilyProperties(devices[0], addr queueCount,
  addr queueProps[0])
if queueCount == 0:
  quit "Failed to get queue properties"

# find a graphics queue
var queueIndex = -1
for i in 0 .. <int(queueCount):
  if (queueProps[i].queueFlags and ord(VkQueueFlagBits.graphics)) != 0:
    queueIndex = i
    break
if queueIndex == -1:
  quit "Failed to find graphics queue"

# create device
var queuePriorities = [0.0f]
var queueInfo = VkDeviceQueueCreateInfo(
  sType: VkStructureType.deviceQueueCreateInfo,
  pNext: nil,
  queueCount: 1,
  pQueuePriorities: addr queuePriorities[0])
var deviceInfo = VkDeviceCreateInfo(
  sType: VkStructureType.deviceCreateInfo,
  pNext: nil,
  queueCreateInfoCount: 1,
  pQueueCreateInfos: addr queueInfo,
  enabledExtensionCount: 0,
  ppEnabledExtensionNames: nil,
  enabledLayerCount: 0,
  ppEnabledLayerNames: nil,
  pEnabledFeatures: nil)
var device: VkDevice
result = vkCreateDevice(devices[0], addr deviceInfo, nil, addr device)
if result != VkResult.success:
  quit "Failed to create device"

echo "Success"

# clean up
vkDestroyDevice(device, nil)
vkDestroyInstance(instance, nil)
