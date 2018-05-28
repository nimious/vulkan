switch("debugger", "native")
switch("path", "../src")

when defined(windows):
  switch("passL", r"-Lc:\VulkanSDK\1.0.61.1\Lib")
  switch("passL", "-lvulkan-1")
elif defined(linux):
  switch("passL", r"/usr/lib/libvulkan.so.1")
