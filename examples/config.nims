switch("debugger", "native")
switch("path", "../src")

when defined(windows):
  switch("passL", r"-Lc:\VulkanSDK\1.0.5.0\Bin")
  switch("passL", "-lvulkan-1")
