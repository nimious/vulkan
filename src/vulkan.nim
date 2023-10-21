## *vulkan* - Nim bindings for Vulkan, the API for access to graphics and
## compute on GPUs.
##
## This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
## See the file LICENSE included in this distribution for licensing details.
## GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

{.deadCodeElim: on.}


when not (defined(android) or defined(linux) or defined(windows) or defined(macosx)):
  {.error: "vulkan does not support this platform".}


const
  vkVersion10* = 1

template vkMakeVersion*(major, minor, patch: untyped): untyped =
  (((major) shl 22) or ((minor) shl 12) or (patch))

const
  vkApiVersion10* = vkMakeVersion(1, 0, 0) ##  Patch version should always be set to 0

template vkVersionMajor*(version: untyped): untyped =
  ((uint32)(version) shr 22)

template vkVersionMinor*(version: untyped): untyped =
  (((uint32)(version) shr 12) and 0x000003FF)

template vkVersionPatch*(version: untyped): untyped =
  ((uint32)(version) and 0x00000FFF)

##  Version of this file

const
  vkHeaderVersion* = 61
  vkNullHandle* = 0

type
  VkHandle* = int64
  VkNonDispatchableHandle* = int64

type
  VkFlags* = uint32
  VkBool32* = uint32
  VkDeviceSize* = uint64
  VkSampleMask* = uint32

type
  VkInstance* = VkHandle
  VkPhysicalDevice* = VkHandle
  VkDevice* = VkHandle
  VkQueue* = VkHandle
  VkSemaphore* = VkNonDispatchableHandle
  VkCommandBuffer* = VkHandle
  VkFence* = VkNonDispatchableHandle
  VkDeviceMemory* = VkNonDispatchableHandle
  VkBuffer* = VkNonDispatchableHandle
  VkImage* = VkNonDispatchableHandle
  VkEvent* = VkNonDispatchableHandle
  VkQueryPool* = VkNonDispatchableHandle
  VkBufferView* = VkNonDispatchableHandle
  VkImageView* = VkNonDispatchableHandle
  VkShaderModule* = VkNonDispatchableHandle
  VkPipelineCache* = VkNonDispatchableHandle
  VkPipelineLayout* = VkNonDispatchableHandle
  VkRenderPass* = VkNonDispatchableHandle
  VkPipeline* = VkNonDispatchableHandle
  VkDescriptorSetLayout* = VkNonDispatchableHandle
  VkSampler* = VkNonDispatchableHandle
  VkDescriptorPool* = VkNonDispatchableHandle
  VkDescriptorSet* = VkNonDispatchableHandle
  VkFramebuffer* = VkNonDispatchableHandle
  VkCommandPool* = VkNonDispatchableHandle

const
  vkLodClampNone* = 1000.0
  vkRemainingMipLevels* = (not 0)
  vkRemainingArrayLayers* = (not 0)
  vkWholeSize* = (not 0)
  vkAttachmentUnused* = (not 0)
  vkTrue* = 1
  vkFalse* = 0
  vkQueueFamilyIgnored* = (not 0)
  vkSubpassExternal* = 0xffffffff'u32
  vkMaxPhysicalDeviceNameSize* = 256
  vkUuidSize* = 16
  vkMaxMemoryTypes* = 32
  vkMaxMemoryHeaps* = 16
  vkMaxExtensionNameSize* = 256
  vkMaxDescriptionSize* = 256

type
  VkPipelineCacheHeaderVersion* {.pure, size: sizeof(cint).} = enum
    one = 1

  VkResult* {.pure, size: sizeof(cint).} = enum
    errorInvalidExternalHandleKhr = - 1000072003,
    errorOutOfPoolMemoryKhr = - 1000069000,
    errorInvalidShaderNv = - 1000012000,
    errorValidationFailedExt = - 1000011001,
    errorIncompatibleDisplayKhr = - 1000003001,
    errorOutOfDateKhr = - 1000001004,
    errorNativeWindowInUseKhr = - 1000000001,
    errorSurfaceLostKhr = - 1000000000,
    errorFragmentedPool = - 12,
    errorFormatNotSupported = - 11,
    errorTooManyObjects = - 10,
    errorIncompatibleDriver = - 9,
    errorFeatureNotPresent = - 8,
    errorExtensionNotPresent = - 7,
    errorLayerNotPresent = - 6,
    errorMemoryMapFailed = - 5,
    errorDeviceLost = - 4,
    errorInitializationFailed = - 3,
    errorOutOfDeviceMemory = - 2,
    errorOutOfHostMemory = - 1,
    success = 0,
    notReady = 1,
    timeout = 2,
    eventSet = 3,
    eventReset = 4,
    incomplete = 5,
    suboptimalKhr = 1000001003,

  VkStructureType* {.pure, size: sizeof(cint).} = enum
    applicationInfo = 0,
    instanceCreateInfo = 1,
    deviceQueueCreateInfo = 2,
    deviceCreateInfo = 3,
    submitInfo = 4,
    memoryAllocateInfo = 5,
    mappedMemoryRange = 6,
    bindSparseInfo = 7,
    fenceCreateInfo = 8,
    semaphoreCreateInfo = 9,
    eventCreateInfo = 10,
    queryPoolCreateInfo = 11,
    bufferCreateInfo = 12,
    bufferViewCreateInfo = 13,
    imageCreateInfo = 14,
    imageViewCreateInfo = 15,
    shaderModuleCreateInfo = 16,
    pipelineCacheCreateInfo = 17,
    pipelineShaderStageCreateInfo = 18,
    pipelineVertexInputStateCreateInfo = 19,
    pipelineInputAssemblyStateCreateInfo = 20,
    pipelineTessellationStateCreateInfo = 21,
    pipelineViewportStateCreateInfo = 22,
    pipelineRasterizationStateCreateInfo = 23,
    pipelineMultisampleStateCreateInfo = 24,
    pipelineDepthStencilStateCreateInfo = 25,
    pipelineColorBlendStateCreateInfo = 26,
    pipelineDynamicStateCreateInfo = 27,
    graphicsPipelineCreateInfo = 28,
    computePipelineCreateInfo = 29,
    pipelineLayoutCreateInfo = 30,
    samplerCreateInfo = 31,
    descriptorSetLayoutCreateInfo = 32,
    descriptorPoolCreateInfo = 33,
    descriptorSetAllocateInfo = 34,
    writeDescriptorSet = 35,
    copyDescriptorSet = 36,
    framebufferCreateInfo = 37,
    renderPassCreateInfo = 38,
    commandPoolCreateInfo = 39,
    commandBufferAllocateInfo = 40,
    commandBufferInheritanceInfo = 41,
    commandBufferBeginInfo = 42,
    renderPassBeginInfo = 43,
    bufferMemoryBarrier = 44,
    imageMemoryBarrier = 45,
    memoryBarrier = 46,
    loaderInstanceCreateInfo = 47,
    loaderDeviceCreateInfo = 48,
    swapchainCreateInfoKhr = 1000001000,
    presentInfoKhr = 1000001001,
    displayModeCreateInfoKhr = 1000002000,
    displaySurfaceCreateInfoKhr = 1000002001,
    displayPresentInfoKhr = 1000003000,
    xlibSurfaceCreateInfoKhr = 1000004000,
    xcbSurfaceCreateInfoKhr = 1000005000,
    waylandSurfaceCreateInfoKhr = 1000006000,
    mirSurfaceCreateInfoKhr = 1000007000,
    androidSurfaceCreateInfoKhr = 1000008000,
    win32SurfaceCreateInfoKhr = 1000009000,
    debugReportCallbackCreateInfoExt = 1000011000,
    pipelineRasterizationStateRasterizationOrderAmd = 1000018000,
    debugMarkerObjectNameInfoExt = 1000022000,
    debugMarkerObjectTagInfoExt = 1000022001,
    debugMarkerMarkerInfoExt = 1000022002,
    dedicatedAllocationImageCreateInfoNv = 1000026000,
    dedicatedAllocationBufferCreateInfoNv = 1000026001,
    dedicatedAllocationMemoryAllocateInfoNv = 1000026002,
    textureLodGatherFormatPropertiesAmd = 1000041000,
    renderPassMultiviewCreateInfoKhx = 1000053000,
    physicalDeviceMultiviewFeaturesKhx = 1000053001,
    physicalDeviceMultiviewPropertiesKhx = 1000053002,
    externalMemoryImageCreateInfoNv = 1000056000,
    exportMemoryAllocateInfoNv = 1000056001,
    importMemoryWin32HandleInfoNv = 1000057000,
    exportMemoryWin32HandleInfoNv = 1000057001,
    win32KeyedMutexAcquireReleaseInfoNv = 1000058000,
    physicalDeviceFeatures2Khr = 1000059000,
    physicalDeviceProperties2Khr = 1000059001,
    formatProperties2Khr = 1000059002,
    imageFormatProperties2Khr = 1000059003,
    physicalDeviceImageFormatInfo2Khr = 1000059004,
    queueFamilyProperties2Khr = 1000059005,
    physicalDeviceMemoryProperties2Khr = 1000059006,
    sparseImageFormatProperties2Khr = 1000059007,
    physicalDeviceSparseImageFormatInfo2Khr = 1000059008,
    memoryAllocateFlagsInfoKhx = 1000060000,
    deviceGroupRenderPassBeginInfoKhx = 1000060003,
    deviceGroupCommandBufferBeginInfoKhx = 1000060004,
    deviceGroupSubmitInfoKhx = 1000060005,
    deviceGroupBindSparseInfoKhx = 1000060006,
    deviceGroupPresentCapabilitiesKhx = 1000060007,
    imageSwapchainCreateInfoKhx = 1000060008,
    bindImageMemorySwapchainInfoKhx = 1000060009,
    acquireNextImageInfoKhx = 1000060010,
    deviceGroupPresentInfoKhx = 1000060011,
    deviceGroupSwapchainCreateInfoKhx = 1000060012,
    bindBufferMemoryDeviceGroupInfoKhx = 1000060013,
    bindImageMemoryDeviceGroupInfoKhx = 1000060014,
    validationFlagsExt = 1000061000,
    viSurfaceCreateInfoNn = 1000062000,
    physicalDeviceGroupPropertiesKhx = 1000070000,
    deviceGroupDeviceCreateInfoKhx = 1000070001,
    physicalDeviceExternalImageFormatInfoKhr = 1000071000,
    externalImageFormatPropertiesKhr = 1000071001,
    physicalDeviceExternalBufferInfoKhr = 1000071002,
    externalBufferPropertiesKhr = 1000071003,
    physicalDeviceIDPropertiesKhr = 1000071004,
    externalMemoryBufferCreateInfoKhr = 1000072000,
    externalMemoryImageCreateInfoKhr = 1000072001,
    exportMemoryAllocateInfoKhr = 1000072002,
    importMemoryWin32HandleInfoKhr = 1000073000,
    exportMemoryWin32HandleInfoKhr = 1000073001,
    memoryWin32HandlePropertiesKhr = 1000073002,
    memoryGetWin32HandleInfoKhr = 1000073003,
    importMemoryFdInfoKhr = 1000074000,
    memoryFdPropertiesKhr = 1000074001,
    memoryGetFdInfoKhr = 1000074002,
    win32KeyedMutexAcquireReleaseInfoKhr = 1000075000,
    physicalDeviceExternalSemaphoreInfoKhr = 1000076000,
    externalSemaphorePropertiesKhr = 1000076001,
    exportSemaphoreCreateInfoKhr = 1000077000,
    importSemaphoreWin32HandleInfoKhr = 1000078000,
    exportSemaphoreWin32HandleInfoKhr = 1000078001,
    d3d12FenceSubmitInfoKhr = 1000078002,
    semaphoreGetWin32HandleInfoKhr = 1000078003,
    importSemaphoreFdInfoKhr = 1000079000,
    semaphoreGetFdInfoKhr = 1000079001,
    physicalDevicePushDescriptorPropertiesKhr = 1000080000,
    physicalDevice16bitStorageFeaturesKhr = 1000083000,
    presentRegionsKhr = 1000084000,
    descriptorUpdateTemplateCreateInfoKhr = 1000085000,
    objectTableCreateInfoNvx = 1000086000,
    indirectCommandsLayoutCreateInfoNvx = 1000086001,
    cmdProcessCommandsInfoNvx = 1000086002,
    cmdReserveSpaceForCommandsInfoNvx = 1000086003,
    deviceGeneratedCommandsLimitsNvx = 1000086004,
    deviceGeneratedCommandsFeaturesNvx = 1000086005,
    pipelineViewportWScalingStateCreateInfoNv = 1000087000,
    surfaceCapabilities2Ext = 1000090000,
    displayPowerInfoExt = 1000091000,
    deviceEventInfoExt = 1000091001,
    displayEventInfoExt = 1000091002,
    swapchainCounterCreateInfoExt = 1000091003,
    presentTimesInfoGoogle = 1000092000,
    physicalDeviceMultiviewPerViewAttributesPropertiesNvx = 1000097000,
    pipelineViewportSwizzleStateCreateInfoNv = 1000098000,
    physicalDeviceDiscardRectanglePropertiesExt = 1000099000,
    pipelineDiscardRectangleStateCreateInfoExt = 1000099001,
    hdrMetadataExt = 1000105000,
    sharedPresentSurfaceCapabilitiesKhr = 1000111000,
    physicalDeviceExternalFenceInfoKhr = 1000112000,
    externalFencePropertiesKhr = 1000112001,
    exportFenceCreateInfoKhr = 1000113000,
    importFenceWin32HandleInfoKhr = 1000114000,
    exportFenceWin32HandleInfoKhr = 1000114001,
    fenceGetWin32HandleInfoKhr = 1000114002,
    importFenceFdInfoKhr = 1000115000,
    fenceGetFdInfoKhr = 1000115001,
    physicalDevicePointClippingPropertiesKhr = 1000117000,
    renderPassInputAttachmentAspectCreateInfoKhr = 1000117001,
    imageViewUsageCreateInfoKhr = 1000117002,
    pipelineTessellationDomainOriginStateCreateInfoKhr = 1000117003,
    physicalDeviceSurfaceInfo2Khr = 1000119000,
    surfaceCapabilities2Khr = 1000119001,
    surfaceFormat2Khr = 1000119002,
    physicalDeviceVariablePointerFeaturesKhr = 1000120000,
    iosSurfaceCreateInfoMvk = 1000122000,
    macosSurfaceCreateInfoMvk = 1000123000,
    memoryDedicatedRequirementsKhr = 1000127000,
    memoryDedicatedAllocateInfoKhr = 1000127001,
    physicalDeviceSamplerFilterMinmaxPropertiesExt = 1000130000,
    samplerReductionModeCreateInfoExt = 1000130001,
    sampleLocationsInfoExt = 1000143000,
    renderPassSampleLocationsBeginInfoExt = 1000143001,
    pipelineSampleLocationsStateCreateInfoExt = 1000143002,
    physicalDeviceSampleLocationsPropertiesExt = 1000143003,
    multisamplePropertiesExt = 1000143004,
    bufferMemoryRequirementsInfo2Khr = 1000146000,
    imageMemoryRequirementsInfo2Khr = 1000146001,
    imageSparseMemoryRequirementsInfo2Khr = 1000146002,
    memoryRequirements2Khr = 1000146003,
    sparseImageMemoryRequirements2Khr = 1000146004,
    imageFormatListCreateInfoKhr = 1000147000,
    physicalDeviceBlendOperationAdvancedFeaturesExt = 1000148000,
    physicalDeviceBlendOperationAdvancedPropertiesExt = 1000148001,
    pipelineColorBlendAdvancedStateCreateInfoExt = 1000148002,
    pipelineCoverageToColorStateCreateInfoNv = 1000149000,
    pipelineCoverageModulationStateCreateInfoNv = 1000152000,
    samplerYcbcrConversionCreateInfoKhr = 1000156000,
    samplerYcbcrConversionInfoKhr = 1000156001,
    bindImagePlaneMemoryInfoKhr = 1000156002,
    imagePlaneMemoryRequirementsInfoKhr = 1000156003,
    physicalDeviceSamplerYcbcrConversionFeaturesKhr = 1000156004,
    samplerYcbcrConversionImageFormatPropertiesKhr = 1000156005,
    bindBufferMemoryInfoKhr = 1000157000,
    bindImageMemoryInfoKhr = 1000157001,
    validationCacheCreateInfoExt = 1000160000,
    shaderModuleValidationCacheCreateInfoExt = 1000160001,

  VkSystemAllocationScope* {.pure, size: sizeof(cint).} = enum
    command = 0,
    objects = 1,
    cache = 2,
    device = 3,
    instance = 4,

  VkInternalAllocationType* {.pure, size: sizeof(cint).} = enum
    executable = 0,

  VkFormat* {.pure, size: sizeof(cint).} = enum
    undefined = 0,
    r4g4UnormPack8 = 1,
    r4g4b4a4UnormPack16 = 2,
    b4g4r4a4UnormPack16 = 3,
    r5g6b5UnormPack16 = 4,
    b5g6r5UnormPack16 = 5,
    r5g5b5a1UnormPack16 = 6,
    b5g5r5a1UnormPack16 = 7,
    a1r5g5b5UnormPack16 = 8,
    r8Unorm = 9,
    r8Snorm = 10,
    r8Uscaled = 11,
    r8Sscaled = 12,
    r8Uint = 13,
    r8Sint = 14,
    r8Srgb = 15,
    r8g8Unorm = 16,
    r8g8Snorm = 17,
    r8g8Uscaled = 18,
    r8g8Sscaled = 19,
    r8g8Uint = 20,
    r8g8Sint = 21,
    r8g8Srgb = 22,
    r8g8b8Unorm = 23,
    r8g8b8Snorm = 24,
    r8g8b8Uscaled = 25,
    r8g8b8Sscaled = 26,
    r8g8b8Uint = 27,
    r8g8b8Sint = 28,
    r8g8b8Srgb = 29,
    b8g8r8Unorm = 30,
    b8g8r8Snorm = 31,
    b8g8r8Uscaled = 32,
    b8g8r8Sscaled = 33,
    b8g8r8Uint = 34,
    b8g8r8Sint = 35,
    b8g8r8Srgb = 36,
    r8g8b8a8Unorm = 37,
    r8g8b8a8Snorm = 38,
    r8g8b8a8Uscaled = 39,
    r8g8b8a8Sscaled = 40,
    r8g8b8a8Uint = 41,
    r8g8b8a8Sint = 42,
    r8g8b8a8Srgb = 43,
    b8g8r8a8Unorm = 44,
    b8g8r8a8Snorm = 45,
    b8g8r8a8Uscaled = 46,
    b8g8r8a8Sscaled = 47,
    b8g8r8a8Uint = 48,
    b8g8r8a8Sint = 49,
    b8g8r8a8Srgb = 50,
    a8b8g8r8UnormPack32 = 51,
    a8b8g8r8SnormPack32 = 52,
    a8b8g8r8UscaledPack32 = 53,
    a8b8g8r8SscaledPack32 = 54,
    a8b8g8r8UintPack32 = 55,
    a8b8g8r8SintPack32 = 56,
    a8b8g8r8SrgbPack32 = 57,
    a2r10g10b10UnormPack32 = 58,
    a2r10g10b10SnormPack32 = 59,
    a2r10g10b10UscaledPack32 = 60,
    a2r10g10b10SscaledPack32 = 61,
    a2r10g10b10UintPack32 = 62,
    a2r10g10b10SintPack32 = 63,
    a2b10g10r10UnormPack32 = 64,
    a2b10g10r10SnormPack32 = 65,
    a2b10g10r10UscaledPack32 = 66,
    a2b10g10r10SscaledPack32 = 67,
    a2b10g10r10UintPack32 = 68,
    a2b10g10r10SintPack32 = 69,
    r16Unorm = 70,
    r16Snorm = 71,
    r16Uscaled = 72,
    r16Sscaled = 73,
    r16Uint = 74,
    r16Sint = 75,
    r16Sfloat = 76,
    r16g16Unorm = 77,
    r16g16Snorm = 78,
    r16g16Uscaled = 79,
    r16g16Sscaled = 80,
    r16g16Uint = 81,
    r16g16Sint = 82,
    r16g16Sfloat = 83,
    r16g16b16Unorm = 84,
    r16g16b16Snorm = 85,
    r16g16b16Uscaled = 86,
    r16g16b16Sscaled = 87,
    r16g16b16Uint = 88,
    r16g16b16Sint = 89,
    r16g16b16Sfloat = 90,
    r16g16b16a16Unorm = 91,
    r16g16b16a16Snorm = 92,
    r16g16b16a16Uscaled = 93,
    r16g16b16a16Sscaled = 94,
    r16g16b16a16Uint = 95,
    r16g16b16a16Sint = 96,
    r16g16b16a16Sfloat = 97,
    r32Uint = 98,
    r32Sint = 99,
    r32Sfloat = 100,
    r32g32Uint = 101,
    r32g32Sint = 102,
    r32g32Sfloat = 103,
    r32g32b32Uint = 104,
    r32g32b32Sint = 105,
    r32g32b32Sfloat = 106,
    r32g32b32a32Uint = 107,
    r32g32b32a32Sint = 108,
    r32g32b32a32Sfloat = 109,
    r64Uint = 110,
    r64Sint = 111,
    r64Sfloat = 112,
    r64g64Uint = 113,
    r64g64Sint = 114,
    r64g64Sfloat = 115,
    r64g64b64Uint = 116,
    r64g64b64Sint = 117,
    r64g64b64Sfloat = 118,
    r64g64b64a64Uint = 119,
    r64g64b64a64Sint = 120,
    r64g64b64a64Sfloat = 121,
    b10g11r11UfloatPack32 = 122,
    e5b9g9r9UfloatPack32 = 123,
    d16Unorm = 124,
    x8D24UnormPack32 = 125,
    d32Sfloat = 126,
    s8Uint = 127,
    d16UnormS8Uint = 128,
    d24UnormS8Uint = 129,
    d32SfloatS8Uint = 130,
    bc1RgbUnormBlock = 131,
    bc1RgbSrgbBlock = 132,
    bc1RgbaUnormBlock = 133,
    bc1RgbaSrgbBlock = 134,
    bc2UnormBlock = 135,
    bc2SrgbBlock = 136,
    bc3UnormBlock = 137,
    bc3SrgbBlock = 138,
    bc4UnormBlock = 139,
    bc4SnormBlock = 140,
    bc5UnormBlock = 141,
    bc5SnormBlock = 142,
    bc6hUfloatBlock = 143,
    bc6hSfloatBlock = 144,
    bc7UnormBlock = 145,
    bc7SrgbBlock = 146,
    etc2R8g8b8UnormBlock = 147,
    etc2R8g8b8SrgbBlock = 148,
    etc2R8g8b8a1UnormBlock = 149,
    etc2R8g8b8a1SrgbBlock = 150,
    etc2R8g8b8a8UnormBlock = 151,
    etc2R8g8b8a8SrgbBlock = 152,
    eacR11UnormBlock = 153,
    eacR11SnormBlock = 154,
    eacR11g11UnormBlock = 155,
    eacR11g11SnormBlock = 156,
    aSTC4x4UNORMBLOCK = 157,
    aSTC4x4SRGBBLOCK = 158,
    aSTC5x4UNORMBLOCK = 159,
    aSTC5x4SRGBBLOCK = 160,
    aSTC5x5UNORMBLOCK = 161,
    aSTC5x5SRGBBLOCK = 162,
    aSTC6x5UNORMBLOCK = 163,
    aSTC6x5SRGBBLOCK = 164,
    aSTC6x6UNORMBLOCK = 165,
    aSTC6x6SRGBBLOCK = 166,
    aSTC8x5UNORMBLOCK = 167,
    aSTC8x5SRGBBLOCK = 168,
    aSTC8x6UNORMBLOCK = 169,
    aSTC8x6SRGBBLOCK = 170,
    aSTC8x8UNORMBLOCK = 171,
    aSTC8x8SRGBBLOCK = 172,
    aSTC10x5UNORMBLOCK = 173,
    aSTC10x5SRGBBLOCK = 174,
    aSTC10x6UNORMBLOCK = 175,
    aSTC10x6SRGBBLOCK = 176,
    aSTC10x8UNORMBLOCK = 177,
    aSTC10x8SRGBBLOCK = 178,
    aSTC10x10UNORMBLOCK = 179,
    aSTC10x10SRGBBLOCK = 180,
    aSTC12x10UNORMBLOCK = 181,
    aSTC12x10SRGBBLOCK = 182,
    aSTC12x12UNORMBLOCK = 183,
    aSTC12x12SRGBBLOCK = 184,
    pvrtc12bppUnormBlockImg = 1000054000,
    pvrtc14bppUnormBlockImg = 1000054001,
    pvrtc22bppUnormBlockImg = 1000054002,
    pvrtc24bppUnormBlockImg = 1000054003,
    pvrtc12bppSrgbBlockImg = 1000054004,
    pvrtc14bppSrgbBlockImg = 1000054005,
    pvrtc22bppSrgbBlockImg = 1000054006,
    pvrtc24bppSrgbBlockImg = 1000054007,
    g8b8g8r8422UnormKhr = 1000156000,
    b8g8r8g8422UnormKhr = 1000156001,
    g8B8R83plane420UnormKhr = 1000156002,
    g8B8r82plane420UnormKhr = 1000156003,
    g8B8R83plane422UnormKhr = 1000156004,
    g8B8r82plane422UnormKhr = 1000156005,
    g8B8R83plane444UnormKhr = 1000156006,
    r10x6UnormPack16Khr = 1000156007,
    r10x6g10x6Unorm2pack16Khr = 1000156008,
    r10x6g10x6b10x6a10x6Unorm4pack16Khr = 1000156009,
    g10x6b10x6g10x6r10x6422Unorm4pack16Khr = 1000156010,
    b10x6g10x6r10x6g10x6422Unorm4pack16Khr = 1000156011,
    g10x6B10x6R10x63plane420Unorm3pack16Khr = 1000156012,
    g10x6B10x6r10x62plane420Unorm3pack16Khr = 1000156013,
    g10x6B10x6R10x63plane422Unorm3pack16Khr = 1000156014,
    g10x6B10x6r10x62plane422Unorm3pack16Khr = 1000156015,
    g10x6B10x6R10x63plane444Unorm3pack16Khr = 1000156016,
    r12x4UnormPack16Khr = 1000156017,
    r12x4g12x4Unorm2pack16Khr = 1000156018,
    r12x4g12x4b12x4a12x4Unorm4pack16Khr = 1000156019,
    g12x4b12x4g12x4r12x4422Unorm4pack16Khr = 1000156020,
    b12x4g12x4r12x4g12x4422Unorm4pack16Khr = 1000156021,
    g12x4B12x4R12x43plane420Unorm3pack16Khr = 1000156022,
    g12x4B12x4r12x42plane420Unorm3pack16Khr = 1000156023,
    g12x4B12x4R12x43plane422Unorm3pack16Khr = 1000156024,
    g12x4B12x4r12x42plane422Unorm3pack16Khr = 1000156025,
    g12x4B12x4R12x43plane444Unorm3pack16Khr = 1000156026,
    g16b16g16r16422UnormKhr = 1000156027,
    b16g16r16g16422UnormKhr = 1000156028,
    g16B16R163plane420UnormKhr = 1000156029,
    g16B16r162plane420UnormKhr = 1000156030,
    g16B16R163plane422UnormKhr = 1000156031,
    g16B16r162plane422UnormKhr = 1000156032,
    g16B16R163plane444UnormKhr = 1000156033,

  VkImageType* {.pure, size: sizeof(cint).} = enum
    oneDee = 0,
    twoDee = 1,
    threeDee = 2,

  VkImageTiling* {.pure, size: sizeof(cint).} = enum
    optimal = 0,
    linear = 1,

  VkPhysicalDeviceType* {.pure, size: sizeof(cint).} = enum
    other = 0,
    integratedGpu = 1,
    discreteGpu = 2,
    virtualGpu = 3,
    cpu = 4,

  VkQueryType* {.pure, size: sizeof(cint).} = enum
    occlusion = 0,
    pipelineStatistics = 1,
    timestamp = 2,

  VkSharingMode* {.pure, size: sizeof(cint).} = enum
    exclusive = 0,
    concurrent = 1,

  VkImageLayout* {.pure, size: sizeof(cint).} = enum
    undefined = 0,
    general = 1,
    colorAttachmentOptimal = 2,
    depthStencilAttachmentOptimal = 3,
    depthStencilReadOnlyOptimal = 4,
    shaderReadOnlyOptimal = 5,
    transferSrcOptimal = 6,
    transferDstOptimal = 7,
    preinitialized = 8,
    presentSrcKhr = 1000001002,
    sharedPresentKhr = 1000111000,
    depthReadOnlyStencilAttachmentOptimalKhr = 1000117000,
    depthAttachmentStencilReadOnlyOptimalKhr = 1000117001,

  VkImageViewType* {.pure, size: sizeof(cint).} = enum
    oneDee = 0,
    twoDee = 1,
    threeDee = 2,
    cube = 3,
    oneDeeArray = 4,
    twoDeeArray = 5,
    cubeArray = 6,

  VkComponentSwizzle* {.pure, size: sizeof(cint).} = enum
    identity = 0,
    zero = 1,
    one = 2,
    r = 3,
    g = 4,
    b = 5,
    a = 6,

  VkVertexInputRate* {.pure, size: sizeof(cint).} = enum
    vertex = 0,
    instance = 1,

  VkPrimitiveTopology* {.pure, size: sizeof(cint).} = enum
    pointList = 0,
    lineList = 1,
    lineStrip = 2,
    triangleList = 3,
    triangleStrip = 4,
    triangleFan = 5,
    lineListWithAdjacency = 6,
    lineStripWithAdjacency = 7,
    triangleListWithAdjacency = 8,
    triangleStripWithAdjacency = 9,
    patchList = 10,

  VkPolygonMode* {.pure, size: sizeof(cint).} = enum
    fill = 0,
    line = 1,
    point = 2,
    fillRectangleNv = 1000153000,

  VkFrontFace* {.pure, size: sizeof(cint).} = enum
    counterClockwise = 0,
    clockwise = 1,

  VkCompareOp* {.pure, size: sizeof(cint).} = enum
    never = 0,
    less = 1,
    equal = 2,
    lessOrEqual = 3,
    greater = 4,
    notEqual = 5,
    greaterOrEqual = 6,
    always = 7,

  VkStencilOp* {.pure, size: sizeof(cint).} = enum
    keep = 0,
    zero = 1,
    replace = 2,
    incrementAndClamp = 3,
    decrementAndClamp = 4,
    invert = 5,
    incrementAndWrap = 6,
    decrementAndWrap = 7,

  VkLogicOp* {.pure, size: sizeof(cint).} = enum
    opClear = 0,
    opAnd = 1,
    opAndReverse = 2,
    opCopy = 3,
    opAndInverted = 4,
    opNoOp = 5,
    opXor = 6,
    opOr = 7,
    opNor = 8,
    opEquivalent = 9,
    opInvert = 10,
    opOrReverse = 11,
    opCopyInverted = 12,
    opOrInverted = 13,
    opNand = 14,
    opSet = 15,

  VkBlendFactor* {.pure, size: sizeof(cint).} = enum
    zero = 0,
    one = 1,
    srcColor = 2,
    oneMinusSrcColor = 3,
    dstColor = 4,
    oneMinusDstColor = 5,
    srcAlpha = 6,
    oneMinusSrcAlpha = 7,
    dstAlpha = 8,
    oneMinusDstAlpha = 9,
    constantColor = 10,
    oneMinusConstantColor = 11,
    constantAlpha = 12,
    oneMinusConstantAlpha = 13,
    srcAlphaSaturate = 14,
    src1Color = 15,
    oneMinusSrc1Color = 16,
    src1Alpha = 17,
    oneMinusSrc1Alpha = 18,

  VkBlendOp* {.pure, size: sizeof(cint).} = enum
    opAdd = 0,
    opSubtract = 1,
    opReverseSubtract = 2,
    opMin = 3,
    opMax = 4,
    opZeroExt = 1000148000,
    opSrcExt = 1000148001,
    opDstExt = 1000148002,
    opSrcOverExt = 1000148003,
    opDstOverExt = 1000148004,
    opSrcInExt = 1000148005,
    opDstInExt = 1000148006,
    opSrcOutExt = 1000148007,
    opDstOutExt = 1000148008,
    opSrcAtopExt = 1000148009,
    opDstAtopExt = 1000148010,
    opXorExt = 1000148011,
    opMultiplyExt = 1000148012,
    opScreenExt = 1000148013,
    opOverlayExt = 1000148014,
    opDarkenExt = 1000148015,
    opLightenExt = 1000148016,
    opColordodgeExt = 1000148017,
    opColorburnExt = 1000148018,
    opHardlightExt = 1000148019,
    opSoftlightExt = 1000148020,
    opDifferenceExt = 1000148021,
    opExclusionExt = 1000148022,
    opInvertExt = 1000148023,
    opInvertRgbExt = 1000148024,
    opLineardodgeExt = 1000148025,
    opLinearburnExt = 1000148026,
    opVividlightExt = 1000148027,
    opLinearlightExt = 1000148028,
    opPinlightExt = 1000148029,
    opHardmixExt = 1000148030,
    opHslHueExt = 1000148031,
    opHslSaturationExt = 1000148032,
    opHslColorExt = 1000148033,
    opHslLuminosityExt = 1000148034,
    opPlusExt = 1000148035,
    opPlusClampedExt = 1000148036,
    opPlusClampedAlphaExt = 1000148037,
    opPlusDarkerExt = 1000148038,
    opMinusExt = 1000148039,
    opMinusClampedExt = 1000148040,
    opContrastExt = 1000148041,
    opInvertOvgExt = 1000148042,
    opRedExt = 1000148043,
    opGreenExt = 1000148044,
    opBlueExt = 1000148045,

  VkDynamicState* {.pure, size: sizeof(cint).} = enum
    viewport = 0,
    scissor = 1,
    lineWidth = 2,
    depthBias = 3,
    blendConstants = 4,
    depthBounds = 5,
    stencilCompareMask = 6,
    stencilWriteMask = 7,
    stencilReference = 8,
    viewportWScalingNv = 1000087000,
    discardRectangleExt = 1000099000,
    sampleLocationsExt = 1000143000,

  VkFilter* {.pure, size: sizeof(cint).} = enum
    nearest = 0,
    linear = 1,
    cubicImg = 1000015000,

  VkSamplerMipmapMode* {.pure, size: sizeof(cint).} = enum
    nearest = 0,
    linear = 1,

  VkSamplerAddressMode* {.pure, size: sizeof(cint).} = enum
    repeat = 0,
    mirroredRepeat = 1,
    clampToEdge = 2,
    clampToBorder = 3,
    mirrorClampToEdge = 4,

  VkBorderColor* {.pure, size: sizeof(cint).} = enum
    floatTransparentBlack = 0,
    intTransparentBlack = 1,
    floatOpaqueBlack = 2,
    intOpaqueBlack = 3,
    floatOpaqueWhite = 4,
    intOpaqueWhite = 5,

  VkDescriptorType* {.pure, size: sizeof(cint).} = enum
    sampler = 0,
    combinedImageSampler = 1,
    sampledImage = 2,
    storageImage = 3,
    uniformTexelBuffer = 4,
    storageTexelBuffer = 5,
    uniformBuffer = 6,
    storageBuffer = 7,
    uniformBufferDynamic = 8,
    storageBufferDynamic = 9,
    inputAttachment = 10,

  VkAttachmentLoadOp* {.pure, size: sizeof(cint).} = enum
    opLoad = 0,
    opClear = 1,
    opDontCare = 2,

  VkAttachmentStoreOp* {.pure, size: sizeof(cint).} = enum
    opStore = 0,
    opDontCare = 1,

  VkPipelineBindPoint* {.pure, size: sizeof(cint).} = enum
    graphics = 0,
    compute = 1,

  VkCommandBufferLevel* {.pure, size: sizeof(cint).} = enum
    primary = 0,
    secondary = 1,

  VkIndexType* {.pure, size: sizeof(cint).} = enum
    uint16Index = 0,
    uint32Index = 1,

  VkSubpassContents* {.pure, size: sizeof(cint).} = enum
    inline = 0,
    secondaryCommandBuffers = 1,

  VkObjectType* {.pure, size: sizeof(cint).} = enum
    unknown = 0,
    instance = 1,
    physicalDevice = 2,
    device = 3,
    queue = 4,
    semaphore = 5,
    commandBuffer = 6,
    fence = 7,
    deviceMemory = 8,
    buffer = 9,
    image = 10,
    event = 11,
    queryPool = 12,
    bufferView = 13,
    imageView = 14,
    shaderModule = 15,
    pipelineCache = 16,
    pipelineLayout = 17,
    renderPass = 18,
    pipeline = 19,
    descriptorSetLayout = 20,
    sampler = 21,
    descriptorPool = 22,
    descriptorSet = 23,
    framebuffer = 24,
    commandPool = 25,
    surfaceKhr = 1000000000,
    swapchainKhr = 1000001000,
    displayKhr = 1000002000,
    displayModeKhr = 1000002001,
    debugReportCallbackExt = 1000011000,
    descriptorUpdateTemplateKhr = 1000085000,
    objectTableNvx = 1000086000,
    indirectCommandsLayoutNvx = 1000086001,
    samplerYcbcrConversionKhr = 1000156000,
    validationCacheExt = 1000160000,

  VkInstanceCreateFlags* = VkFlags

  VkFormatFeatureFlagBits* {.pure, size: sizeof(cint).} = enum
    sampledImage = 0x00000001,
    storageImage = 0x00000002,
    storageImageAtomic = 0x00000004,
    uniformTexelBuffer = 0x00000008,
    storageTexelBuffer = 0x00000010,
    storageTexelBufferAtomic = 0x00000020,
    vertexBuffer = 0x00000040,
    colorAttachment = 0x00000080,
    colorAttachmentBlend = 0x00000100,
    depthStencilAttachment = 0x00000200,
    blitSrc = 0x00000400,
    blitDst = 0x00000800,
    sampledImageFilterLinear = 0x00001000,
    sampledImageFilterCubicImg = 0x00002000,
    transferSrcKhr = 0x00004000,
    transferDstKhr = 0x00008000,
    sampledImageFilterMinmaxExt = 0x00010000,
    midpointChromaSamplesKhr = 0x00020000,
    sampledImageYcbcrConversionLinearFilterKhr = 0x00040000,
    sampledImageYcbcrConversionSeparateReconstructionFilterKhr = 0x00080000,
    sampledImageYcbcrConversionChromaReconstructionExplicitKhr = 0x00100000,
    sampledImageYcbcrConversionChromaReconstructionExplicitForceableKhr = 0x00200000,
    disjointKhr = 0x00400000,
    cositedChromaSamplesKhr = 0x00800000,

  VkFormatFeatureFlags* = VkFlags

  VkImageUsageFlagBits* {.pure, size: sizeof(cint).} = enum
    transferSrc = 0x00000001,
    transferDst = 0x00000002,
    sampled = 0x00000004,
    storage = 0x00000008,
    colorAttachment = 0x00000010,
    depthStencilAttachment = 0x00000020,
    transientAttachment = 0x00000040,
    inputAttachment = 0x00000080,

  VkImageUsageFlags* = VkFlags

  VkImageCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    sparseBinding = 0x00000001,
    sparseResidency = 0x00000002,
    sparseAliased = 0x00000004,
    mutableFormat = 0x00000008,
    cubeCompatible = 0x00000010,
    array2dCompatibleKhr = 0x00000020,
    bindSfrKhx = 0x00000040,
    blockTexelViewCompatibleKhr = 0x00000080,
    extendedUsageKhr = 0x00000100,
    disjointKhr = 0x00000200,
    aliasKhr = 0x00000400,
    sampleLocationsCompatibleDepthExt = 0x00001000,

  VkImageCreateFlags* = VkFlags

  VkSampleCountFlagBits* {.pure, size: sizeof(cint).} = enum
    one = 0x00000001,
    two = 0x00000002,
    four = 0x00000004,
    eight = 0x00000008,
    sixteen = 0x00000010,
    thirtytwo = 0x00000020,
    sixtyfour = 0x00000040,

  VkSampleCountFlags* = VkFlags

  VkQueueFlagBits* {.pure, size: sizeof(cint).} = enum
    graphics = 0x00000001,
    compute = 0x00000002,
    transfer = 0x00000004,
    sparseBinding = 0x00000008,

  VkQueueFlags* = VkFlags

  VkMemoryPropertyFlagBits* {.pure, size: sizeof(cint).} = enum
    deviceLocal = 0x00000001,
    hostVisible = 0x00000002,
    hostCoherent = 0x00000004,
    hostCached = 0x00000008,
    lazilyAllocated = 0x00000010,

  VkMemoryPropertyFlags* = VkFlags

  VkMemoryHeapFlagBits* {.pure, size: sizeof(cint).} = enum
    deviceLocal = 0x00000001,
    multiInstanceKhx = 0x00000002,

  VkMemoryHeapFlags* = VkFlags

  VkDeviceCreateFlags* = VkFlags

  VkDeviceQueueCreateFlags* = VkFlags

  VkPipelineStageFlagBits* {.pure, size: sizeof(cint).} = enum
    topOfPipe = 0x00000001,
    drawIndirect = 0x00000002,
    vertexInput = 0x00000004,
    vertexShader = 0x00000008,
    tessellationControlShader = 0x00000010,
    tessellationEvaluationShader = 0x00000020,
    geometryShader = 0x00000040,
    fragmentShader = 0x00000080,
    earlyFragmentTests = 0x00000100,
    lateFragmentTests = 0x00000200,
    colorAttachmentOutput = 0x00000400,
    computeShader = 0x00000800,
    transfer = 0x00001000,
    bottomOfPipe = 0x00002000,
    host = 0x00004000,
    allGraphics = 0x00008000,
    allCommands = 0x00010000,
    commandProcessNvx = 0x00020000,

  VkPipelineStageFlags* = VkFlags

  VkMemoryMapFlags* = VkFlags

  VkImageAspectFlagBits* {.pure, size: sizeof(cint).} = enum
    color = 0x00000001
    depth = 0x00000002,
    stencil = 0x00000004,
    metadata = 0x00000008,
    plane0Khr = 0x00000010,
    plane1Khr = 0x00000020,
    plane2Khr = 0x00000040,

  VkImageAspectFlags* = VkFlags

  VkSparseImageFormatFlagBits* {.pure, size: sizeof(cint).} = enum
    singleMiptail = 0x00000001,
    alignedMipSize = 0x00000002,
    nonstandardBlockSize = 0x00000004,

  VkSparseImageFormatFlags* = VkFlags

  VkSparseMemoryBindFlagBits* {.pure, size: sizeof(cint).} = enum
    metadata = 0x00000001,

  VkSparseMemoryBindFlags* = VkFlags

  VkFenceCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    signaled = 0x00000001,

  VkFenceCreateFlags* = VkFlags

  VkSemaphoreCreateFlags* = VkFlags

  VkEventCreateFlags* = VkFlags

  VkQueryPoolCreateFlags* = VkFlags

  VkQueryPipelineStatisticFlagBits* {.pure, size: sizeof(cint).} = enum
    inputAssemblyVertices = 0x00000001,
    inputAssemblyPrimitives = 0x00000002,
    vertexShaderInvocations = 0x00000004,
    geometryShaderInvocations = 0x00000008,
    geometryShaderPrimitives = 0x00000010,
    clippingInvocations = 0x00000020,
    clippingPrimitives = 0x00000040,
    fragmentShaderInvocations = 0x00000080,
    tessellationControlShaderPatches = 0x00000100,
    tessellationEvaluationShaderInvocations = 0x00000200,
    computeShaderInvocations = 0x00000400,

  VkQueryPipelineStatisticFlags* = VkFlags

  VkQueryResultFlagBits* {.pure, size: sizeof(cint).} = enum
    sixtyfour = 0x00000001,
    wait = 0x00000002,
    withAvailability = 0x00000004,
    partial = 0x00000008,

  VkQueryResultFlags* = VkFlags

  VkBufferCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    binding = 0x00000001,
    residency = 0x00000002,
    aliased = 0x00000004,

  VkBufferCreateFlags* = VkFlags

  VkBufferUsageFlagBits* {.pure, size: sizeof(cint).} = enum
    transferSrc = 0x00000001,
    transferDst = 0x00000002,
    uniformTexelBuffer = 0x00000004,
    storageTexelBuffer = 0x00000008,
    uniformBuffer = 0x00000010,
    storageBuffer = 0x00000020,
    indexBuffer = 0x00000040,
    vertexBuffer = 0x00000080,
    indirectBuffer = 0x00000100,

  VkBufferUsageFlags* = VkFlags

  VkBufferViewCreateFlags* = VkFlags

  VkImageViewCreateFlags* = VkFlags

  VkShaderModuleCreateFlags* = VkFlags

  VkPipelineCacheCreateFlags* = VkFlags

  VkPipelineCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    disableOptimization = 0x00000001,
    allowDerivatives = 0x00000002,
    derivative = 0x00000004,
    viewIndexFromDeviceIndexKhx = 0x00000008,
    dispatchBaseKhx = 0x00000010,

  VkPipelineCreateFlags* = VkFlags

  VkPipelineShaderStageCreateFlags* = VkFlags

  VkShaderStageFlagBits* {.pure, size: sizeof(cint).} = enum
    vertex = 0x00000001,
    tessellationControl = 0x00000002,
    tessellationEvaluation = 0x00000004,
    geometry = 0x00000008,
    fragment = 0x00000010,
    allGraphics = 0x0000001F,
    compute = 0x00000020,
    all = 0x7FFFFFFF

  VkPipelineVertexInputStateCreateFlags* = VkFlags
  
  VkPipelineInputAssemblyStateCreateFlags* = VkFlags
  
  VkPipelineTessellationStateCreateFlags* = VkFlags
  
  VkPipelineViewportStateCreateFlags* = VkFlags
  
  VkPipelineRasterizationStateCreateFlags* = VkFlags
  
  VkCullModeFlagBits* {.pure, size: sizeof(cint).} = enum
    none = 0,
    front = 0x00000001,
    back = 0x00000002,
    frontAndBack = 0x00000003,

  VkCullModeFlags* = VkFlags

  VkPipelineMultisampleStateCreateFlags* = VkFlags

  VkPipelineDepthStencilStateCreateFlags* = VkFlags

  VkPipelineColorBlendStateCreateFlags* = VkFlags

  VkColorComponentFlagBits* {.pure, size: sizeof(cint).} = enum
    r = 0x00000001,
    g = 0x00000002,
    b = 0x00000004,
    a = 0x00000008,

  VkColorComponentFlags* = VkFlags

  VkPipelineDynamicStateCreateFlags* = VkFlags

  VkPipelineLayoutCreateFlags* = VkFlags

  VkShaderStageFlags* = VkFlags

  VkSamplerCreateFlags* = VkFlags

  VkDescriptorSetLayoutCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    pushDescriptorKhr = 0x00000001,


  VkDescriptorSetLayoutCreateFlags* = VkFlags

  VkDescriptorPoolCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    freeDescriptorSet = 0x00000001,

  VkDescriptorPoolCreateFlags* = VkFlags

  VkDescriptorPoolResetFlags* = VkFlags

  VkFramebufferCreateFlags* = VkFlags

  VkRenderPassCreateFlags* = VkFlags

  VkAttachmentDescriptionFlagBits* {.pure, size: sizeof(cint).} = enum
    mayAlias = 0x00000001,


  VkAttachmentDescriptionFlags* = VkFlags

  VkSubpassDescriptionFlagBits* {.pure, size: sizeof(cint).} = enum
    perViewAttributesNvx = 0x00000001,
    perViewPositionXOnlyNvx = 0x00000002,

  VkSubpassDescriptionFlags* = VkFlags

  VkAccessFlagBits* {.pure, size: sizeof(cint).} = enum
    indirectCommandRead = 0x00000001,
    indexRead = 0x00000002,
    vertexAttributeRead = 0x00000004,
    uniformRead = 0x00000008,
    inputAttachmentRead = 0x00000010,
    shaderRead = 0x00000020,
    shaderWrite = 0x00000040,
    colorAttachmentRead = 0x00000080,
    colorAttachmentWrite = 0x00000100,
    depthStencilAttachmentRead = 0x00000200,
    depthStencilAttachmentWrite = 0x00000400,
    transferRead = 0x00000800,
    transferWrite = 0x00001000,
    hostRead = 0x00002000,
    hostWrite = 0x00004000,
    memoryRead = 0x00008000,
    memoryWrite = 0x00010000,
    commandProcessReadNvx = 0x00020000,
    commandProcessWriteNvx = 0x00040000,
    colorAttachmentReadNoncoherentExt = 0x00080000,

  VkAccessFlags* = VkFlags

  VkDependencyFlagBits* {.pure, size: sizeof(cint).} = enum
    byRegion = 0x00000001,
    viewLocalKhx = 0x00000002,
    deviceGroupKhx = 0x00000004,

  VkDependencyFlags* = VkFlags

  VkCommandPoolCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    transient = 0x00000001,
    resetCommandBuffer = 0x00000002,

  VkCommandPoolCreateFlags* = VkFlags

  VkCommandPoolResetFlagBits* {.pure, size: sizeof(cint).} = enum
    releaseResources = 0x00000001,

  VkCommandPoolResetFlags* = VkFlags

  VkCommandBufferUsageFlagBits* {.pure, size: sizeof(cint).} = enum
    oneTimeSubmit = 0x00000001,
    renderPassContinue = 0x00000002,
    simultaneousUse = 0x00000004,

  VkCommandBufferUsageFlags* = VkFlags

  VkQueryControlFlagBits* {.pure, size: sizeof(cint).} = enum
    precise = 0x00000001,

  VkQueryControlFlags* = VkFlags

  VkCommandBufferResetFlagBits* {.pure, size: sizeof(cint).} = enum
    releaseResources = 0x00000001,

  VkCommandBufferResetFlags* = VkFlags

  VkStencilFaceFlagBits* {.pure, size: sizeof(cint).} = enum
    front = 0x00000001,
    back = 0x00000002,
    frontAndBack = 0x00000003,

  VkStencilFaceFlags* = VkFlags

  VkApplicationInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    pApplicationName*: cstring
    applicationVersion*: uint32
    pEngineName*: cstring
    engineVersion*: uint32
    apiVersion*: uint32

  VkInstanceCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkInstanceCreateFlags
    pApplicationInfo*: ptr VkApplicationInfo
    enabledLayerCount*: uint32
    ppEnabledLayerNames*: cstringArray
    enabledExtensionCount*: uint32
    ppEnabledExtensionNames*: cstringArray

  PFN_vkAllocationFunction* = proc (pUserData: pointer; size: csize; alignment: csize; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}
  PFN_vkReallocationFunction* = proc (pUserData: pointer; pOriginal: pointer; size: csize; alignment: csize; allocationScope: VkSystemAllocationScope): pointer {.cdecl.}
  PFN_vkFreeFunction* = proc (pUserData: pointer; pMemory: pointer) {.cdecl.}
  PFN_vkInternalAllocationNotification* = proc (pUserData: pointer; size: csize; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}
  PFN_vkInternalFreeNotification* = proc (pUserData: pointer; size: csize; allocationType: VkInternalAllocationType; allocationScope: VkSystemAllocationScope) {.cdecl.}
  
  VkAllocationCallbacks* = object
    pUserData*: pointer
    pfnAllocation*: PFN_vkAllocationFunction
    pfnReallocation*: PFN_vkReallocationFunction
    pfnFree*: PFN_vkFreeFunction
    pfnInternalAllocation*: PFN_vkInternalAllocationNotification
    pfnInternalFree*: PFN_vkInternalFreeNotification

  VkPhysicalDeviceFeatures* = object
    robustBufferAccess*: VkBool32
    fullDrawIndexUint32*: VkBool32
    imageCubeArray*: VkBool32
    independentBlend*: VkBool32
    geometryShader*: VkBool32
    tessellationShader*: VkBool32
    sampleRateShading*: VkBool32
    dualSrcBlend*: VkBool32
    logicOp*: VkBool32
    multiDrawIndirect*: VkBool32
    drawIndirectFirstInstance*: VkBool32
    depthClamp*: VkBool32
    depthBiasClamp*: VkBool32
    fillModeNonSolid*: VkBool32
    depthBounds*: VkBool32
    wideLines*: VkBool32
    largePoints*: VkBool32
    alphaToOne*: VkBool32
    multiViewport*: VkBool32
    samplerAnisotropy*: VkBool32
    textureCompressionETC2*: VkBool32
    textureCompressionASTC_LDR*: VkBool32
    textureCompressionBC*: VkBool32
    occlusionQueryPrecise*: VkBool32
    pipelineStatisticsQuery*: VkBool32
    vertexPipelineStoresAndAtomics*: VkBool32
    fragmentStoresAndAtomics*: VkBool32
    shaderTessellationAndGeometryPointSize*: VkBool32
    shaderImageGatherExtended*: VkBool32
    shaderStorageImageExtendedFormats*: VkBool32
    shaderStorageImageMultisample*: VkBool32
    shaderStorageImageReadWithoutFormat*: VkBool32
    shaderStorageImageWriteWithoutFormat*: VkBool32
    shaderUniformBufferArrayDynamicIndexing*: VkBool32
    shaderSampledImageArrayDynamicIndexing*: VkBool32
    shaderStorageBufferArrayDynamicIndexing*: VkBool32
    shaderStorageImageArrayDynamicIndexing*: VkBool32
    shaderClipDistance*: VkBool32
    shaderCullDistance*: VkBool32
    shaderFloat64*: VkBool32
    shaderInt64*: VkBool32
    shaderInt16*: VkBool32
    shaderResourceResidency*: VkBool32
    shaderResourceMinLod*: VkBool32
    sparseBinding*: VkBool32
    sparseResidencyBuffer*: VkBool32
    sparseResidencyImage2D*: VkBool32
    sparseResidencyImage3D*: VkBool32
    sparseResidency2Samples*: VkBool32
    sparseResidency4Samples*: VkBool32
    sparseResidency8Samples*: VkBool32
    sparseResidency16Samples*: VkBool32
    sparseResidencyAliased*: VkBool32
    variableMultisampleRate*: VkBool32
    inheritedQueries*: VkBool32

  VkFormatProperties* = object
    linearTilingFeatures*: VkFormatFeatureFlags
    optimalTilingFeatures*: VkFormatFeatureFlags
    bufferFeatures*: VkFormatFeatureFlags

  VkExtent3D* = object
    width*: uint32
    height*: uint32
    depth*: uint32

  VkImageFormatProperties* = object
    maxExtent*: VkExtent3D
    maxMipLevels*: uint32
    maxArrayLayers*: uint32
    sampleCounts*: VkSampleCountFlags
    maxResourceSize*: VkDeviceSize

  VkPhysicalDeviceLimits* = object
    maxImageDimension1D*: uint32
    maxImageDimension2D*: uint32
    maxImageDimension3D*: uint32
    maxImageDimensionCube*: uint32
    maxImageArrayLayers*: uint32
    maxTexelBufferElements*: uint32
    maxUniformBufferRange*: uint32
    maxStorageBufferRange*: uint32
    maxPushConstantsSize*: uint32
    maxMemoryAllocationCount*: uint32
    maxSamplerAllocationCount*: uint32
    bufferImageGranularity*: VkDeviceSize
    sparseAddressSpaceSize*: VkDeviceSize
    maxBoundDescriptorSets*: uint32
    maxPerStageDescriptorSamplers*: uint32
    maxPerStageDescriptorUniformBuffers*: uint32
    maxPerStageDescriptorStorageBuffers*: uint32
    maxPerStageDescriptorSampledImages*: uint32
    maxPerStageDescriptorStorageImages*: uint32
    maxPerStageDescriptorInputAttachments*: uint32
    maxPerStageResources*: uint32
    maxDescriptorSetSamplers*: uint32
    maxDescriptorSetUniformBuffers*: uint32
    maxDescriptorSetUniformBuffersDynamic*: uint32
    maxDescriptorSetStorageBuffers*: uint32
    maxDescriptorSetStorageBuffersDynamic*: uint32
    maxDescriptorSetSampledImages*: uint32
    maxDescriptorSetStorageImages*: uint32
    maxDescriptorSetInputAttachments*: uint32
    maxVertexInputAttributes*: uint32
    maxVertexInputBindings*: uint32
    maxVertexInputAttributeOffset*: uint32
    maxVertexInputBindingStride*: uint32
    maxVertexOutputComponents*: uint32
    maxTessellationGenerationLevel*: uint32
    maxTessellationPatchSize*: uint32
    maxTessellationControlPerVertexInputComponents*: uint32
    maxTessellationControlPerVertexOutputComponents*: uint32
    maxTessellationControlPerPatchOutputComponents*: uint32
    maxTessellationControlTotalOutputComponents*: uint32
    maxTessellationEvaluationInputComponents*: uint32
    maxTessellationEvaluationOutputComponents*: uint32
    maxGeometryShaderInvocations*: uint32
    maxGeometryInputComponents*: uint32
    maxGeometryOutputComponents*: uint32
    maxGeometryOutputVertices*: uint32
    maxGeometryTotalOutputComponents*: uint32
    maxFragmentInputComponents*: uint32
    maxFragmentOutputAttachments*: uint32
    maxFragmentDualSrcAttachments*: uint32
    maxFragmentCombinedOutputResources*: uint32
    maxComputeSharedMemorySize*: uint32
    maxComputeWorkGroupCount*: array[3, uint32]
    maxComputeWorkGroupInvocations*: uint32
    maxComputeWorkGroupSize*: array[3, uint32]
    subPixelPrecisionBits*: uint32
    subTexelPrecisionBits*: uint32
    mipmapPrecisionBits*: uint32
    maxDrawIndexedIndexValue*: uint32
    maxDrawIndirectCount*: uint32
    maxSamplerLodBias*: cfloat
    maxSamplerAnisotropy*: cfloat
    maxViewports*: uint32
    maxViewportDimensions*: array[2, uint32]
    viewportBoundsRange*: array[2, cfloat]
    viewportSubPixelBits*: uint32
    minMemoryMapAlignment*: csize
    minTexelBufferOffsetAlignment*: VkDeviceSize
    minUniformBufferOffsetAlignment*: VkDeviceSize
    minStorageBufferOffsetAlignment*: VkDeviceSize
    minTexelOffset*:  int32
    maxTexelOffset*: uint32
    minTexelGatherOffset*:  int32
    maxTexelGatherOffset*: uint32
    minInterpolationOffset*: cfloat
    maxInterpolationOffset*: cfloat
    subPixelInterpolationOffsetBits*: uint32
    maxFramebufferWidth*: uint32
    maxFramebufferHeight*: uint32
    maxFramebufferLayers*: uint32
    framebufferColorSampleCounts*: VkSampleCountFlags
    framebufferDepthSampleCounts*: VkSampleCountFlags
    framebufferStencilSampleCounts*: VkSampleCountFlags
    framebufferNoAttachmentsSampleCounts*: VkSampleCountFlags
    maxColorAttachments*: uint32
    sampledImageColorSampleCounts*: VkSampleCountFlags
    sampledImageIntegerSampleCounts*: VkSampleCountFlags
    sampledImageDepthSampleCounts*: VkSampleCountFlags
    sampledImageStencilSampleCounts*: VkSampleCountFlags
    storageImageSampleCounts*: VkSampleCountFlags
    maxSampleMaskWords*: uint32
    timestampComputeAndGraphics*: VkBool32
    timestampPeriod*: cfloat
    maxClipDistances*: uint32
    maxCullDistances*: uint32
    maxCombinedClipAndCullDistances*: uint32
    discreteQueuePriorities*: uint32
    pointSizeRange*: array[2, cfloat]
    lineWidthRange*: array[2, cfloat]
    pointSizeGranularity*: cfloat
    lineWidthGranularity*: cfloat
    strictLines*: VkBool32
    standardSampleLocations*: VkBool32
    optimalBufferCopyOffsetAlignment*: VkDeviceSize
    optimalBufferCopyRowPitchAlignment*: VkDeviceSize
    nonCoherentAtomSize*: VkDeviceSize

  VkPhysicalDeviceSparseProperties* = object
    residencyStandard2DBlockShape*: VkBool32
    residencyStandard2DMultisampleBlockShape*: VkBool32
    residencyStandard3DBlockShape*: VkBool32
    residencyAlignedMipSize*: VkBool32
    residencyNonResidentStrict*: VkBool32

  VkPhysicalDeviceProperties* = object
    apiVersion*: uint32
    driverVersion*: uint32
    vendorID*: uint32
    deviceID*: uint32
    deviceType*: VkPhysicalDeviceType
    deviceName*: array[vkMaxPhysicalDeviceNameSize, char]
    pipelineCacheUUID*: array[vkUuidSize,  uint8]
    limits*: VkPhysicalDeviceLimits
    sparseProperties*: VkPhysicalDeviceSparseProperties

  VkQueueFamilyProperties* = object
    queueFlags*: VkQueueFlags
    queueCount*: uint32
    timestampValidBits*: uint32
    minImageTransferGranularity*: VkExtent3D

  VkMemoryType* = object
    propertyFlags*: VkMemoryPropertyFlags
    heapIndex*: uint32

  VkMemoryHeap* = object
    size*: VkDeviceSize
    flags*: VkMemoryHeapFlags

  VkPhysicalDeviceMemoryProperties* = object
    memoryTypeCount*: uint32
    memoryTypes*: array[vkMaxMemoryTypes, VkMemoryType]
    memoryHeapCount*: uint32
    memoryHeaps*: array[vkMaxMemoryHeaps, VkMemoryHeap]

  PFN_vkVoidFunction* = proc () {.cdecl.}

  VkDeviceQueueCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceQueueCreateFlags
    queueFamilyIndex*: uint32
    queueCount*: uint32
    pQueuePriorities*: ptr cfloat

  VkDeviceCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDeviceCreateFlags
    queueCreateInfoCount*: uint32
    pQueueCreateInfos*: ptr VkDeviceQueueCreateInfo
    enabledLayerCount*: uint32
    ppEnabledLayerNames*: cstringArray
    enabledExtensionCount*: uint32
    ppEnabledExtensionNames*: cstringArray
    pEnabledFeatures*: ptr VkPhysicalDeviceFeatures

  VkExtensionProperties* = object
    extensionName*: array[vkMaxExtensionNameSize, char]
    specVersion*: uint32

  VkLayerProperties* = object
    layerName*: array[vkMaxExtensionNameSize, char]
    specVersion*: uint32
    implementationVersion*: uint32
    description*: array[vkMaxDescriptionSize, char]

  VkSubmitInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr VkSemaphore
    pWaitDstStageMask*: ptr VkPipelineStageFlags
    commandBufferCount*: uint32
    pCommandBuffers*: ptr VkCommandBuffer
    signalSemaphoreCount*: uint32
    pSignalSemaphores*: ptr VkSemaphore

  VkMemoryAllocateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    allocationSize*: VkDeviceSize
    memoryTypeIndex*: uint32

  VkMappedMemoryRange* = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory
    offset*: VkDeviceSize
    size*: VkDeviceSize

  VkMemoryRequirements* = object
    size*: VkDeviceSize
    alignment*: VkDeviceSize
    memoryTypeBits*: uint32

  VkSparseImageFormatProperties* = object
    aspectMask*: VkImageAspectFlags
    imageGranularity*: VkExtent3D
    flags*: VkSparseImageFormatFlags

  VkSparseImageMemoryRequirements* = object
    formatProperties*: VkSparseImageFormatProperties
    imageMipTailFirstLod*: uint32
    imageMipTailSize*: VkDeviceSize
    imageMipTailOffset*: VkDeviceSize
    imageMipTailStride*: VkDeviceSize

  VkSparseMemoryBind* = object
    resourceOffset*: VkDeviceSize
    size*: VkDeviceSize
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize
    flags*: VkSparseMemoryBindFlags

  VkSparseBufferMemoryBindInfo* = object
    buffer*: VkBuffer
    bindCount*: uint32
    pBinds*: ptr VkSparseMemoryBind

  VkSparseImageOpaqueMemoryBindInfo* = object
    image*: VkImage
    bindCount*: uint32
    pBinds*: ptr VkSparseMemoryBind

  VkImageSubresource* = object
    aspectMask*: VkImageAspectFlags
    mipLevel*: uint32
    arrayLayer*: uint32

  VkOffset3D* = object
    x*:  int32
    y*:  int32
    z*:  int32

  VkSparseImageMemoryBind* = object
    subresource*: VkImageSubresource
    offset*: VkOffset3D
    extent*: VkExtent3D
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize
    flags*: VkSparseMemoryBindFlags

  VkSparseImageMemoryBindInfo* = object
    image*: VkImage
    bindCount*: uint32
    pBinds*: ptr VkSparseImageMemoryBind

  VkBindSparseInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr VkSemaphore
    bufferBindCount*: uint32
    pBufferBinds*: ptr VkSparseBufferMemoryBindInfo
    imageOpaqueBindCount*: uint32
    pImageOpaqueBinds*: ptr VkSparseImageOpaqueMemoryBindInfo
    imageBindCount*: uint32
    pImageBinds*: ptr VkSparseImageMemoryBindInfo
    signalSemaphoreCount*: uint32
    pSignalSemaphores*: ptr VkSemaphore

  VkFenceCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkFenceCreateFlags

  VkSemaphoreCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSemaphoreCreateFlags

  VkEventCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkEventCreateFlags

  VkQueryPoolCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkQueryPoolCreateFlags
    queryType*: VkQueryType
    queryCount*: uint32
    pipelineStatistics*: VkQueryPipelineStatisticFlags

  VkBufferCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkBufferCreateFlags
    size*: VkDeviceSize
    usage*: VkBufferUsageFlags
    sharingMode*: VkSharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32

  VkBufferViewCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkBufferViewCreateFlags
    buffer*: VkBuffer
    format*: VkFormat
    offset*: VkDeviceSize
    range*: VkDeviceSize

  VkImageCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkImageCreateFlags
    imageType*: VkImageType
    format*: VkFormat
    extent*: VkExtent3D
    mipLevels*: uint32
    arrayLayers*: uint32
    samples*: VkSampleCountFlagBits
    tiling*: VkImageTiling
    usage*: VkImageUsageFlags
    sharingMode*: VkSharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32
    initialLayout*: VkImageLayout

  VkSubresourceLayout* = object
    offset*: VkDeviceSize
    size*: VkDeviceSize
    rowPitch*: VkDeviceSize
    arrayPitch*: VkDeviceSize
    depthPitch*: VkDeviceSize

  VkComponentMapping* = object
    r*: VkComponentSwizzle
    g*: VkComponentSwizzle
    b*: VkComponentSwizzle
    a*: VkComponentSwizzle

  VkImageSubresourceRange* = object
    aspectMask*: VkImageAspectFlags
    baseMipLevel*: uint32
    levelCount*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32

  VkImageViewCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkImageViewCreateFlags
    image*: VkImage
    viewType*: VkImageViewType
    format*: VkFormat
    components*: VkComponentMapping
    subresourceRange*: VkImageSubresourceRange

  VkShaderModuleCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkShaderModuleCreateFlags
    codeSize*: csize
    pCode*: ptr uint32

  VkPipelineCacheCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCacheCreateFlags
    initialDataSize*: csize
    pInitialData*: pointer

  VkSpecializationMapEntry* = object
    constantID*: uint32
    offset*: uint32
    size*: csize

  VkSpecializationInfo* = object
    mapEntryCount*: uint32
    pMapEntries*: ptr VkSpecializationMapEntry
    dataSize*: csize
    pData*: pointer

  VkPipelineShaderStageCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineShaderStageCreateFlags
    stage*: VkShaderStageFlagBits
    module*: VkShaderModule
    pName*: cstring
    pSpecializationInfo*: ptr VkSpecializationInfo

  VkVertexInputBindingDescription* = object
    binding*: uint32
    stride*: uint32
    inputRate*: VkVertexInputRate

  VkVertexInputAttributeDescription* = object
    location*: uint32
    binding*: uint32
    format*: VkFormat
    offset*: uint32

  VkPipelineVertexInputStateCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineVertexInputStateCreateFlags
    vertexBindingDescriptionCount*: uint32
    pVertexBindingDescriptions*: ptr VkVertexInputBindingDescription
    vertexAttributeDescriptionCount*: uint32
    pVertexAttributeDescriptions*: ptr VkVertexInputAttributeDescription

  VkPipelineInputAssemblyStateCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineInputAssemblyStateCreateFlags
    topology*: VkPrimitiveTopology
    primitiveRestartEnable*: VkBool32

  VkPipelineTessellationStateCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineTessellationStateCreateFlags
    patchControlPoints*: uint32

  VkViewport* = object
    x*: cfloat
    y*: cfloat
    width*: cfloat
    height*: cfloat
    minDepth*: cfloat
    maxDepth*: cfloat

  VkOffset2D* = object
    x*:  int32
    y*:  int32

  VkExtent2D* = object
    width*: uint32
    height*: uint32

  VkRect2D* = object
    offset*: VkOffset2D
    extent*: VkExtent2D

  VkPipelineViewportStateCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineViewportStateCreateFlags
    viewportCount*: uint32
    pViewports*: ptr VkViewport
    scissorCount*: uint32
    pScissors*: ptr VkRect2D

  VkPipelineRasterizationStateCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineRasterizationStateCreateFlags
    depthClampEnable*: VkBool32
    rasterizerDiscardEnable*: VkBool32
    polygonMode*: VkPolygonMode
    cullMode*: VkCullModeFlags
    frontFace*: VkFrontFace
    depthBiasEnable*: VkBool32
    depthBiasConstantFactor*: cfloat
    depthBiasClamp*: cfloat
    depthBiasSlopeFactor*: cfloat
    lineWidth*: cfloat

  VkPipelineMultisampleStateCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineMultisampleStateCreateFlags
    rasterizationSamples*: VkSampleCountFlagBits
    sampleShadingEnable*: VkBool32
    minSampleShading*: cfloat
    pSampleMask*: ptr VkSampleMask
    alphaToCoverageEnable*: VkBool32
    alphaToOneEnable*: VkBool32

  VkStencilOpState* = object
    failOp*: VkStencilOp
    passOp*: VkStencilOp
    depthFailOp*: VkStencilOp
    compareOp*: VkCompareOp
    compareMask*: uint32
    writeMask*: uint32
    reference*: uint32

  VkPipelineDepthStencilStateCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineDepthStencilStateCreateFlags
    depthTestEnable*: VkBool32
    depthWriteEnable*: VkBool32
    depthCompareOp*: VkCompareOp
    depthBoundsTestEnable*: VkBool32
    stencilTestEnable*: VkBool32
    front*: VkStencilOpState
    back*: VkStencilOpState
    minDepthBounds*: cfloat
    maxDepthBounds*: cfloat

  VkPipelineColorBlendAttachmentState* = object
    blendEnable*: VkBool32
    srcColorBlendFactor*: VkBlendFactor
    dstColorBlendFactor*: VkBlendFactor
    colorBlendOp*: VkBlendOp
    srcAlphaBlendFactor*: VkBlendFactor
    dstAlphaBlendFactor*: VkBlendFactor
    alphaBlendOp*: VkBlendOp
    colorWriteMask*: VkColorComponentFlags

  VkPipelineColorBlendStateCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineColorBlendStateCreateFlags
    logicOpEnable*: VkBool32
    logicOp*: VkLogicOp
    attachmentCount*: uint32
    pAttachments*: ptr VkPipelineColorBlendAttachmentState
    blendConstants*: array[4, cfloat]

  VkPipelineDynamicStateCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineDynamicStateCreateFlags
    dynamicStateCount*: uint32
    pDynamicStates*: ptr VkDynamicState

  VkGraphicsPipelineCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCreateFlags
    stageCount*: uint32
    pStages*: ptr VkPipelineShaderStageCreateInfo
    pVertexInputState*: ptr VkPipelineVertexInputStateCreateInfo
    pInputAssemblyState*: ptr VkPipelineInputAssemblyStateCreateInfo
    pTessellationState*: ptr VkPipelineTessellationStateCreateInfo
    pViewportState*: ptr VkPipelineViewportStateCreateInfo
    pRasterizationState*: ptr VkPipelineRasterizationStateCreateInfo
    pMultisampleState*: ptr VkPipelineMultisampleStateCreateInfo
    pDepthStencilState*: ptr VkPipelineDepthStencilStateCreateInfo
    pColorBlendState*: ptr VkPipelineColorBlendStateCreateInfo
    pDynamicState*: ptr VkPipelineDynamicStateCreateInfo
    layout*: VkPipelineLayout
    renderPass*: VkRenderPass
    subpass*: uint32
    basePipelineHandle*: VkPipeline
    basePipelineIndex*:  int32

  VkComputePipelineCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCreateFlags
    stage*: VkPipelineShaderStageCreateInfo
    layout*: VkPipelineLayout
    basePipelineHandle*: VkPipeline
    basePipelineIndex*:  int32

  VkPushConstantRange* = object
    stageFlags*: VkShaderStageFlags
    offset*: uint32
    size*: uint32

  VkPipelineLayoutCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineLayoutCreateFlags
    setLayoutCount*: uint32
    pSetLayouts*: ptr VkDescriptorSetLayout
    pushConstantRangeCount*: uint32
    pPushConstantRanges*: ptr VkPushConstantRange

  VkSamplerCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSamplerCreateFlags
    magFilter*: VkFilter
    minFilter*: VkFilter
    mipmapMode*: VkSamplerMipmapMode
    addressModeU*: VkSamplerAddressMode
    addressModeV*: VkSamplerAddressMode
    addressModeW*: VkSamplerAddressMode
    mipLodBias*: cfloat
    anisotropyEnable*: VkBool32
    maxAnisotropy*: cfloat
    compareEnable*: VkBool32
    compareOp*: VkCompareOp
    minLod*: cfloat
    maxLod*: cfloat
    borderColor*: VkBorderColor
    unnormalizedCoordinates*: VkBool32

  VkDescriptorSetLayoutBinding* = object
    binding*: uint32
    descriptorType*: VkDescriptorType
    descriptorCount*: uint32
    stageFlags*: VkShaderStageFlags
    pImmutableSamplers*: ptr VkSampler

  VkDescriptorSetLayoutCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDescriptorSetLayoutCreateFlags
    bindingCount*: uint32
    pBindings*: ptr VkDescriptorSetLayoutBinding

  VkDescriptorPoolSize* = object
    descriptorType*: VkDescriptorType
    descriptorCount*: uint32

  VkDescriptorPoolCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDescriptorPoolCreateFlags
    maxSets*: uint32
    poolSizeCount*: uint32
    pPoolSizes*: ptr VkDescriptorPoolSize

  VkDescriptorSetAllocateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    descriptorPool*: VkDescriptorPool
    descriptorSetCount*: uint32
    pSetLayouts*: ptr VkDescriptorSetLayout

  VkDescriptorImageInfo* = object
    sampler*: VkSampler
    imageView*: VkImageView
    imageLayout*: VkImageLayout

  VkDescriptorBufferInfo* = object
    buffer*: VkBuffer
    offset*: VkDeviceSize
    range*: VkDeviceSize

  VkWriteDescriptorSet* = object
    sType*: VkStructureType
    pNext*: pointer
    dstSet*: VkDescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: VkDescriptorType
    pImageInfo*: ptr VkDescriptorImageInfo
    pBufferInfo*: ptr VkDescriptorBufferInfo
    pTexelBufferView*: ptr VkBufferView

  VkCopyDescriptorSet* = object
    sType*: VkStructureType
    pNext*: pointer
    srcSet*: VkDescriptorSet
    srcBinding*: uint32
    srcArrayElement*: uint32
    dstSet*: VkDescriptorSet
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32

  VkFramebufferCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkFramebufferCreateFlags
    renderPass*: VkRenderPass
    attachmentCount*: uint32
    pAttachments*: ptr VkImageView
    width*: uint32
    height*: uint32
    layers*: uint32

  VkAttachmentDescription* = object
    flags*: VkAttachmentDescriptionFlags
    format*: VkFormat
    samples*: VkSampleCountFlagBits
    loadOp*: VkAttachmentLoadOp
    storeOp*: VkAttachmentStoreOp
    stencilLoadOp*: VkAttachmentLoadOp
    stencilStoreOp*: VkAttachmentStoreOp
    initialLayout*: VkImageLayout
    finalLayout*: VkImageLayout

  VkAttachmentReference* = object
    attachment*: uint32
    layout*: VkImageLayout

  VkSubpassDescription* = object
    flags*: VkSubpassDescriptionFlags
    pipelineBindPoint*: VkPipelineBindPoint
    inputAttachmentCount*: uint32
    pInputAttachments*: ptr VkAttachmentReference
    colorAttachmentCount*: uint32
    pColorAttachments*: ptr VkAttachmentReference
    pResolveAttachments*: ptr VkAttachmentReference
    pDepthStencilAttachment*: ptr VkAttachmentReference
    preserveAttachmentCount*: uint32
    pPreserveAttachments*: ptr uint32

  VkSubpassDependency* = object
    srcSubpass*: uint32
    dstSubpass*: uint32
    srcStageMask*: VkPipelineStageFlags
    dstStageMask*: VkPipelineStageFlags
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags
    dependencyFlags*: VkDependencyFlags

  VkRenderPassCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkRenderPassCreateFlags
    attachmentCount*: uint32
    pAttachments*: ptr VkAttachmentDescription
    subpassCount*: uint32
    pSubpasses*: ptr VkSubpassDescription
    dependencyCount*: uint32
    pDependencies*: ptr VkSubpassDependency

  VkCommandPoolCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkCommandPoolCreateFlags
    queueFamilyIndex*: uint32

  VkCommandBufferAllocateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    commandPool*: VkCommandPool
    level*: VkCommandBufferLevel
    commandBufferCount*: uint32

  VkCommandBufferInheritanceInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    renderPass*: VkRenderPass
    subpass*: uint32
    framebuffer*: VkFramebuffer
    occlusionQueryEnable*: VkBool32
    queryFlags*: VkQueryControlFlags
    pipelineStatistics*: VkQueryPipelineStatisticFlags

  VkCommandBufferBeginInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkCommandBufferUsageFlags
    pInheritanceInfo*: ptr VkCommandBufferInheritanceInfo

  VkBufferCopy* = object
    srcOffset*: VkDeviceSize
    dstOffset*: VkDeviceSize
    size*: VkDeviceSize

  VkImageSubresourceLayers* = object
    aspectMask*: VkImageAspectFlags
    mipLevel*: uint32
    baseArrayLayer*: uint32
    layerCount*: uint32

  VkImageCopy* = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkImageBlit* = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffsets*: array[2, VkOffset3D]
    dstSubresource*: VkImageSubresourceLayers
    dstOffsets*: array[2, VkOffset3D]

  VkBufferImageCopy* = object
    bufferOffset*: VkDeviceSize
    bufferRowLength*: uint32
    bufferImageHeight*: uint32
    imageSubresource*: VkImageSubresourceLayers
    imageOffset*: VkOffset3D
    imageExtent*: VkExtent3D

  VkClearColorValue* {.union.} = object
    float32*: array[4, cfloat]
    int32*: array[4,  int32]
    uint32*: array[4, uint32]

  VkClearDepthStencilValue* = object
    depth*: cfloat
    stencil*: uint32

  VkClearValue* {.union.} = object
    color*: VkClearColorValue
    depthStencil*: VkClearDepthStencilValue

  VkClearAttachment* = object
    aspectMask*: VkImageAspectFlags
    colorAttachment*: uint32
    clearValue*: VkClearValue

  VkClearRect* = object
    rect*: VkRect2D
    baseArrayLayer*: uint32
    layerCount*: uint32

  VkImageResolve* = object
    srcSubresource*: VkImageSubresourceLayers
    srcOffset*: VkOffset3D
    dstSubresource*: VkImageSubresourceLayers
    dstOffset*: VkOffset3D
    extent*: VkExtent3D

  VkMemoryBarrier* = object
    sType*: VkStructureType
    pNext*: pointer
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags

  VkBufferMemoryBarrier* = object
    sType*: VkStructureType
    pNext*: pointer
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    buffer*: VkBuffer
    offset*: VkDeviceSize
    size*: VkDeviceSize

  VkImageMemoryBarrier* = object
    sType*: VkStructureType
    pNext*: pointer
    srcAccessMask*: VkAccessFlags
    dstAccessMask*: VkAccessFlags
    oldLayout*: VkImageLayout
    newLayout*: VkImageLayout
    srcQueueFamilyIndex*: uint32
    dstQueueFamilyIndex*: uint32
    image*: VkImage
    subresourceRange*: VkImageSubresourceRange

  VkRenderPassBeginInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    renderPass*: VkRenderPass
    framebuffer*: VkFramebuffer
    renderArea*: VkRect2D
    clearValueCount*: uint32
    pClearValues*: ptr VkClearValue

  VkDispatchIndirectCommand* = object
    x*: uint32
    y*: uint32
    z*: uint32

  VkDrawIndexedIndirectCommand* = object
    indexCount*: uint32
    instanceCount*: uint32
    firstIndex*: uint32
    vertexOffset*:  int32
    firstInstance*: uint32

  VkDrawIndirectCommand* = object
    vertexCount*: uint32
    instanceCount*: uint32
    firstVertex*: uint32
    firstInstance*: uint32

  PFN_vkCreateInstance* = proc (pCreateInfo: ptr VkInstanceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pInstance: ptr VkInstance): VkResult {.cdecl.}
  PFN_vkDestroyInstance* = proc (instance: VkInstance; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkEnumeratePhysicalDevices* = proc (instance: VkInstance; pPhysicalDeviceCount: ptr uint32; pPhysicalDevices: ptr VkPhysicalDevice): VkResult {.cdecl.}
  PFN_vkGetPhysicalDeviceFeatures* = proc (physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures) {.cdecl.}
  PFN_vkGetPhysicalDeviceFormatProperties* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties) {.cdecl.}
  PFN_vkGetPhysicalDeviceImageFormatProperties* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; imageType: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; pImageFormatProperties: ptr VkImageFormatProperties): VkResult {.cdecl.}
  PFN_vkGetPhysicalDeviceProperties* = proc (physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties) {.cdecl.}
  PFN_vkGetPhysicalDeviceQueueFamilyProperties* = proc (physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties) {.cdecl.}
  PFN_vkGetPhysicalDeviceMemoryProperties* = proc (physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties) {.cdecl.}
  PFN_vkGetInstanceProcAddr* = proc (instance: VkInstance; pName: cstring): PFN_vkVoidFunction {.cdecl.}
  PFN_vkGetDeviceProcAddr* = proc (device: VkDevice; pName: cstring): PFN_vkVoidFunction {.cdecl.}
  PFN_vkCreateDevice* = proc (physicalDevice: VkPhysicalDevice; pCreateInfo: ptr VkDeviceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDevice: ptr VkDevice): VkResult {.cdecl.}
  PFN_vkDestroyDevice* = proc (device: VkDevice; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkEnumerateInstanceExtensionProperties* = proc (pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl.}
  PFN_vkEnumerateDeviceExtensionProperties* = proc (physicalDevice: VkPhysicalDevice; pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl.}
  PFN_vkEnumerateInstanceLayerProperties* = proc (pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl.}
  PFN_vkEnumerateDeviceLayerProperties* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl.}
  PFN_vkGetDeviceQueue* = proc (device: VkDevice; queueFamilyIndex: uint32; queueIndex: uint32; pQueue: ptr VkQueue) {.cdecl.}
  PFN_vkQueueSubmit* = proc (queue: VkQueue; submitCount: uint32; pSubmits: ptr VkSubmitInfo; fence: VkFence): VkResult {.cdecl.}
  PFN_vkQueueWaitIdle* = proc (queue: VkQueue): VkResult {.cdecl.}
  PFN_vkDeviceWaitIdle* = proc (device: VkDevice): VkResult {.cdecl.}
  PFN_vkAllocateMemory* = proc (device: VkDevice; pAllocateInfo: ptr VkMemoryAllocateInfo; pAllocator: ptr VkAllocationCallbacks; pMemory: ptr VkDeviceMemory): VkResult {.cdecl.}
  PFN_vkFreeMemory* = proc (device: VkDevice; memory: VkDeviceMemory; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkMapMemory* = proc (device: VkDevice; memory: VkDeviceMemory; offset: VkDeviceSize; size: VkDeviceSize; flags: VkMemoryMapFlags; ppData: ptr pointer): VkResult {.cdecl.}
  PFN_vkUnmapMemory* = proc (device: VkDevice; memory: VkDeviceMemory) {.cdecl.}
  PFN_vkFlushMappedMemoryRanges* = proc (device: VkDevice; memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult {.cdecl.}
  PFN_vkInvalidateMappedMemoryRanges* = proc (device: VkDevice; memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult {.cdecl.}
  PFN_vkGetDeviceMemoryCommitment* = proc (device: VkDevice; memory: VkDeviceMemory; pCommittedMemoryInBytes: ptr VkDeviceSize) {.cdecl.}
  PFN_vkBindBufferMemory* = proc (device: VkDevice; buffer: VkBuffer; memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult {.cdecl.}
  PFN_vkBindImageMemory* = proc (device: VkDevice; image: VkImage; memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult {.cdecl.}
  PFN_vkGetBufferMemoryRequirements* = proc (device: VkDevice; buffer: VkBuffer; pMemoryRequirements: ptr VkMemoryRequirements) {.cdecl.}
  PFN_vkGetImageMemoryRequirements* = proc (device: VkDevice; image: VkImage; pMemoryRequirements: ptr VkMemoryRequirements) {.cdecl.}
  PFN_vkGetImageSparseMemoryRequirements* = proc (device: VkDevice; image: VkImage; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements) {.cdecl.}
  PFN_vkGetPhysicalDeviceSparseImageFormatProperties* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; imageType: VkImageType; samples: VkSampleCountFlagBits; usage: VkImageUsageFlags; tiling: VkImageTiling; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties) {.cdecl.}
  PFN_vkQueueBindSparse* = proc (queue: VkQueue; bindInfoCount: uint32; pBindInfo: ptr VkBindSparseInfo; fence: VkFence): VkResult {.cdecl.}
  PFN_vkCreateFence* = proc (device: VkDevice; pCreateInfo: ptr VkFenceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl.}
  PFN_vkDestroyFence* = proc (device: VkDevice; fence: VkFence; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkResetFences* = proc (device: VkDevice; fenceCount: uint32; pFences: ptr VkFence): VkResult {.cdecl.}
  PFN_vkGetFenceStatus* = proc (device: VkDevice; fence: VkFence): VkResult {.cdecl.}
  PFN_vkWaitForFences* = proc (device: VkDevice; fenceCount: uint32; pFences: ptr VkFence; waitAll: VkBool32; timeout: uint64): VkResult {.cdecl.}
  PFN_vkCreateSemaphore* = proc (device: VkDevice; pCreateInfo: ptr VkSemaphoreCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSemaphore: ptr VkSemaphore): VkResult {.cdecl.}
  PFN_vkDestroySemaphore* = proc (device: VkDevice; semaphore: VkSemaphore; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreateEvent* = proc (device: VkDevice; pCreateInfo: ptr VkEventCreateInfo; pAllocator: ptr VkAllocationCallbacks; pEvent: ptr VkEvent): VkResult {.cdecl.}
  PFN_vkDestroyEvent* = proc (device: VkDevice; event: VkEvent; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkGetEventStatus* = proc (device: VkDevice; event: VkEvent): VkResult {.cdecl.}
  PFN_vkSetEvent* = proc (device: VkDevice; event: VkEvent): VkResult {.cdecl.}
  PFN_vkResetEvent* = proc (device: VkDevice; event: VkEvent): VkResult {.cdecl.}
  PFN_vkCreateQueryPool* = proc (device: VkDevice; pCreateInfo: ptr VkQueryPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pQueryPool: ptr VkQueryPool): VkResult {.cdecl.}
  PFN_vkDestroyQueryPool* = proc (device: VkDevice; queryPool: VkQueryPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkGetQueryPoolResults* = proc (device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dataSize: csize; pData: pointer; stride: VkDeviceSize; flags: VkQueryResultFlags): VkResult {.cdecl.}
  PFN_vkCreateBuffer* = proc (device: VkDevice; pCreateInfo: ptr VkBufferCreateInfo; pAllocator: ptr VkAllocationCallbacks; pBuffer: ptr VkBuffer): VkResult {.cdecl.}
  PFN_vkDestroyBuffer* = proc (device: VkDevice; buffer: VkBuffer; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreateBufferView* = proc (device: VkDevice; pCreateInfo: ptr VkBufferViewCreateInfo; pAllocator: ptr VkAllocationCallbacks; pView: ptr VkBufferView): VkResult {.cdecl.}
  PFN_vkDestroyBufferView* = proc (device: VkDevice; bufferView: VkBufferView; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreateImage* = proc (device: VkDevice; pCreateInfo: ptr VkImageCreateInfo; pAllocator: ptr VkAllocationCallbacks; pImage: ptr VkImage): VkResult {.cdecl.}
  PFN_vkDestroyImage* = proc (device: VkDevice; image: VkImage; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkGetImageSubresourceLayout* = proc (device: VkDevice; image: VkImage; pSubresource: ptr VkImageSubresource; pLayout: ptr VkSubresourceLayout) {.cdecl.}
  PFN_vkCreateImageView* = proc (device: VkDevice; pCreateInfo: ptr VkImageViewCreateInfo; pAllocator: ptr VkAllocationCallbacks; pView: ptr VkImageView): VkResult {.cdecl.}
  PFN_vkDestroyImageView* = proc (device: VkDevice; imageView: VkImageView; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreateShaderModule* = proc (device: VkDevice; pCreateInfo: ptr VkShaderModuleCreateInfo; pAllocator: ptr VkAllocationCallbacks; pShaderModule: ptr VkShaderModule): VkResult {.cdecl.}
  PFN_vkDestroyShaderModule* = proc (device: VkDevice; shaderModule: VkShaderModule; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreatePipelineCache* = proc (device: VkDevice; pCreateInfo: ptr VkPipelineCacheCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelineCache: ptr VkPipelineCache): VkResult {.cdecl.}
  PFN_vkDestroyPipelineCache* = proc (device: VkDevice; pipelineCache: VkPipelineCache; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkGetPipelineCacheData* = proc (device: VkDevice; pipelineCache: VkPipelineCache; pDataSize: ptr csize; pData: pointer): VkResult {.cdecl.}
  PFN_vkMergePipelineCaches* = proc (device: VkDevice; dstCache: VkPipelineCache; srcCacheCount: uint32; pSrcCaches: ptr VkPipelineCache): VkResult {.cdecl.}
  PFN_vkCreateGraphicsPipelines* = proc (device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkGraphicsPipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl.}
  PFN_vkCreateComputePipelines* = proc (device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkComputePipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl.}
  PFN_vkDestroyPipeline* = proc (device: VkDevice; pipeline: VkPipeline; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreatePipelineLayout* = proc (device: VkDevice; pCreateInfo: ptr VkPipelineLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelineLayout: ptr VkPipelineLayout): VkResult {.cdecl.}
  PFN_vkDestroyPipelineLayout* = proc (device: VkDevice; pipelineLayout: VkPipelineLayout; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreateSampler* = proc (device: VkDevice; pCreateInfo: ptr VkSamplerCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSampler: ptr VkSampler): VkResult {.cdecl.}
  PFN_vkDestroySampler* = proc (device: VkDevice; sampler: VkSampler; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreateDescriptorSetLayout* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSetLayout: ptr VkDescriptorSetLayout): VkResult {.cdecl.}
  PFN_vkDestroyDescriptorSetLayout* = proc (device: VkDevice; descriptorSetLayout: VkDescriptorSetLayout; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreateDescriptorPool* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDescriptorPool: ptr VkDescriptorPool): VkResult {.cdecl.}
  PFN_vkDestroyDescriptorPool* = proc (device: VkDevice; descriptorPool: VkDescriptorPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkResetDescriptorPool* = proc (device: VkDevice; descriptorPool: VkDescriptorPool; flags: VkDescriptorPoolResetFlags): VkResult {.cdecl.}
  PFN_vkAllocateDescriptorSets* = proc (device: VkDevice; pAllocateInfo: ptr VkDescriptorSetAllocateInfo; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl.}
  PFN_vkFreeDescriptorSets* = proc (device: VkDevice; descriptorPool: VkDescriptorPool; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl.}
  PFN_vkUpdateDescriptorSets* = proc (device: VkDevice; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet; descriptorCopyCount: uint32; pDescriptorCopies: ptr VkCopyDescriptorSet) {.cdecl.}
  PFN_vkCreateFramebuffer* = proc (device: VkDevice; pCreateInfo: ptr VkFramebufferCreateInfo; pAllocator: ptr VkAllocationCallbacks; pFramebuffer: ptr VkFramebuffer): VkResult {.cdecl.}
  PFN_vkDestroyFramebuffer* = proc (device: VkDevice; framebuffer: VkFramebuffer; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreateRenderPass* = proc (device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo; pAllocator: ptr VkAllocationCallbacks; pRenderPass: ptr VkRenderPass): VkResult {.cdecl.}
  PFN_vkDestroyRenderPass* = proc (device: VkDevice; renderPass: VkRenderPass; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkGetRenderAreaGranularity* = proc (device: VkDevice; renderPass: VkRenderPass; pGranularity: ptr VkExtent2D) {.cdecl.}
  PFN_vkCreateCommandPool* = proc (device: VkDevice; pCreateInfo: ptr VkCommandPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pCommandPool: ptr VkCommandPool): VkResult {.cdecl.}
  PFN_vkDestroyCommandPool* = proc (device: VkDevice; commandPool: VkCommandPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkResetCommandPool* = proc (device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolResetFlags): VkResult {.cdecl.}
  PFN_vkAllocateCommandBuffers* = proc (device: VkDevice; pAllocateInfo: ptr VkCommandBufferAllocateInfo; pCommandBuffers: ptr VkCommandBuffer): VkResult {.cdecl.}
  PFN_vkFreeCommandBuffers* = proc (device: VkDevice; commandPool: VkCommandPool; commandBufferCount: uint32; pCommandBuffers: ptr VkCommandBuffer) {.cdecl.}
  PFN_vkBeginCommandBuffer* = proc (commandBuffer: VkCommandBuffer; pBeginInfo: ptr VkCommandBufferBeginInfo): VkResult {.cdecl.}
  PFN_vkEndCommandBuffer* = proc (commandBuffer: VkCommandBuffer): VkResult {.cdecl.}
  PFN_vkResetCommandBuffer* = proc (commandBuffer: VkCommandBuffer; flags: VkCommandBufferResetFlags): VkResult {.cdecl.}
  PFN_vkCmdBindPipeline* = proc (commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; pipeline: VkPipeline) {.cdecl.}
  PFN_vkCmdSetViewport* = proc (commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewports: ptr VkViewport) {.cdecl.}
  PFN_vkCmdSetScissor* = proc (commandBuffer: VkCommandBuffer; firstScissor: uint32; scissorCount: uint32; pScissors: ptr VkRect2D) {.cdecl.}
  PFN_vkCmdSetLineWidth* = proc (commandBuffer: VkCommandBuffer; lineWidth: cfloat) {.cdecl.}
  PFN_vkCmdSetDepthBias* = proc (commandBuffer: VkCommandBuffer; depthBiasConstantFactor: cfloat; depthBiasClamp: cfloat; depthBiasSlopeFactor: cfloat) {.cdecl.}
  PFN_vkCmdSetBlendConstants* = proc (commandBuffer: VkCommandBuffer; blendConstants: array[4, cfloat]) {.cdecl.}
  PFN_vkCmdSetDepthBounds* = proc (commandBuffer: VkCommandBuffer; minDepthBounds: cfloat; maxDepthBounds: cfloat) {.cdecl.}
  PFN_vkCmdSetStencilCompareMask* = proc (commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; compareMask: uint32) {.cdecl.}
  PFN_vkCmdSetStencilWriteMask* = proc (commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; writeMask: uint32) {.cdecl.}
  PFN_vkCmdSetStencilReference* = proc (commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; reference: uint32) {.cdecl.}
  PFN_vkCmdBindDescriptorSets* = proc (commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; layout: VkPipelineLayout; firstSet: uint32; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet; dynamicOffsetCount: uint32; pDynamicOffsets: ptr uint32) {.cdecl.}
  PFN_vkCmdBindIndexBuffer* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; indexType: VkIndexType) {.cdecl.}
  PFN_vkCmdBindVertexBuffers* = proc (commandBuffer: VkCommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr VkBuffer; pOffsets: ptr VkDeviceSize) {.cdecl.}
  PFN_vkCmdDraw* = proc (commandBuffer: VkCommandBuffer; vertexCount: uint32; instanceCount: uint32; firstVertex: uint32; firstInstance: uint32) {.cdecl.}
  PFN_vkCmdDrawIndexed* = proc (commandBuffer: VkCommandBuffer; indexCount: uint32; instanceCount: uint32; firstIndex: uint32; vertexOffset:  int32; firstInstance: uint32) {.cdecl.}
  PFN_vkCmdDrawIndirect* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl.}
  PFN_vkCmdDrawIndexedIndirect* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl.}
  PFN_vkCmdDispatch* = proc (commandBuffer: VkCommandBuffer; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl.}
  PFN_vkCmdDispatchIndirect* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize) {.cdecl.}
  PFN_vkCmdCopyBuffer* = proc (commandBuffer: VkCommandBuffer; srcBuffer: VkBuffer; dstBuffer: VkBuffer; regionCount: uint32; pRegions: ptr VkBufferCopy) {.cdecl.}
  PFN_vkCmdCopyImage* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageCopy) {.cdecl.}
  PFN_vkCmdBlitImage* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageBlit; filter: VkFilter) {.cdecl.}
  PFN_vkCmdCopyBufferToImage* = proc (commandBuffer: VkCommandBuffer; srcBuffer: VkBuffer; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkBufferImageCopy) {.cdecl.}
  PFN_vkCmdCopyImageToBuffer* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstBuffer: VkBuffer; regionCount: uint32; pRegions: ptr VkBufferImageCopy) {.cdecl.}
  PFN_vkCmdUpdateBuffer* = proc (commandBuffer: VkCommandBuffer; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; dataSize: VkDeviceSize; pData: pointer) {.cdecl.}
  PFN_vkCmdFillBuffer* = proc (commandBuffer: VkCommandBuffer; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; size: VkDeviceSize; data: uint32) {.cdecl.}
  PFN_vkCmdClearColorImage* = proc (commandBuffer: VkCommandBuffer; image: VkImage; imageLayout: VkImageLayout; pColor: ptr VkClearColorValue; rangeCount: uint32; pRanges: ptr VkImageSubresourceRange) {.cdecl.}
  PFN_vkCmdClearDepthStencilImage* = proc (commandBuffer: VkCommandBuffer; image: VkImage; imageLayout: VkImageLayout; pDepthStencil: ptr VkClearDepthStencilValue; rangeCount: uint32; pRanges: ptr VkImageSubresourceRange) {.cdecl.}
  PFN_vkCmdClearAttachments* = proc (commandBuffer: VkCommandBuffer; attachmentCount: uint32; pAttachments: ptr VkClearAttachment; rectCount: uint32; pRects: ptr VkClearRect) {.cdecl.}
  PFN_vkCmdResolveImage* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageResolve) {.cdecl.}
  PFN_vkCmdSetEvent* = proc (commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags) {.cdecl.}
  PFN_vkCmdResetEvent* = proc (commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags) {.cdecl.}
  PFN_vkCmdWaitEvents* = proc (commandBuffer: VkCommandBuffer; eventCount: uint32; pEvents: ptr VkEvent; srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr VkMemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr VkBufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr VkImageMemoryBarrier) {.cdecl.}
  PFN_vkCmdPipelineBarrier* = proc (commandBuffer: VkCommandBuffer; srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags; dependencyFlags: VkDependencyFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr VkMemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr VkBufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr VkImageMemoryBarrier) {.cdecl.}
  PFN_vkCmdBeginQuery* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32; flags: VkQueryControlFlags) {.cdecl.}
  PFN_vkCmdEndQuery* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32) {.cdecl.}
  PFN_vkCmdResetQueryPool* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32) {.cdecl.}
  PFN_vkCmdWriteTimestamp* = proc (commandBuffer: VkCommandBuffer; pipelineStage: VkPipelineStageFlagBits; queryPool: VkQueryPool; query: uint32) {.cdecl.}
  PFN_vkCmdCopyQueryPoolResults* = proc (commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; stride: VkDeviceSize; flags: VkQueryResultFlags) {.cdecl.}
  PFN_vkCmdPushConstants* = proc (commandBuffer: VkCommandBuffer; layout: VkPipelineLayout; stageFlags: VkShaderStageFlags; offset: uint32; size: uint32; pValues: pointer) {.cdecl.}
  PFN_vkCmdBeginRenderPass* = proc (commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; contents: VkSubpassContents) {.cdecl.}
  PFN_vkCmdNextSubpass* = proc (commandBuffer: VkCommandBuffer; contents: VkSubpassContents) {.cdecl.}
  PFN_vkCmdEndRenderPass* = proc (commandBuffer: VkCommandBuffer) {.cdecl.}
  PFN_vkCmdExecuteCommands* = proc (commandBuffer: VkCommandBuffer; commandBufferCount: uint32; pCommandBuffers: ptr VkCommandBuffer) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCreateInstance*(pCreateInfo: ptr VkInstanceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pInstance: ptr VkInstance): VkResult {.cdecl, importc.}
  proc vkDestroyInstance*(instance: VkInstance; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkEnumeratePhysicalDevices*(instance: VkInstance; pPhysicalDeviceCount: ptr uint32; pPhysicalDevices: ptr VkPhysicalDevice): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceFeatures*(physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures) {.cdecl, importc.}
  proc vkGetPhysicalDeviceFormatProperties*(physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceImageFormatProperties*(physicalDevice: VkPhysicalDevice; format: VkFormat; imageType: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; pImageFormatProperties: ptr VkImageFormatProperties): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceProperties*(physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceQueueFamilyProperties*(physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties) {.cdecl, importc.}
  proc vkGetPhysicalDeviceMemoryProperties*(physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties) {.cdecl, importc.}
  proc vkGetInstanceProcAddr*(instance: VkInstance; pName: cstring): PFN_vkVoidFunction {.cdecl, importc.}
  proc vkGetDeviceProcAddr*(device: VkDevice; pName: cstring): PFN_vkVoidFunction {.cdecl, importc.}
  proc vkCreateDevice*(physicalDevice: VkPhysicalDevice; pCreateInfo: ptr VkDeviceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDevice: ptr VkDevice): VkResult {.cdecl, importc.}
  proc vkDestroyDevice*(device: VkDevice; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkEnumerateInstanceExtensionProperties*(pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl, importc.}
  proc vkEnumerateDeviceExtensionProperties*(physicalDevice: VkPhysicalDevice; pLayerName: cstring; pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties): VkResult {.cdecl, importc.}
  proc vkEnumerateInstanceLayerProperties*(pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl, importc.}
  proc vkEnumerateDeviceLayerProperties*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult {.cdecl, importc.}
  proc vkGetDeviceQueue*(device: VkDevice; queueFamilyIndex: uint32; queueIndex: uint32; pQueue: ptr VkQueue) {.cdecl, importc.}
  proc vkQueueSubmit*(queue: VkQueue; submitCount: uint32; pSubmits: ptr VkSubmitInfo; fence: VkFence): VkResult {.cdecl, importc.}
  proc vkQueueWaitIdle*(queue: VkQueue): VkResult {.cdecl, importc.}
  proc vkDeviceWaitIdle*(device: VkDevice): VkResult {.cdecl, importc.}
  proc vkAllocateMemory*(device: VkDevice; pAllocateInfo: ptr VkMemoryAllocateInfo; pAllocator: ptr VkAllocationCallbacks; pMemory: ptr VkDeviceMemory): VkResult {.cdecl, importc.}
  proc vkFreeMemory*(device: VkDevice; memory: VkDeviceMemory; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkMapMemory*(device: VkDevice; memory: VkDeviceMemory; offset: VkDeviceSize; size: VkDeviceSize; flags: VkMemoryMapFlags; ppData: ptr pointer): VkResult {.cdecl, importc.}
  proc vkUnmapMemory*(device: VkDevice; memory: VkDeviceMemory) {.cdecl, importc.}
  proc vkFlushMappedMemoryRanges*(device: VkDevice; memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult {.cdecl, importc.}
  proc vkInvalidateMappedMemoryRanges*(device: VkDevice; memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult {.cdecl, importc.}
  proc vkGetDeviceMemoryCommitment*(device: VkDevice; memory: VkDeviceMemory; pCommittedMemoryInBytes: ptr VkDeviceSize) {.cdecl, importc.}
  proc vkBindBufferMemory*(device: VkDevice; buffer: VkBuffer; memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult {.cdecl, importc.}
  proc vkBindImageMemory*(device: VkDevice; image: VkImage; memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult {.cdecl, importc.}
  proc vkGetBufferMemoryRequirements*(device: VkDevice; buffer: VkBuffer; pMemoryRequirements: ptr VkMemoryRequirements) {.cdecl, importc.}
  proc vkGetImageMemoryRequirements*(device: VkDevice; image: VkImage; pMemoryRequirements: ptr VkMemoryRequirements) {.cdecl, importc.}
  proc vkGetImageSparseMemoryRequirements*(device: VkDevice; image: VkImage; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements) {.cdecl, importc.}
  proc vkGetPhysicalDeviceSparseImageFormatProperties*(physicalDevice: VkPhysicalDevice; format: VkFormat; imageType: VkImageType; samples: VkSampleCountFlagBits; usage: VkImageUsageFlags; tiling: VkImageTiling; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties) {.cdecl, importc.}
  proc vkQueueBindSparse*(queue: VkQueue; bindInfoCount: uint32; pBindInfo: ptr VkBindSparseInfo; fence: VkFence): VkResult {.cdecl, importc.}
  proc vkCreateFence*(device: VkDevice; pCreateInfo: ptr VkFenceCreateInfo; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkDestroyFence*(device: VkDevice; fence: VkFence; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkResetFences*(device: VkDevice; fenceCount: uint32; pFences: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkGetFenceStatus*(device: VkDevice; fence: VkFence): VkResult {.cdecl, importc.}
  proc vkWaitForFences*(device: VkDevice; fenceCount: uint32; pFences: ptr VkFence; waitAll: VkBool32; timeout: uint64): VkResult {.cdecl, importc.}
  proc vkCreateSemaphore*(device: VkDevice; pCreateInfo: ptr VkSemaphoreCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSemaphore: ptr VkSemaphore): VkResult {.cdecl, importc.}
  proc vkDestroySemaphore*(device: VkDevice; semaphore: VkSemaphore; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateEvent*(device: VkDevice; pCreateInfo: ptr VkEventCreateInfo; pAllocator: ptr VkAllocationCallbacks; pEvent: ptr VkEvent): VkResult {.cdecl, importc.}
  proc vkDestroyEvent*(device: VkDevice; event: VkEvent; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetEventStatus*(device: VkDevice; event: VkEvent): VkResult {.cdecl, importc.}
  proc vkSetEvent*(device: VkDevice; event: VkEvent): VkResult {.cdecl, importc.}
  proc vkResetEvent*(device: VkDevice; event: VkEvent): VkResult {.cdecl, importc.}
  proc vkCreateQueryPool*(device: VkDevice; pCreateInfo: ptr VkQueryPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pQueryPool: ptr VkQueryPool): VkResult {.cdecl, importc.}
  proc vkDestroyQueryPool*(device: VkDevice; queryPool: VkQueryPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetQueryPoolResults*(device: VkDevice; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dataSize: csize; pData: pointer; stride: VkDeviceSize; flags: VkQueryResultFlags): VkResult {.cdecl, importc.}
  proc vkCreateBuffer*(device: VkDevice; pCreateInfo: ptr VkBufferCreateInfo; pAllocator: ptr VkAllocationCallbacks; pBuffer: ptr VkBuffer): VkResult {.cdecl, importc.}
  proc vkDestroyBuffer*(device: VkDevice; buffer: VkBuffer; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateBufferView*(device: VkDevice; pCreateInfo: ptr VkBufferViewCreateInfo; pAllocator: ptr VkAllocationCallbacks; pView: ptr VkBufferView): VkResult {.cdecl, importc.}
  proc vkDestroyBufferView*(device: VkDevice; bufferView: VkBufferView; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateImage*(device: VkDevice; pCreateInfo: ptr VkImageCreateInfo; pAllocator: ptr VkAllocationCallbacks; pImage: ptr VkImage): VkResult {.cdecl, importc.}
  proc vkDestroyImage*(device: VkDevice; image: VkImage; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetImageSubresourceLayout*(device: VkDevice; image: VkImage; pSubresource: ptr VkImageSubresource; pLayout: ptr VkSubresourceLayout) {.cdecl, importc.}
  proc vkCreateImageView*(device: VkDevice; pCreateInfo: ptr VkImageViewCreateInfo; pAllocator: ptr VkAllocationCallbacks; pView: ptr VkImageView): VkResult {.cdecl, importc.}
  proc vkDestroyImageView*(device: VkDevice; imageView: VkImageView; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateShaderModule*(device: VkDevice; pCreateInfo: ptr VkShaderModuleCreateInfo; pAllocator: ptr VkAllocationCallbacks; pShaderModule: ptr VkShaderModule): VkResult {.cdecl, importc.}
  proc vkDestroyShaderModule*(device: VkDevice; shaderModule: VkShaderModule; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreatePipelineCache*(device: VkDevice; pCreateInfo: ptr VkPipelineCacheCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelineCache: ptr VkPipelineCache): VkResult {.cdecl, importc.}
  proc vkDestroyPipelineCache*(device: VkDevice; pipelineCache: VkPipelineCache; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetPipelineCacheData*(device: VkDevice; pipelineCache: VkPipelineCache; pDataSize: ptr csize; pData: pointer): VkResult {.cdecl, importc.}
  proc vkMergePipelineCaches*(device: VkDevice; dstCache: VkPipelineCache; srcCacheCount: uint32; pSrcCaches: ptr VkPipelineCache): VkResult {.cdecl, importc.}
  proc vkCreateGraphicsPipelines*(device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkGraphicsPipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl, importc.}
  proc vkCreateComputePipelines*(device: VkDevice; pipelineCache: VkPipelineCache; createInfoCount: uint32; pCreateInfos: ptr VkComputePipelineCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult {.cdecl, importc.}
  proc vkDestroyPipeline*(device: VkDevice; pipeline: VkPipeline; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreatePipelineLayout*(device: VkDevice; pCreateInfo: ptr VkPipelineLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks; pPipelineLayout: ptr VkPipelineLayout): VkResult {.cdecl, importc.}
  proc vkDestroyPipelineLayout*(device: VkDevice; pipelineLayout: VkPipelineLayout; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateSampler*(device: VkDevice; pCreateInfo: ptr VkSamplerCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSampler: ptr VkSampler): VkResult {.cdecl, importc.}
  proc vkDestroySampler*(device: VkDevice; sampler: VkSampler; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateDescriptorSetLayout*(device: VkDevice; pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo; pAllocator: ptr VkAllocationCallbacks; pSetLayout: ptr VkDescriptorSetLayout): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorSetLayout*(device: VkDevice; descriptorSetLayout: VkDescriptorSetLayout; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateDescriptorPool*(device: VkDevice; pCreateInfo: ptr VkDescriptorPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pDescriptorPool: ptr VkDescriptorPool): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorPool*(device: VkDevice; descriptorPool: VkDescriptorPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkResetDescriptorPool*(device: VkDevice; descriptorPool: VkDescriptorPool; flags: VkDescriptorPoolResetFlags): VkResult {.cdecl, importc.}
  proc vkAllocateDescriptorSets*(device: VkDevice; pAllocateInfo: ptr VkDescriptorSetAllocateInfo; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl, importc.}
  proc vkFreeDescriptorSets*(device: VkDevice; descriptorPool: VkDescriptorPool; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet): VkResult {.cdecl, importc.}
  proc vkUpdateDescriptorSets*(device: VkDevice; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet; descriptorCopyCount: uint32; pDescriptorCopies: ptr VkCopyDescriptorSet) {.cdecl, importc.}
  proc vkCreateFramebuffer*(device: VkDevice; pCreateInfo: ptr VkFramebufferCreateInfo; pAllocator: ptr VkAllocationCallbacks; pFramebuffer: ptr VkFramebuffer): VkResult {.cdecl, importc.}
  proc vkDestroyFramebuffer*(device: VkDevice; framebuffer: VkFramebuffer; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateRenderPass*(device: VkDevice; pCreateInfo: ptr VkRenderPassCreateInfo; pAllocator: ptr VkAllocationCallbacks; pRenderPass: ptr VkRenderPass): VkResult {.cdecl, importc.}
  proc vkDestroyRenderPass*(device: VkDevice; renderPass: VkRenderPass; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetRenderAreaGranularity*(device: VkDevice; renderPass: VkRenderPass; pGranularity: ptr VkExtent2D) {.cdecl, importc.}
  proc vkCreateCommandPool*(device: VkDevice; pCreateInfo: ptr VkCommandPoolCreateInfo; pAllocator: ptr VkAllocationCallbacks; pCommandPool: ptr VkCommandPool): VkResult {.cdecl, importc.}
  proc vkDestroyCommandPool*(device: VkDevice; commandPool: VkCommandPool; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkResetCommandPool*(device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolResetFlags): VkResult {.cdecl, importc.}
  proc vkAllocateCommandBuffers*(device: VkDevice; pAllocateInfo: ptr VkCommandBufferAllocateInfo; pCommandBuffers: ptr VkCommandBuffer): VkResult {.cdecl, importc.}
  proc vkFreeCommandBuffers*(device: VkDevice; commandPool: VkCommandPool; commandBufferCount: uint32; pCommandBuffers: ptr VkCommandBuffer) {.cdecl, importc.}
  proc vkBeginCommandBuffer*(commandBuffer: VkCommandBuffer; pBeginInfo: ptr VkCommandBufferBeginInfo): VkResult {.cdecl, importc.}
  proc vkEndCommandBuffer*(commandBuffer: VkCommandBuffer): VkResult {.cdecl, importc.}
  proc vkResetCommandBuffer*(commandBuffer: VkCommandBuffer; flags: VkCommandBufferResetFlags): VkResult {.cdecl, importc.}
  proc vkCmdBindPipeline*(commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; pipeline: VkPipeline) {.cdecl, importc.}
  proc vkCmdSetViewport*(commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewports: ptr VkViewport) {.cdecl, importc.}
  proc vkCmdSetScissor*(commandBuffer: VkCommandBuffer; firstScissor: uint32; scissorCount: uint32; pScissors: ptr VkRect2D) {.cdecl, importc.}
  proc vkCmdSetLineWidth*(commandBuffer: VkCommandBuffer; lineWidth: cfloat) {.cdecl, importc.}
  proc vkCmdSetDepthBias*(commandBuffer: VkCommandBuffer; depthBiasConstantFactor: cfloat; depthBiasClamp: cfloat; depthBiasSlopeFactor: cfloat) {.cdecl, importc.}
  proc vkCmdSetBlendConstants*(commandBuffer: VkCommandBuffer; blendConstants: array[4, cfloat]) {.cdecl, importc.}
  proc vkCmdSetDepthBounds*(commandBuffer: VkCommandBuffer; minDepthBounds: cfloat; maxDepthBounds: cfloat) {.cdecl, importc.}
  proc vkCmdSetStencilCompareMask*(commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; compareMask: uint32) {.cdecl, importc.}
  proc vkCmdSetStencilWriteMask*(commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; writeMask: uint32) {.cdecl, importc.}
  proc vkCmdSetStencilReference*(commandBuffer: VkCommandBuffer; faceMask: VkStencilFaceFlags; reference: uint32) {.cdecl, importc.}
  proc vkCmdBindDescriptorSets*(commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; layout: VkPipelineLayout; firstSet: uint32; descriptorSetCount: uint32; pDescriptorSets: ptr VkDescriptorSet; dynamicOffsetCount: uint32; pDynamicOffsets: ptr uint32) {.cdecl, importc.}
  proc vkCmdBindIndexBuffer*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; indexType: VkIndexType) {.cdecl, importc.}
  proc vkCmdBindVertexBuffers*(commandBuffer: VkCommandBuffer; firstBinding: uint32; bindingCount: uint32; pBuffers: ptr VkBuffer; pOffsets: ptr VkDeviceSize) {.cdecl, importc.}
  proc vkCmdDraw*(commandBuffer: VkCommandBuffer; vertexCount: uint32; instanceCount: uint32; firstVertex: uint32; firstInstance: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexed*(commandBuffer: VkCommandBuffer; indexCount: uint32; instanceCount: uint32; firstIndex: uint32; vertexOffset:  int32; firstInstance: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndirect*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexedIndirect*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDispatch*(commandBuffer: VkCommandBuffer; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl, importc.}
  proc vkCmdDispatchIndirect*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize) {.cdecl, importc.}
  proc vkCmdCopyBuffer*(commandBuffer: VkCommandBuffer; srcBuffer: VkBuffer; dstBuffer: VkBuffer; regionCount: uint32; pRegions: ptr VkBufferCopy) {.cdecl, importc.}
  proc vkCmdCopyImage*(commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageCopy) {.cdecl, importc.}
  proc vkCmdBlitImage*(commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageBlit; filter: VkFilter) {.cdecl, importc.}
  proc vkCmdCopyBufferToImage*(commandBuffer: VkCommandBuffer; srcBuffer: VkBuffer; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkBufferImageCopy) {.cdecl, importc.}
  proc vkCmdCopyImageToBuffer*(commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstBuffer: VkBuffer; regionCount: uint32; pRegions: ptr VkBufferImageCopy) {.cdecl, importc.}
  proc vkCmdUpdateBuffer*(commandBuffer: VkCommandBuffer; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; dataSize: VkDeviceSize; pData: pointer) {.cdecl, importc.}
  proc vkCmdFillBuffer*(commandBuffer: VkCommandBuffer; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; size: VkDeviceSize; data: uint32) {.cdecl, importc.}
  proc vkCmdClearColorImage*(commandBuffer: VkCommandBuffer; image: VkImage; imageLayout: VkImageLayout; pColor: ptr VkClearColorValue; rangeCount: uint32; pRanges: ptr VkImageSubresourceRange) {.cdecl, importc.}
  proc vkCmdClearDepthStencilImage*(commandBuffer: VkCommandBuffer; image: VkImage; imageLayout: VkImageLayout; pDepthStencil: ptr VkClearDepthStencilValue; rangeCount: uint32; pRanges: ptr VkImageSubresourceRange) {.cdecl, importc.}
  proc vkCmdClearAttachments*(commandBuffer: VkCommandBuffer; attachmentCount: uint32; pAttachments: ptr VkClearAttachment; rectCount: uint32; pRects: ptr VkClearRect) {.cdecl, importc.}
  proc vkCmdResolveImage*(commandBuffer: VkCommandBuffer; srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage; dstImageLayout: VkImageLayout; regionCount: uint32; pRegions: ptr VkImageResolve) {.cdecl, importc.}
  proc vkCmdSetEvent*(commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags) {.cdecl, importc.}
  proc vkCmdResetEvent*(commandBuffer: VkCommandBuffer; event: VkEvent; stageMask: VkPipelineStageFlags) {.cdecl, importc.}
  proc vkCmdWaitEvents*(commandBuffer: VkCommandBuffer; eventCount: uint32; pEvents: ptr VkEvent; srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr VkMemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr VkBufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr VkImageMemoryBarrier) {.cdecl, importc.}
  proc vkCmdPipelineBarrier*(commandBuffer: VkCommandBuffer; srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags; dependencyFlags: VkDependencyFlags; memoryBarrierCount: uint32; pMemoryBarriers: ptr VkMemoryBarrier; bufferMemoryBarrierCount: uint32; pBufferMemoryBarriers: ptr VkBufferMemoryBarrier; imageMemoryBarrierCount: uint32; pImageMemoryBarriers: ptr VkImageMemoryBarrier) {.cdecl, importc.}
  proc vkCmdBeginQuery*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32; flags: VkQueryControlFlags) {.cdecl, importc.}
  proc vkCmdEndQuery*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; query: uint32) {.cdecl, importc.}
  proc vkCmdResetQueryPool*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32) {.cdecl, importc.}
  proc vkCmdWriteTimestamp*(commandBuffer: VkCommandBuffer; pipelineStage: VkPipelineStageFlagBits; queryPool: VkQueryPool; query: uint32) {.cdecl, importc.}
  proc vkCmdCopyQueryPoolResults*(commandBuffer: VkCommandBuffer; queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32; dstBuffer: VkBuffer; dstOffset: VkDeviceSize; stride: VkDeviceSize; flags: VkQueryResultFlags) {.cdecl, importc.}
  proc vkCmdPushConstants*(commandBuffer: VkCommandBuffer; layout: VkPipelineLayout; stageFlags: VkShaderStageFlags; offset: uint32; size: uint32; pValues: pointer) {.cdecl, importc.}
  proc vkCmdBeginRenderPass*(commandBuffer: VkCommandBuffer; pRenderPassBegin: ptr VkRenderPassBeginInfo; contents: VkSubpassContents) {.cdecl, importc.}
  proc vkCmdNextSubpass*(commandBuffer: VkCommandBuffer; contents: VkSubpassContents) {.cdecl, importc.}
  proc vkCmdEndRenderPass*(commandBuffer: VkCommandBuffer) {.cdecl, importc.}
  proc vkCmdExecuteCommands*(commandBuffer: VkCommandBuffer; commandBufferCount: uint32; pCommandBuffers: ptr VkCommandBuffer) {.cdecl, importc.}

const
  vKKHRSurface* = 1

type
  VkSurfaceKHR* = pointer

const
  vkKhrSurfaceSpecVersion* = 25
  vkKhrSurfaceExtensionName* = "VK_KHR_surface"

type
  VkColorSpaceKHR* {.pure, size: sizeof(cint).} = enum
    srgbNonlinearKhr = 0,
    displayP3NonlinearExt = 1000104001,
    extendedSrgbLinearExt = 1000104002,
    dciP3LinearExt = 1000104003,
    dciP3NonlinearExt = 1000104004,
    bt709LinearExt = 1000104005,
    bt709NonlinearExt = 1000104006,
    bt2020LinearExt = 1000104007,
    hdr10St2084Ext = 1000104008,
    dolbyvisionExt = 1000104009,
    hdr10HlgExt = 1000104010,
    adobergbLinearExt = 1000104011,
    adobergbNonlinearExt = 1000104012,
    passThroughExt = 1000104013,
    extendedSrgbNonlinearExt = 1000104014,

  VkPresentModeKHR* {.pure, size: sizeof(cint).} = enum
    immediate = 0,
    mailbox = 1,
    fifo = 2,
    fifoRelaxed = 3,
    sharedDemandRefresh = 1000111000,
    sharedContinuousRefresh = 1000111001,

  VkSurfaceTransformFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    identity = 0x00000001,
    rotate90 = 0x00000002,
    rotate180 = 0x00000004,
    rotate270 = 0x00000008,
    horizontalMirror = 0x00000010,
    horizontalMirrorRotate90 = 0x00000020,
    horizontalMirrorRotate180 = 0x00000040,
    horizontalMirrorRotate270 = 0x00000080,
    inherit = 0x00000100,

  VkSurfaceTransformFlagsKHR* = VkFlags

  VkCompositeAlphaFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    opaque = 0x00000001,
    preMultiplied = 0x00000002,
    postMultiplied = 0x00000004,
    inherit = 0x00000008,

  VkCompositeAlphaFlagsKHR* = VkFlags

  VkSurfaceCapabilitiesKHR* = object
    minImageCount*: uint32
    maxImageCount*: uint32
    currentExtent*: VkExtent2D
    minImageExtent*: VkExtent2D
    maxImageExtent*: VkExtent2D
    maxImageArrayLayers*: uint32
    supportedTransforms*: VkSurfaceTransformFlagsKHR
    currentTransform*: VkSurfaceTransformFlagBitsKHR
    supportedCompositeAlpha*: VkCompositeAlphaFlagsKHR
    supportedUsageFlags*: VkImageUsageFlags

  VkSurfaceFormatKHR* = object
    format*: VkFormat
    colorSpace*: VkColorSpaceKHR

  PFN_vkDestroySurfaceKHR* = proc (instance: VkInstance; surface: VkSurfaceKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkGetPhysicalDeviceSurfaceSupportKHR* = proc (physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; surface: VkSurfaceKHR; pSupported: ptr VkBool32): VkResult {.cdecl.}
  PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilitiesKHR): VkResult {.cdecl.}
  PFN_vkGetPhysicalDeviceSurfaceFormatsKHR* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormatKHR): VkResult {.cdecl.}
  PFN_vkGetPhysicalDeviceSurfacePresentModesKHR* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pPresentModeCount: ptr uint32; pPresentModes: ptr VkPresentModeKHR): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkDestroySurfaceKHR*(instance: VkInstance; surface: VkSurfaceKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfaceSupportKHR*(physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; surface: VkSurfaceKHR; pSupported: ptr VkBool32): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfaceCapabilitiesKHR*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilitiesKHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfaceFormatsKHR*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormatKHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfacePresentModesKHR*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pPresentModeCount: ptr uint32; pPresentModes: ptr VkPresentModeKHR): VkResult {.cdecl, importc.}

const
  vKKHRSwapchain* = 1

type
  VkSwapchainKHR* = pointer

const
  vkKhrSwapchainSpecVersion* = 68
  vkKhrSwapchainExtensionName* = "VK_KHR_swapchain"

type
  VkSwapchainCreateFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    bindSfr = 0x00000001,

  VkSwapchainCreateFlagsKHR* = VkFlags

  VkSwapchainCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkSwapchainCreateFlagsKHR
    surface*: VkSurfaceKHR
    minImageCount*: uint32
    imageFormat*: VkFormat
    imageColorSpace*: VkColorSpaceKHR
    imageExtent*: VkExtent2D
    imageArrayLayers*: uint32
    imageUsage*: VkImageUsageFlags
    imageSharingMode*: VkSharingMode
    queueFamilyIndexCount*: uint32
    pQueueFamilyIndices*: ptr uint32
    preTransform*: VkSurfaceTransformFlagBitsKHR
    compositeAlpha*: VkCompositeAlphaFlagBitsKHR
    presentMode*: VkPresentModeKHR
    clipped*: VkBool32
    oldSwapchain*: VkSwapchainKHR

  VkPresentInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphores*: ptr VkSemaphore
    swapchainCount*: uint32
    pSwapchains*: ptr VkSwapchainKHR
    pImageIndices*: ptr uint32
    pResults*: ptr VkResult

  PFN_vkCreateSwapchainKHR* = proc (device: VkDevice; pCreateInfo: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSwapchain: ptr VkSwapchainKHR): VkResult {.cdecl.}
  PFN_vkDestroySwapchainKHR* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkGetSwapchainImagesKHR* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pSwapchainImageCount: ptr uint32; pSwapchainImages: ptr VkImage): VkResult {.cdecl.}
  PFN_vkAcquireNextImageKHR* = proc (device: VkDevice; swapchain: VkSwapchainKHR; timeout: uint64; semaphore: VkSemaphore; fence: VkFence; pImageIndex: ptr uint32): VkResult {.cdecl.}
  PFN_vkQueuePresentKHR* = proc (queue: VkQueue; pPresentInfo: ptr VkPresentInfoKHR): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCreateSwapchainKHR*(device: VkDevice; pCreateInfo: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSwapchain: ptr VkSwapchainKHR): VkResult {.cdecl, importc.}
  proc vkDestroySwapchainKHR*(device: VkDevice; swapchain: VkSwapchainKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkGetSwapchainImagesKHR*(device: VkDevice; swapchain: VkSwapchainKHR; pSwapchainImageCount: ptr uint32; pSwapchainImages: ptr VkImage): VkResult {.cdecl, importc.}
  proc vkAcquireNextImageKHR*(device: VkDevice; swapchain: VkSwapchainKHR; timeout: uint64; semaphore: VkSemaphore; fence: VkFence; pImageIndex: ptr uint32): VkResult {.cdecl, importc.}
  proc vkQueuePresentKHR*(queue: VkQueue; pPresentInfo: ptr VkPresentInfoKHR): VkResult {.cdecl, importc.}

const
  vKKHRDisplay* = 1

type
  VkDisplayKHR* = pointer
  VkDisplayModeKHR* = pointer

const
  vkKhrDisplaySpecVersion* = 21
  vkKhrDisplayExtensionName* = "VK_KHR_display"

type
  VkDisplayPlaneAlphaFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    opaque = 0x00000001,
    global = 0x00000002,
    perPixel = 0x00000004,
    perPixelPremultiplied = 0x00000008,

  VkDisplayPlaneAlphaFlagsKHR* = VkFlags

  VkDisplayModeCreateFlagsKHR* = VkFlags

  VkDisplaySurfaceCreateFlagsKHR* = VkFlags

  VkDisplayPropertiesKHR* = object
    display*: VkDisplayKHR
    displayName*: cstring
    physicalDimensions*: VkExtent2D
    physicalResolution*: VkExtent2D
    supportedTransforms*: VkSurfaceTransformFlagsKHR
    planeReorderPossible*: VkBool32
    persistentContent*: VkBool32

  VkDisplayModeParametersKHR* = object
    visibleRegion*: VkExtent2D
    refreshRate*: uint32

  VkDisplayModePropertiesKHR* = object
    displayMode*: VkDisplayModeKHR
    parameters*: VkDisplayModeParametersKHR

  VkDisplayModeCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDisplayModeCreateFlagsKHR
    parameters*: VkDisplayModeParametersKHR

  VkDisplayPlaneCapabilitiesKHR* = object
    supportedAlpha*: VkDisplayPlaneAlphaFlagsKHR
    minSrcPosition*: VkOffset2D
    maxSrcPosition*: VkOffset2D
    minSrcExtent*: VkExtent2D
    maxSrcExtent*: VkExtent2D
    minDstPosition*: VkOffset2D
    maxDstPosition*: VkOffset2D
    minDstExtent*: VkExtent2D
    maxDstExtent*: VkExtent2D

  VkDisplayPlanePropertiesKHR* = object
    currentDisplay*: VkDisplayKHR
    currentStackIndex*: uint32

  VkDisplaySurfaceCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDisplaySurfaceCreateFlagsKHR
    displayMode*: VkDisplayModeKHR
    planeIndex*: uint32
    planeStackIndex*: uint32
    transform*: VkSurfaceTransformFlagBitsKHR
    globalAlpha*: cfloat
    alphaMode*: VkDisplayPlaneAlphaFlagBitsKHR
    imageExtent*: VkExtent2D

  PFN_vkGetPhysicalDeviceDisplayPropertiesKHR* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPropertiesKHR): VkResult {.cdecl.}
  PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR* = proc (physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPlanePropertiesKHR): VkResult {.cdecl.}
  PFN_vkGetDisplayPlaneSupportedDisplaysKHR* = proc (physicalDevice: VkPhysicalDevice; planeIndex: uint32; pDisplayCount: ptr uint32; pDisplays: ptr VkDisplayKHR): VkResult {.cdecl.}
  PFN_vkGetDisplayModePropertiesKHR* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayModePropertiesKHR): VkResult {.cdecl.}
  PFN_vkCreateDisplayModeKHR* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pCreateInfo: ptr VkDisplayModeCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pMode: ptr VkDisplayModeKHR): VkResult {.cdecl.}
  PFN_vkGetDisplayPlaneCapabilitiesKHR* = proc (physicalDevice: VkPhysicalDevice; mode: VkDisplayModeKHR; planeIndex: uint32; pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR): VkResult {.cdecl.}
  PFN_vkCreateDisplayPlaneSurfaceKHR* = proc (instance: VkInstance; pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetPhysicalDeviceDisplayPropertiesKHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPropertiesKHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceDisplayPlanePropertiesKHR*(physicalDevice: VkPhysicalDevice; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayPlanePropertiesKHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayPlaneSupportedDisplaysKHR*(physicalDevice: VkPhysicalDevice; planeIndex: uint32; pDisplayCount: ptr uint32; pDisplays: ptr VkDisplayKHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayModePropertiesKHR*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pPropertyCount: ptr uint32; pProperties: ptr VkDisplayModePropertiesKHR): VkResult {.cdecl, importc.}
  proc vkCreateDisplayModeKHR*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR; pCreateInfo: ptr VkDisplayModeCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pMode: ptr VkDisplayModeKHR): VkResult {.cdecl, importc.}
  proc vkGetDisplayPlaneCapabilitiesKHR*(physicalDevice: VkPhysicalDevice; mode: VkDisplayModeKHR; planeIndex: uint32; pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR): VkResult {.cdecl, importc.}
  proc vkCreateDisplayPlaneSurfaceKHR*(instance: VkInstance; pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}

const
  vKKHRDisplaySwapchain* = 1
  vkKhrDisplaySwapchainSpecVersion* = 9
  vkKhrDisplaySwapchainExtensionName* = "VK_KHR_display_swapchain"

type
  VkDisplayPresentInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    srcRect*: VkRect2D
    dstRect*: VkRect2D
    persistent*: VkBool32

  PFN_vkCreateSharedSwapchainsKHR* = proc (device: VkDevice; swapchainCount: uint32; pCreateInfos: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSwapchains: ptr VkSwapchainKHR): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCreateSharedSwapchainsKHR*(device: VkDevice; swapchainCount: uint32; pCreateInfos: ptr VkSwapchainCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSwapchains: ptr VkSwapchainKHR): VkResult {.cdecl, importc.}

when defined(linux) and not defined(android):
  const
    vkKhrXlibSurfaceSpecVersion* = 6
    vkKhrXlibSurfaceExtensionName* = "VK_KHR_xlib_surface"

  type
    VkXlibSurfaceCreateFlagsKHR* = VkFlags

    VkXlibSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkXlibSurfaceCreateFlagsKHR
      dpy*: pointer # ptr Display
      window*: pointer # Window

    PFN_vkCreateXlibSurfaceKHR* = proc (instance: VkInstance; pCreateInfo: ptr VkXlibSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}
    PFN_vkGetPhysicalDeviceXlibPresentationSupportKHR* = proc (physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; dpy: pointer; visualID: culong): VkBool32 {.cdecl.}

  when not defined(VK_NO_PROTOTYPES):
    proc vkCreateXlibSurfaceKHR*(instance: VkInstance; pCreateInfo: ptr VkXlibSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}
    proc vkGetPhysicalDeviceXlibPresentationSupportKHR*(physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; dpy: pointer; visualID: culong): VkBool32 {.cdecl, importc.}

  const
    vkKhrXcbSurfaceSpecVersion* = 6
    vkKhrXcbSurfaceExtensionName* = "VK_KHR_xcb_surface"

  type
    VkXcbSurfaceCreateFlagsKHR* = VkFlags

    VkXcbSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkXcbSurfaceCreateFlagsKHR
      connection*: pointer # ptr xcb_connection_t
      window*: uint32 # xcb_window_t

    PFN_vkCreateXcbSurfaceKHR* = proc (instance: VkInstance; pCreateInfo: ptr VkXcbSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}
    PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR* = proc (physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; connection: pointer; visual_id: uint32): VkBool32 {.cdecl.}

  when not defined(VK_NO_PROTOTYPES):
    proc vkCreateXcbSurfaceKHR*(instance: VkInstance; pCreateInfo: ptr VkXcbSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}
    proc vkGetPhysicalDeviceXcbPresentationSupportKHR*(physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; connection: pointer; visual_id: uint32): VkBool32 {.cdecl, importc.}

  const
    vkKhrWaylandSurfaceSpecVersion* = 6
    vkKhrWaylandSurfaceExtensionName* = "VK_KHR_wayland_surface"

  type
    VkWaylandSurfaceCreateFlagsKHR* = VkFlags
    VkWaylandSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkWaylandSurfaceCreateFlagsKHR
      display*: pointer # ptr wl_display
      surface*: pointer # ptr wl_surface

    PFN_vkCreateWaylandSurfaceKHR* = proc (instance: VkInstance; pCreateInfo: ptr VkWaylandSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}
    PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR* = proc (physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; display: pointer): VkBool32 {.cdecl.}

  when not defined(VK_NO_PROTOTYPES):
    proc vkCreateWaylandSurfaceKHR*(instance: VkInstance; pCreateInfo: ptr VkWaylandSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}
    proc vkGetPhysicalDeviceWaylandPresentationSupportKHR*(physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; display: pointer): VkBool32 {.cdecl, importc.}

  const
    vkKhrMirSurfaceSpecVersion* = 4
    vkKhrMirSurfaceExtensionName* = "VK_KHR_mir_surface"

  type
    VkMirSurfaceCreateFlagsKHR* = VkFlags
    VkMirSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkMirSurfaceCreateFlagsKHR
      connection*: pointer # ptr MirConnection
      mirSurface*: pointer # ptr MirSurface

    PFN_vkCreateMirSurfaceKHR* = proc (instance: VkInstance; pCreateInfo: ptr VkMirSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}
    PFN_vkGetPhysicalDeviceMirPresentationSupportKHR* = proc (physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; connection: pointer): VkBool32 {.cdecl.}

  when not defined(VK_NO_PROTOTYPES):
    proc vkCreateMirSurfaceKHR*(instance: VkInstance; pCreateInfo: ptr VkMirSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}
    proc vkGetPhysicalDeviceMirPresentationSupportKHR*(physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32; connection: pointer): VkBool32 {.cdecl, importc.}

when defined(android):
  const
    vKKHRAndroidSurface* = 1

  const
    vkKhrAndroidSurfaceSpecVersion* = 6
    vkKhrAndroidSurfaceExtensionName* = "VK_KHR_android_surface"

  type
    VkAndroidSurfaceCreateFlagsKHR* = VkFlags

    VkAndroidSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkAndroidSurfaceCreateFlagsKHR
      window*: pointer # ptr ANativeWindow

    PFN_vkCreateAndroidSurfaceKHR* = proc (instance: VkInstance; pCreateInfo: ptr VkAndroidSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}

  when not defined(VK_NO_PROTOTYPES):
    proc vkCreateAndroidSurfaceKHR*(instance: VkInstance; pCreateInfo: ptr VkAndroidSurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}

when defined(windows):
  import winlean

  const
    vkKhrWin32SurfaceSpecVersion* = 6
    vkKhrWin32SurfaceExtensionName* = "VK_KHR_win32_surface"

  type
    VkWin32SurfaceCreateFlagsKHR* = VkFlags
    VkWin32SurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkWin32SurfaceCreateFlagsKHR
      hinstance*: Handle # HINSTANCE
      hwnd*: Handle # HWND

    PFN_vkCreateWin32SurfaceKHR* = proc (instance: VkInstance; pCreateInfo: ptr VkWin32SurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}
    PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR* = proc (physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32): VkBool32 {.cdecl.}
  
  when not defined(VK_NO_PROTOTYPES):
    proc vkCreateWin32SurfaceKHR*(instance: VkInstance; pCreateInfo: ptr VkWin32SurfaceCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}
    proc vkGetPhysicalDeviceWin32PresentationSupportKHR*(physicalDevice: VkPhysicalDevice; queueFamilyIndex: uint32): VkBool32 {.cdecl, importc.}

const
  vKKHRSamplerMirrorClampToEdge* = 1
  vkKhrSamplerMirrorClampToEdgeSpecVersion* = 1
  vkKhrSamplerMirrorClampToEdgeExtensionName* = "VK_KHR_sampler_mirror_clamp_to_edge"
  vKKHRGetPhysicalDeviceProperties2* = 1
  vkKhrGetPhysicalDeviceProperties2SpecVersion* = 1
  vkKhrGetPhysicalDeviceProperties2ExtensionName* = "VK_KHR_get_physical_device_properties2"

type
  VkPhysicalDeviceFeatures2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    features*: VkPhysicalDeviceFeatures

  VkPhysicalDeviceProperties2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    properties*: VkPhysicalDeviceProperties

  VkFormatProperties2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    formatProperties*: VkFormatProperties

  VkImageFormatProperties2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    imageFormatProperties*: VkImageFormatProperties

  VkPhysicalDeviceImageFormatInfo2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    format*: VkFormat
    imageType*: VkImageType
    tiling*: VkImageTiling
    usage*: VkImageUsageFlags
    flags*: VkImageCreateFlags

  VkQueueFamilyProperties2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    queueFamilyProperties*: VkQueueFamilyProperties

  VkPhysicalDeviceMemoryProperties2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    memoryProperties*: VkPhysicalDeviceMemoryProperties

  VkSparseImageFormatProperties2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    properties*: VkSparseImageFormatProperties

  VkPhysicalDeviceSparseImageFormatInfo2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    format*: VkFormat
    imageType*: VkImageType
    samples*: VkSampleCountFlagBits
    usage*: VkImageUsageFlags
    tiling*: VkImageTiling

  PFN_vkGetPhysicalDeviceFeatures2KHR* = proc (physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures2KHR) {.cdecl.}
  PFN_vkGetPhysicalDeviceProperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties2KHR) {.cdecl.}
  PFN_vkGetPhysicalDeviceFormatProperties2KHR* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties2KHR) {.cdecl.}
  PFN_vkGetPhysicalDeviceImageFormatProperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pImageFormatInfo: ptr VkPhysicalDeviceImageFormatInfo2KHR; pImageFormatProperties: ptr VkImageFormatProperties2KHR): VkResult {.cdecl.}
  PFN_vkGetPhysicalDeviceQueueFamilyProperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties2KHR) {.cdecl.}
  PFN_vkGetPhysicalDeviceMemoryProperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties2KHR) {.cdecl.}
  PFN_vkGetPhysicalDeviceSparseImageFormatProperties2KHR* = proc (physicalDevice: VkPhysicalDevice; pFormatInfo: ptr VkPhysicalDeviceSparseImageFormatInfo2KHR; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties2KHR) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetPhysicalDeviceFeatures2KHR*(physicalDevice: VkPhysicalDevice; pFeatures: ptr VkPhysicalDeviceFeatures2KHR) {.cdecl, importc.}
  proc vkGetPhysicalDeviceProperties2KHR*(physicalDevice: VkPhysicalDevice; pProperties: ptr VkPhysicalDeviceProperties2KHR) {.cdecl, importc.}
  proc vkGetPhysicalDeviceFormatProperties2KHR*(physicalDevice: VkPhysicalDevice; format: VkFormat; pFormatProperties: ptr VkFormatProperties2KHR) {.cdecl, importc.}
  proc vkGetPhysicalDeviceImageFormatProperties2KHR*(physicalDevice: VkPhysicalDevice; pImageFormatInfo: ptr VkPhysicalDeviceImageFormatInfo2KHR; pImageFormatProperties: ptr VkImageFormatProperties2KHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceQueueFamilyProperties2KHR*(physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32; pQueueFamilyProperties: ptr VkQueueFamilyProperties2KHR) {.cdecl, importc.}
  proc vkGetPhysicalDeviceMemoryProperties2KHR*(physicalDevice: VkPhysicalDevice; pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties2KHR) {.cdecl, importc.}
  proc vkGetPhysicalDeviceSparseImageFormatProperties2KHR*(physicalDevice: VkPhysicalDevice; pFormatInfo: ptr VkPhysicalDeviceSparseImageFormatInfo2KHR; pPropertyCount: ptr uint32; pProperties: ptr VkSparseImageFormatProperties2KHR) {.cdecl, importc.}

const
  vKKHRShaderDrawParameters* = 1
  vkKhrShaderDrawParametersSpecVersion* = 1
  vkKhrShaderDrawParametersExtensionName* = "VK_KHR_shader_draw_parameters"
  vKKHRMaintenance1* = 1
  vkKhrMaintenance1SpecVersion* = 1
  vkKhrMaintenance1ExtensionName* = "VK_KHR_maintenance1"

type
  VkCommandPoolTrimFlagsKHR* = VkFlags
  PFN_vkTrimCommandPoolKHR* = proc (device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolTrimFlagsKHR) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkTrimCommandPoolKHR*(device: VkDevice; commandPool: VkCommandPool; flags: VkCommandPoolTrimFlagsKHR) {.cdecl, importc.}

const
  vKKHRExternalMemoryCapabilities* = 1
  vkLuidSizeKhr* = 8
  vkKhrExternalMemoryCapabilitiesSpecVersion* = 1
  vkKhrExternalMemoryCapabilitiesExtensionName* = "VK_KHR_external_memory_capabilities"

type
  VkExternalMemoryHandleTypeFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    opaqueFd = 0x00000001,
    opaqueWin32 = 0x00000002,
    opaqueWin32Kmt = 0x00000004,
    d3d11Texture = 0x00000008,
    d3d11TextureKmt = 0x00000010,
    d3d12Heap = 0x00000020,
    d3d12Resource = 0x00000040,

  VkExternalMemoryHandleTypeFlagsKHR* = VkFlags

  VkExternalMemoryFeatureFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    dedicatedOnly = 0x00000001,
    exportable = 0x00000002,
    importable = 0x00000004,

  VkExternalMemoryFeatureFlagsKHR* = VkFlags

  VkExternalMemoryPropertiesKHR* = object
    externalMemoryFeatures*: VkExternalMemoryFeatureFlagsKHR
    exportFromImportedHandleTypes*: VkExternalMemoryHandleTypeFlagsKHR
    compatibleHandleTypes*: VkExternalMemoryHandleTypeFlagsKHR

  VkPhysicalDeviceExternalImageFormatInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagBitsKHR

  VkExternalImageFormatPropertiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    externalMemoryProperties*: VkExternalMemoryPropertiesKHR

  VkPhysicalDeviceExternalBufferInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkBufferCreateFlags
    usage*: VkBufferUsageFlags
    handleType*: VkExternalMemoryHandleTypeFlagBitsKHR

  VkExternalBufferPropertiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    externalMemoryProperties*: VkExternalMemoryPropertiesKHR

  VkPhysicalDeviceIDPropertiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    deviceUUID*: array[vkUuidSize,  uint8]
    driverUUID*: array[vkUuidSize,  uint8]
    deviceLUID*: array[vkLuidSizeKhr,  uint8]
    deviceNodeMask*: uint32
    deviceLUIDValid*: VkBool32

  PFN_vkGetPhysicalDeviceExternalBufferPropertiesKHR* = proc (
      physicalDevice: VkPhysicalDevice;
      pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfoKHR;
      pExternalBufferProperties: ptr VkExternalBufferPropertiesKHR) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetPhysicalDeviceExternalBufferPropertiesKHR*(physicalDevice: VkPhysicalDevice; pExternalBufferInfo: ptr VkPhysicalDeviceExternalBufferInfoKHR; pExternalBufferProperties: ptr VkExternalBufferPropertiesKHR) {.cdecl, importc.}

const
  vKKHRExternalMemory* = 1
  vkKhrExternalMemorySpecVersion* = 1
  vkKhrExternalMemoryExtensionName* = "VK_KHR_external_memory"
  vkQueueFamilyExternalKhr* = (not 0 - 1)

type
  VkExternalMemoryImageCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlagsKHR

  VkExternalMemoryBufferCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlagsKHR

  VkExportMemoryAllocateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlagsKHR


when defined(windows):
  const
    vKKHRExternalMemoryWin32* = 1
    vkKhrExternalMemoryWin32SpecVersion* = 1
    vkKhrExternalMemoryWin32ExtensionName* = "VK_KHR_external_memory_win32"

  type
    VkImportMemoryWin32HandleInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      handleType*: VkExternalMemoryHandleTypeFlagBitsKHR
      handle*: HANDLE
      name*: WideCString

    VkExportMemoryWin32HandleInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      pAttributes*: ptr SECURITY_ATTRIBUTES
      dwAccess*: DWORD
      name*: WideCString

    VkMemoryWin32HandlePropertiesKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      memoryTypeBits*: uint32

    VkMemoryGetWin32HandleInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      memory*: VkDeviceMemory
      handleType*: VkExternalMemoryHandleTypeFlagBitsKHR

    PFN_vkGetMemoryWin32HandleKHR* = proc (device: VkDevice; pGetWin32HandleInfo: ptr VkMemoryGetWin32HandleInfoKHR; pHandle: ptr HANDLE): VkResult {.cdecl.}
    PFN_vkGetMemoryWin32HandlePropertiesKHR* = proc (device: VkDevice; handleType: VkExternalMemoryHandleTypeFlagBitsKHR; handle: HANDLE; pMemoryWin32HandleProperties: ptr VkMemoryWin32HandlePropertiesKHR): VkResult {.cdecl.}
  
  when not defined(VK_NO_PROTOTYPES):
    proc vkGetMemoryWin32HandleKHR*(device: VkDevice; pGetWin32HandleInfo: ptr VkMemoryGetWin32HandleInfoKHR; pHandle: ptr HANDLE): VkResult {.cdecl, importc.}
    proc vkGetMemoryWin32HandlePropertiesKHR*(device: VkDevice; handleType: VkExternalMemoryHandleTypeFlagBitsKHR; handle: HANDLE; pMemoryWin32HandleProperties: ptr VkMemoryWin32HandlePropertiesKHR): VkResult {.cdecl, importc.}

const
  vKKHRExternalMemoryFd* = 1
  vkKhrExternalMemoryFdSpecVersion* = 1
  vkKhrExternalMemoryFdExtensionName* = "VK_KHR_external_memory_fd"

type
  VkImportMemoryFdInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalMemoryHandleTypeFlagBitsKHR
    fd*: cint

  VkMemoryFdPropertiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    memoryTypeBits*: uint32

  VkMemoryGetFdInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    memory*: VkDeviceMemory
    handleType*: VkExternalMemoryHandleTypeFlagBitsKHR

  PFN_vkGetMemoryFdKHR* = proc (device: VkDevice; pGetFdInfo: ptr VkMemoryGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl.}
  PFN_vkGetMemoryFdPropertiesKHR* = proc (device: VkDevice; handleType: VkExternalMemoryHandleTypeFlagBitsKHR; fd: cint; pMemoryFdProperties: ptr VkMemoryFdPropertiesKHR): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetMemoryFdKHR*(device: VkDevice; pGetFdInfo: ptr VkMemoryGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl, importc.}
  proc vkGetMemoryFdPropertiesKHR*(device: VkDevice; handleType: VkExternalMemoryHandleTypeFlagBitsKHR; fd: cint; pMemoryFdProperties: ptr VkMemoryFdPropertiesKHR): VkResult {.cdecl, importc.}

when defined(windows):
  const
    vKKHRWin32KeyedMutex* = 1
    vkKhrWin32KeyedMutexSpecVersion* = 1
    vkKhrWin32KeyedMutexExtensionName* = "VK_KHR_win32_keyed_mutex"

  type
    VkWin32KeyedMutexAcquireReleaseInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      acquireCount*: uint32
      pAcquireSyncs*: ptr VkDeviceMemory
      pAcquireKeys*: ptr uint64
      pAcquireTimeouts*: ptr uint32
      releaseCount*: uint32
      pReleaseSyncs*: ptr VkDeviceMemory
      pReleaseKeys*: ptr uint64

const
  vKKHRExternalSemaphoreCapabilities* = 1
  vkKhrExternalSemaphoreCapabilitiesSpecVersion* = 1
  vkKhrExternalSemaphoreCapabilitiesExtensionName* = "VK_KHR_external_semaphore_capabilities"

type
  VkExternalSemaphoreHandleTypeFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    opaqueFd = 0x00000001,
    opaqueWin32 = 0x00000002,
    opaqueWin32Kmt = 0x00000004,
    d3d12Fence = 0x00000008,
    syncFd = 0x00000010,

  VkExternalSemaphoreHandleTypeFlagsKHR* = VkFlags

  VkExternalSemaphoreFeatureFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    exportable = 0x00000001,
    importable = 0x00000002,

  VkExternalSemaphoreFeatureFlagsKHR* = VkFlags
  VkPhysicalDeviceExternalSemaphoreInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalSemaphoreHandleTypeFlagBitsKHR

  VkExternalSemaphorePropertiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: VkExternalSemaphoreHandleTypeFlagsKHR
    compatibleHandleTypes*: VkExternalSemaphoreHandleTypeFlagsKHR
    externalSemaphoreFeatures*: VkExternalSemaphoreFeatureFlagsKHR

  PFN_vkGetPhysicalDeviceExternalSemaphorePropertiesKHR* = proc (physicalDevice: VkPhysicalDevice; pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfoKHR; pExternalSemaphoreProperties: ptr VkExternalSemaphorePropertiesKHR) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetPhysicalDeviceExternalSemaphorePropertiesKHR*(physicalDevice: VkPhysicalDevice; pExternalSemaphoreInfo: ptr VkPhysicalDeviceExternalSemaphoreInfoKHR; pExternalSemaphoreProperties: ptr VkExternalSemaphorePropertiesKHR) {.cdecl, importc.}

const
  vKKHRExternalSemaphore* = 1
  vkKhrExternalSemaphoreSpecVersion* = 1
  vkKhrExternalSemaphoreExtensionName* = "VK_KHR_external_semaphore"

type
  VkSemaphoreImportFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    temporary = 0x00000001,

  VkSemaphoreImportFlagsKHR* = VkFlags

  VkExportSemaphoreCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalSemaphoreHandleTypeFlagsKHR


when defined(windows):
  const
    vKKHRExternalSemaphoreWin32* = 1
    vkKhrExternalSemaphoreWin32SpecVersion* = 1
    vkKhrExternalSemaphoreWin32ExtensionName* = "VK_KHR_external_semaphore_win32"
  
  type
    VkImportSemaphoreWin32HandleInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      semaphore*: VkSemaphore
      flags*: VkSemaphoreImportFlagsKHR
      handleType*: VkExternalSemaphoreHandleTypeFlagBitsKHR
      handle*: HANDLE
      name*: WideCString

    VkExportSemaphoreWin32HandleInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      pAttributes*: ptr SECURITY_ATTRIBUTES
      dwAccess*: DWORD
      name*: WideCString

    VkD3D12FenceSubmitInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      waitSemaphoreValuesCount*: uint32
      pWaitSemaphoreValues*: ptr uint64
      signalSemaphoreValuesCount*: uint32
      pSignalSemaphoreValues*: ptr uint64

    VkSemaphoreGetWin32HandleInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      semaphore*: VkSemaphore
      handleType*: VkExternalSemaphoreHandleTypeFlagBitsKHR

    PFN_vkImportSemaphoreWin32HandleKHR* = proc (device: VkDevice; pImportSemaphoreWin32HandleInfo: ptr VkImportSemaphoreWin32HandleInfoKHR): VkResult {.cdecl.}
    PFN_vkGetSemaphoreWin32HandleKHR* = proc (device: VkDevice; pGetWin32HandleInfo: ptr VkSemaphoreGetWin32HandleInfoKHR; pHandle: ptr HANDLE): VkResult {.cdecl.}
  
  when not defined(VK_NO_PROTOTYPES):
    proc vkImportSemaphoreWin32HandleKHR*(device: VkDevice; pImportSemaphoreWin32HandleInfo: ptr VkImportSemaphoreWin32HandleInfoKHR): VkResult {.cdecl, importc.}
    proc vkGetSemaphoreWin32HandleKHR*(device: VkDevice; pGetWin32HandleInfo: ptr VkSemaphoreGetWin32HandleInfoKHR; pHandle: ptr HANDLE): VkResult {.cdecl, importc.}

const
  vKKHRExternalSemaphoreFd* = 1
  vkKhrExternalSemaphoreFdSpecVersion* = 1
  vkKhrExternalSemaphoreFdExtensionName* = "VK_KHR_external_semaphore_fd"

type
  VkImportSemaphoreFdInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    flags*: VkSemaphoreImportFlagsKHR
    handleType*: VkExternalSemaphoreHandleTypeFlagBitsKHR
    fd*: cint

  VkSemaphoreGetFdInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    semaphore*: VkSemaphore
    handleType*: VkExternalSemaphoreHandleTypeFlagBitsKHR

  PFN_vkImportSemaphoreFdKHR* = proc (device: VkDevice; pImportSemaphoreFdInfo: ptr VkImportSemaphoreFdInfoKHR): VkResult {.cdecl.}
  PFN_vkGetSemaphoreFdKHR* = proc (device: VkDevice; pGetFdInfo: ptr VkSemaphoreGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkImportSemaphoreFdKHR*(device: VkDevice; pImportSemaphoreFdInfo: ptr VkImportSemaphoreFdInfoKHR): VkResult {.cdecl, importc.}
  proc vkGetSemaphoreFdKHR*(device: VkDevice; pGetFdInfo: ptr VkSemaphoreGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl, importc.}

const
  vKKHRPushDescriptor* = 1
  vkKhrPushDescriptorSpecVersion* = 1
  vkKhrPushDescriptorExtensionName* = "VK_KHR_push_descriptor"

type
  VkPhysicalDevicePushDescriptorPropertiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    maxPushDescriptors*: uint32

  PFN_vkCmdPushDescriptorSetKHR* = proc (commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; layout: VkPipelineLayout; set: uint32; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCmdPushDescriptorSetKHR*(commandBuffer: VkCommandBuffer; pipelineBindPoint: VkPipelineBindPoint; layout: VkPipelineLayout; set: uint32; descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet) {.cdecl, importc.}

const
  vKKHR16bitStorage* = 1
  vkKhr16bitStorageSpecVersion* = 1
  vkKhr16bitStorageExtensionName* = "VK_KHR_16bit_storage"

type
  VkPhysicalDevice16BitStorageFeaturesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    storageBuffer16BitAccess*: VkBool32
    uniformAndStorageBuffer16BitAccess*: VkBool32
    storagePushConstant16*: VkBool32
    storageInputOutput16*: VkBool32


const
  vKKHRIncrementalPresent* = 1
  vkKhrIncrementalPresentSpecVersion* = 1
  vkKhrIncrementalPresentExtensionName* = "VK_KHR_incremental_present"

type
  VkRectLayerKHR* = object
    offset*: VkOffset2D
    extent*: VkExtent2D
    layer*: uint32

  VkPresentRegionKHR* = object
    rectangleCount*: uint32
    pRectangles*: ptr VkRectLayerKHR

  VkPresentRegionsKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    swapchainCount*: uint32
    pRegions*: ptr VkPresentRegionKHR


const
  vKKHRDescriptorUpdateTemplate* = 1

type
    VkDescriptorUpdateTemplateKHR* = VkNonDispatchableHandle

const
  vkKhrDescriptorUpdateTemplateSpecVersion* = 1
  vkKhrDescriptorUpdateTemplateExtensionName* = "VK_KHR_descriptor_update_template"

type
  VkDescriptorUpdateTemplateTypeKHR* {.pure, size: sizeof(cint).} = enum
    descriptorSet = 0,
    pushDescriptors = 1,

  VkDescriptorUpdateTemplateCreateFlagsKHR* = VkFlags

  VkDescriptorUpdateTemplateEntryKHR* = object
    dstBinding*: uint32
    dstArrayElement*: uint32
    descriptorCount*: uint32
    descriptorType*: VkDescriptorType
    offset*: csize
    stride*: csize

  VkDescriptorUpdateTemplateCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDescriptorUpdateTemplateCreateFlagsKHR
    descriptorUpdateEntryCount*: uint32
    pDescriptorUpdateEntries*: ptr VkDescriptorUpdateTemplateEntryKHR
    templateType*: VkDescriptorUpdateTemplateTypeKHR
    descriptorSetLayout*: VkDescriptorSetLayout
    pipelineBindPoint*: VkPipelineBindPoint
    pipelineLayout*: VkPipelineLayout
    set*: uint32

  PFN_vkCreateDescriptorUpdateTemplateKHR* = proc (device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplateKHR): VkResult {.cdecl.}
  PFN_vkDestroyDescriptorUpdateTemplateKHR* = proc (device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplateKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkUpdateDescriptorSetWithTemplateKHR* = proc (device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplateKHR; pData: pointer) {.cdecl.}
  PFN_vkCmdPushDescriptorSetWithTemplateKHR* = proc (commandBuffer: VkCommandBuffer; descriptorUpdateTemplate: VkDescriptorUpdateTemplateKHR; layout: VkPipelineLayout; set: uint32; pData: pointer) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCreateDescriptorUpdateTemplateKHR*(device: VkDevice; pCreateInfo: ptr VkDescriptorUpdateTemplateCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pDescriptorUpdateTemplate: ptr VkDescriptorUpdateTemplateKHR): VkResult {.cdecl, importc.}
  proc vkDestroyDescriptorUpdateTemplateKHR*(device: VkDevice; descriptorUpdateTemplate: VkDescriptorUpdateTemplateKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkUpdateDescriptorSetWithTemplateKHR*(device: VkDevice; descriptorSet: VkDescriptorSet; descriptorUpdateTemplate: VkDescriptorUpdateTemplateKHR; pData: pointer) {.cdecl, importc.}
  proc vkCmdPushDescriptorSetWithTemplateKHR*(commandBuffer: VkCommandBuffer; descriptorUpdateTemplate: VkDescriptorUpdateTemplateKHR; layout: VkPipelineLayout; set: uint32; pData: pointer) {.cdecl, importc.}

const
  vKKHRSharedPresentableImage* = 1
  vkKhrSharedPresentableImageSpecVersion* = 1
  vkKhrSharedPresentableImageExtensionName* = "VK_KHR_shared_presentable_image"

type
  VkSharedPresentSurfaceCapabilitiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    sharedPresentSupportedUsageFlags*: VkImageUsageFlags

  PFN_vkGetSwapchainStatusKHR* = proc (device: VkDevice; swapchain: VkSwapchainKHR): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetSwapchainStatusKHR*(device: VkDevice; swapchain: VkSwapchainKHR): VkResult {.cdecl, importc.}

const
  vKKHRExternalFenceCapabilities* = 1
  vkKhrExternalFenceCapabilitiesSpecVersion* = 1
  vkKhrExternalFenceCapabilitiesExtensionName* = "VK_KHR_external_fence_capabilities"

type
  VkExternalFenceHandleTypeFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    opaqueFd = 0x00000001,
    opaqueWin32 = 0x00000002,
    opaqueWin32Kmt = 0x00000004,
    syncFd = 0x00000008,

  VkExternalFenceHandleTypeFlagsKHR* = VkFlags

  VkExternalFenceFeatureFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    exportable = 0x00000001,
    importable = 0x00000002,

  VkExternalFenceFeatureFlagsKHR* = VkFlags

  VkPhysicalDeviceExternalFenceInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    handleType*: VkExternalFenceHandleTypeFlagBitsKHR

  VkExternalFencePropertiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    exportFromImportedHandleTypes*: VkExternalFenceHandleTypeFlagsKHR
    compatibleHandleTypes*: VkExternalFenceHandleTypeFlagsKHR
    externalFenceFeatures*: VkExternalFenceFeatureFlagsKHR

  PFN_vkGetPhysicalDeviceExternalFencePropertiesKHR* = proc (physicalDevice: VkPhysicalDevice; pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfoKHR; pExternalFenceProperties: ptr VkExternalFencePropertiesKHR) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetPhysicalDeviceExternalFencePropertiesKHR*(physicalDevice: VkPhysicalDevice; pExternalFenceInfo: ptr VkPhysicalDeviceExternalFenceInfoKHR; pExternalFenceProperties: ptr VkExternalFencePropertiesKHR) {.cdecl, importc.}

const
  vKKHRExternalFence* = 1
  vkKhrExternalFenceSpecVersion* = 1
  vkKhrExternalFenceExtensionName* = "VK_KHR_external_fence"

type
  VkFenceImportFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    temporary = 0x00000001,

  VkFenceImportFlagsKHR* = VkFlags

  VkExportFenceCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalFenceHandleTypeFlagsKHR

when defined(windows):
  const
    vKKHRExternalFenceWin32* = 1
    vkKhrExternalFenceWin32SpecVersion* = 1
    vkKhrExternalFenceWin32ExtensionName* = "VK_KHR_external_fence_win32"
  
  type
    VkImportFenceWin32HandleInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      fence*: VkFence
      flags*: VkFenceImportFlagsKHR
      handleType*: VkExternalFenceHandleTypeFlagBitsKHR
      handle*: HANDLE
      name*: WideCString

    VkExportFenceWin32HandleInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      pAttributes*: ptr SECURITY_ATTRIBUTES
      dwAccess*: DWORD
      name*: WideCString

    VkFenceGetWin32HandleInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      fence*: VkFence
      handleType*: VkExternalFenceHandleTypeFlagBitsKHR

    PFN_vkImportFenceWin32HandleKHR* = proc (device: VkDevice; pImportFenceWin32HandleInfo: ptr VkImportFenceWin32HandleInfoKHR): VkResult {.cdecl.}
    PFN_vkGetFenceWin32HandleKHR* = proc (device: VkDevice; pGetWin32HandleInfo: ptr VkFenceGetWin32HandleInfoKHR; pHandle: ptr HANDLE): VkResult {.cdecl.}
  
  when not defined(VK_NO_PROTOTYPES):
    proc vkImportFenceWin32HandleKHR*(device: VkDevice; pImportFenceWin32HandleInfo: ptr VkImportFenceWin32HandleInfoKHR): VkResult {.cdecl, importc.}
    proc vkGetFenceWin32HandleKHR*(device: VkDevice; pGetWin32HandleInfo: ptr VkFenceGetWin32HandleInfoKHR; pHandle: ptr HANDLE): VkResult {.cdecl, importc.}

const
  vKKHRExternalFenceFd* = 1
  vkKhrExternalFenceFdSpecVersion* = 1
  vkKhrExternalFenceFdExtensionName* = "VK_KHR_external_fence_fd"

type
  VkImportFenceFdInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    fence*: VkFence
    flags*: VkFenceImportFlagsKHR
    handleType*: VkExternalFenceHandleTypeFlagBitsKHR
    fd*: cint

  VkFenceGetFdInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    fence*: VkFence
    handleType*: VkExternalFenceHandleTypeFlagBitsKHR

  PFN_vkImportFenceFdKHR* = proc (device: VkDevice; pImportFenceFdInfo: ptr VkImportFenceFdInfoKHR): VkResult {.cdecl.}
  PFN_vkGetFenceFdKHR* = proc (device: VkDevice; pGetFdInfo: ptr VkFenceGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkImportFenceFdKHR*(device: VkDevice; pImportFenceFdInfo: ptr VkImportFenceFdInfoKHR): VkResult {.cdecl, importc.}
  proc vkGetFenceFdKHR*(device: VkDevice; pGetFdInfo: ptr VkFenceGetFdInfoKHR; pFd: ptr cint): VkResult {.cdecl, importc.}

const
  vKKHRMaintenance2* = 1
  vkKhrMaintenance2SpecVersion* = 1
  vkKhrMaintenance2ExtensionName* = "VK_KHR_maintenance2"

type
  VkPointClippingBehaviorKHR* {.pure, size: sizeof(cint).} = enum
    allClipPlanes = 0,
    userClipPlanesOnly = 1,

  VkTessellationDomainOriginKHR* {.pure, size: sizeof(cint).} = enum
    upperLeft = 0,
    lowerLeft = 1,

  VkPhysicalDevicePointClippingPropertiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    pointClippingBehavior*: VkPointClippingBehaviorKHR

  VkInputAttachmentAspectReferenceKHR* = object
    subpass*: uint32
    inputAttachmentIndex*: uint32
    aspectMask*: VkImageAspectFlags

  VkRenderPassInputAttachmentAspectCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    aspectReferenceCount*: uint32
    pAspectReferences*: ptr VkInputAttachmentAspectReferenceKHR

  VkImageViewUsageCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    usage*: VkImageUsageFlags

  VkPipelineTessellationDomainOriginStateCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    domainOrigin*: VkTessellationDomainOriginKHR

const
  vKKHRGetSurfaceCapabilities2* = 1
  vkKhrGetSurfaceCapabilities2SpecVersion* = 1
  vkKhrGetSurfaceCapabilities2ExtensionName* = "VK_KHR_get_surface_capabilities2"

type
  VkPhysicalDeviceSurfaceInfo2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    surface*: VkSurfaceKHR

  VkSurfaceCapabilities2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    surfaceCapabilities*: VkSurfaceCapabilitiesKHR

  VkSurfaceFormat2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    surfaceFormat*: VkSurfaceFormatKHR

  PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR* = proc (
      physicalDevice: VkPhysicalDevice;
      pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR;
      pSurfaceCapabilities: ptr VkSurfaceCapabilities2KHR): VkResult {.cdecl.}
  PFN_vkGetPhysicalDeviceSurfaceFormats2KHR* = proc (
      physicalDevice: VkPhysicalDevice;
      pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR;
      pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormat2KHR): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetPhysicalDeviceSurfaceCapabilities2KHR*(physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2KHR): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceSurfaceFormats2KHR*(physicalDevice: VkPhysicalDevice; pSurfaceInfo: ptr VkPhysicalDeviceSurfaceInfo2KHR; pSurfaceFormatCount: ptr uint32; pSurfaceFormats: ptr VkSurfaceFormat2KHR): VkResult {.cdecl, importc.}

const
  vKKHRVariablePointers* = 1
  vkKhrVariablePointersSpecVersion* = 1
  vkKhrVariablePointersExtensionName* = "VK_KHR_variable_pointers"

type
  VkPhysicalDeviceVariablePointerFeaturesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    variablePointersStorageBuffer*: VkBool32
    variablePointers*: VkBool32

const
  vKKHRDedicatedAllocation* = 1
  vkKhrDedicatedAllocationSpecVersion* = 3
  vkKhrDedicatedAllocationExtensionName* = "VK_KHR_dedicated_allocation"

type
  VkMemoryDedicatedRequirementsKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    prefersDedicatedAllocation*: VkBool32
    requiresDedicatedAllocation*: VkBool32

  VkMemoryDedicatedAllocateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage
    buffer*: VkBuffer

const
  vKKHRStorageBufferStorageClass* = 1
  vkKhrStorageBufferStorageClassSpecVersion* = 1
  vkKhrStorageBufferStorageClassExtensionName* = "VK_KHR_storage_buffer_storage_class"
  vKKHRRelaxedBlockLayout* = 1
  vkKhrRelaxedBlockLayoutSpecVersion* = 1
  vkKhrRelaxedBlockLayoutExtensionName* = "VK_KHR_relaxed_block_layout"
  vKKHRGetMemoryRequirements2* = 1
  vkKhrGetMemoryRequirements2SpecVersion* = 1
  vkKhrGetMemoryRequirements2ExtensionName* = "VK_KHR_get_memory_requirements2"

type
  VkBufferMemoryRequirementsInfo2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer

  VkImageMemoryRequirementsInfo2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage

  VkImageSparseMemoryRequirementsInfo2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage

  VkMemoryRequirements2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    memoryRequirements*: VkMemoryRequirements

  VkSparseImageMemoryRequirements2KHR* = object
    sType*: VkStructureType
    pNext*: pointer
    memoryRequirements*: VkSparseImageMemoryRequirements

  PFN_vkGetImageMemoryRequirements2KHR* = proc (device: VkDevice; pInfo: ptr VkImageMemoryRequirementsInfo2KHR; pMemoryRequirements: ptr VkMemoryRequirements2KHR) {.cdecl.}
  PFN_vkGetBufferMemoryRequirements2KHR* = proc (device: VkDevice; pInfo: ptr VkBufferMemoryRequirementsInfo2KHR; pMemoryRequirements: ptr VkMemoryRequirements2KHR) {.cdecl.}
  PFN_vkGetImageSparseMemoryRequirements2KHR* = proc (device: VkDevice; pInfo: ptr VkImageSparseMemoryRequirementsInfo2KHR; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2KHR) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetImageMemoryRequirements2KHR*(device: VkDevice; pInfo: ptr VkImageMemoryRequirementsInfo2KHR; pMemoryRequirements: ptr VkMemoryRequirements2KHR) {.cdecl, importc.}
  proc vkGetBufferMemoryRequirements2KHR*(device: VkDevice; pInfo: ptr VkBufferMemoryRequirementsInfo2KHR; pMemoryRequirements: ptr VkMemoryRequirements2KHR) {.cdecl, importc.}
  proc vkGetImageSparseMemoryRequirements2KHR*(device: VkDevice; pInfo: ptr VkImageSparseMemoryRequirementsInfo2KHR; pSparseMemoryRequirementCount: ptr uint32; pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements2KHR) {.cdecl, importc.}

const
  vKKHRImageFormatList* = 1
  vkKhrImageFormatListSpecVersion* = 1
  vkKhrImageFormatListExtensionName* = "VK_KHR_image_format_list"

type
  VkImageFormatListCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    viewFormatCount*: uint32
    pViewFormats*: ptr VkFormat

const
  vKKHRSamplerYcbcrConversion* = 1

type
    VkSamplerYcbcrConversionKHR* = VkNonDispatchableHandle

const
  vkKhrSamplerYcbcrConversionSpecVersion* = 1
  vkKhrSamplerYcbcrConversionExtensionName* = "VK_KHR_sampler_ycbcr_conversion"

type
  VkSamplerYcbcrModelConversionKHR* {.pure, size: sizeof(cint).} = enum
    rgbIdentity = 0,
    ycbcrIdentity = 1,
    ycbcr709 = 2,
    ycbcr601 = 3,
    ycbcr2020 = 4,

  VkSamplerYcbcrRangeKHR* {.pure, size: sizeof(cint).} = enum
    ituFull = 0,
    ituNarrow = 1,

  VkChromaLocationKHR* {.pure, size: sizeof(cint).} = enum
    cositedEven = 0,
    midpoint = 1,

  VkSamplerYcbcrConversionCreateInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    format*: VkFormat
    ycbcrModel*: VkSamplerYcbcrModelConversionKHR
    ycbcrRange*: VkSamplerYcbcrRangeKHR
    components*: VkComponentMapping
    xChromaOffset*: VkChromaLocationKHR
    yChromaOffset*: VkChromaLocationKHR
    chromaFilter*: VkFilter
    forceExplicitReconstruction*: VkBool32

  VkSamplerYcbcrConversionInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    conversion*: VkSamplerYcbcrConversionKHR

  VkBindImagePlaneMemoryInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    planeAspect*: VkImageAspectFlagBits

  VkImagePlaneMemoryRequirementsInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    planeAspect*: VkImageAspectFlagBits

  VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    samplerYcbcrConversion*: VkBool32

  VkSamplerYcbcrConversionImageFormatPropertiesKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    combinedImageSamplerDescriptorCount*: uint32

  PFN_vkCreateSamplerYcbcrConversionKHR* = proc (device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pYcbcrConversion: ptr VkSamplerYcbcrConversionKHR): VkResult {.cdecl.}
  PFN_vkDestroySamplerYcbcrConversionKHR* = proc (device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversionKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCreateSamplerYcbcrConversionKHR*(device: VkDevice; pCreateInfo: ptr VkSamplerYcbcrConversionCreateInfoKHR; pAllocator: ptr VkAllocationCallbacks; pYcbcrConversion: ptr VkSamplerYcbcrConversionKHR): VkResult {.cdecl, importc.}
  proc vkDestroySamplerYcbcrConversionKHR*(device: VkDevice; ycbcrConversion: VkSamplerYcbcrConversionKHR; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}

const
  vKKHRBindMemory2* = 1
  vkKhrBindMemory2SpecVersion* = 1
  vkKhrBindMemory2ExtensionName* = "VK_KHR_bind_memory2"

type
  VkBindBufferMemoryInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    buffer*: VkBuffer
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize

  VkBindImageMemoryInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage
    memory*: VkDeviceMemory
    memoryOffset*: VkDeviceSize

  PFN_vkBindBufferMemory2KHR* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindBufferMemoryInfoKHR): VkResult {.cdecl.}
  PFN_vkBindImageMemory2KHR* = proc (device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindImageMemoryInfoKHR): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkBindBufferMemory2KHR*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindBufferMemoryInfoKHR): VkResult {.cdecl, importc.}
  proc vkBindImageMemory2KHR*(device: VkDevice; bindInfoCount: uint32; pBindInfos: ptr VkBindImageMemoryInfoKHR): VkResult {.cdecl, importc.}

const
  vKEXTDebugReport* = 1

type
    VkDebugReportCallbackEXT* = VkNonDispatchableHandle

const
  vkExtDebugReportSpecVersion* = 8
  vkExtDebugReportExtensionName* = "VK_EXT_debug_report"

type
  VkDebugReportObjectTypeEXT* {.pure, size: sizeof(cint).} = enum
    unknown = 0,
    instance = 1,
    physicalDevice = 2,
    device = 3,
    queue = 4,
    semaphore = 5,
    commandBuffer = 6,
    fence = 7,
    deviceMemory = 8,
    buffer = 9,
    image = 10,
    event = 11,
    queryPool = 12,
    bufferView = 13,
    imageView = 14,
    shaderModule = 15,
    pipelineCache = 16,
    pipelineLayout = 17,
    renderPass = 18,
    pipeline = 19,
    descriptorSetLayout = 20,
    sampler = 21,
    descriptorPool = 22,
    descriptorSet = 23,
    framebuffer = 24,
    commandPool = 25,
    surfaceKhr = 26,
    swapchainKhr = 27,
    debugReportCallbackExt = 28,
    displayKhr = 29,
    displayModeKhr = 30,
    objectTableNvx = 31,
    indirectCommandsLayoutNvx = 32,
    validationCache = 33,
    descriptorUpdateTemplateKhr = 1000085000,
    samplerYcbcrConversionKhr = 1000156000,

  VkDebugReportFlagBitsEXT* {.pure, size: sizeof(cint).} = enum
    information = 0x00000001,
    warning = 0x00000002,
    performanceWarning = 0x00000004,
    error = 0x00000008,
    debug = 0x00000010,

  VkDebugReportFlagsEXT* = VkFlags

  PFN_vkDebugReportCallbackEXT* = proc (flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; cbObject: uint64; location: csize; messageCode:  int32; pLayerPrefix: cstring; pMessage: cstring; pUserData: pointer): VkBool32 {.cdecl.}

  VkDebugReportCallbackCreateInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDebugReportFlagsEXT
    pfnCallback*: PFN_vkDebugReportCallbackEXT
    pUserData*: pointer

  PFN_vkCreateDebugReportCallbackEXT* = proc (instance: VkInstance; pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pCallback: ptr VkDebugReportCallbackEXT): VkResult {.cdecl.}
  PFN_vkDestroyDebugReportCallbackEXT* = proc (instance: VkInstance; callback: VkDebugReportCallbackEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkDebugReportMessageEXT* = proc (instance: VkInstance; flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; cbObject: uint64; location: csize; messageCode:  int32; pLayerPrefix: cstring; pMessage: cstring) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCreateDebugReportCallbackEXT*(instance: VkInstance; pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pCallback: ptr VkDebugReportCallbackEXT): VkResult {.cdecl, importc.}
  proc vkDestroyDebugReportCallbackEXT*(instance: VkInstance; callback: VkDebugReportCallbackEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkDebugReportMessageEXT*(instance: VkInstance; flags: VkDebugReportFlagsEXT; objectType: VkDebugReportObjectTypeEXT; cbObject: uint64; location: csize; messageCode:  int32; pLayerPrefix: cstring; pMessage: cstring) {.cdecl, importc.}

const
  vKNVGlslShader* = 1
  vkNvGlslShaderSpecVersion* = 1
  vkNvGlslShaderExtensionName* = "VK_NV_glsl_shader"
  vKEXTDepthRangeUnrestricted* = 1
  vkExtDepthRangeUnrestrictedSpecVersion* = 1
  vkExtDepthRangeUnrestrictedExtensionName* = "VK_EXT_depth_range_unrestricted"
  vKIMGFilterCubic* = 1
  vkImgFilterCubicSpecVersion* = 1
  vkImgFilterCubicExtensionName* = "VK_IMG_filter_cubic"
  vKAMDRasterizationOrder* = 1
  vkAmdRasterizationOrderSpecVersion* = 1
  vkAmdRasterizationOrderExtensionName* = "VK_AMD_rasterization_order"

type
  VkRasterizationOrderAMD* {.pure, size: sizeof(cint).} = enum
    strict = 0,
    relaxed = 1,

  VkPipelineRasterizationStateRasterizationOrderAMD* = object
    sType*: VkStructureType
    pNext*: pointer
    rasterizationOrder*: VkRasterizationOrderAMD

const
  vKAMDShaderTrinaryMinmax* = 1
  vkAmdShaderTrinaryMinmaxSpecVersion* = 1
  vkAmdShaderTrinaryMinmaxExtensionName* = "VK_AMD_shader_trinary_minmax"
  vKAMDShaderExplicitVertexParameter* = 1
  vkAmdShaderExplicitVertexParameterSpecVersion* = 1
  vkAmdShaderExplicitVertexParameterExtensionName* = "VK_AMD_shader_explicit_vertex_parameter"
  vKEXTDebugMarker* = 1
  vkExtDebugMarkerSpecVersion* = 4
  vkExtDebugMarkerExtensionName* = "VK_EXT_debug_marker"

type
  VkDebugMarkerObjectNameInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkDebugReportObjectTypeEXT
    theObject*: uint64
    pObjectName*: cstring

  VkDebugMarkerObjectTagInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    objectType*: VkDebugReportObjectTypeEXT
    theObject*: uint64
    tagName*: uint64
    tagSize*: csize
    pTag*: pointer

  VkDebugMarkerMarkerInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    pMarkerName*: cstring
    color*: array[4, cfloat]

  PFN_vkDebugMarkerSetObjectTagEXT* = proc (device: VkDevice; pTagInfo: ptr VkDebugMarkerObjectTagInfoEXT): VkResult {.cdecl.}
  PFN_vkDebugMarkerSetObjectNameEXT* = proc (device: VkDevice; pNameInfo: ptr VkDebugMarkerObjectNameInfoEXT): VkResult {.cdecl.}
  PFN_vkCmdDebugMarkerBeginEXT* = proc (commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT) {.cdecl.}
  PFN_vkCmdDebugMarkerEndEXT* = proc (commandBuffer: VkCommandBuffer) {.cdecl.}
  PFN_vkCmdDebugMarkerInsertEXT* = proc (commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkDebugMarkerSetObjectTagEXT*(device: VkDevice; pTagInfo: ptr VkDebugMarkerObjectTagInfoEXT): VkResult {.cdecl, importc.}
  proc vkDebugMarkerSetObjectNameEXT*(device: VkDevice; pNameInfo: ptr VkDebugMarkerObjectNameInfoEXT): VkResult {.cdecl, importc.}
  proc vkCmdDebugMarkerBeginEXT*(commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT) {.cdecl, importc.}
  proc vkCmdDebugMarkerEndEXT*(commandBuffer: VkCommandBuffer) {.cdecl, importc.}
  proc vkCmdDebugMarkerInsertEXT*(commandBuffer: VkCommandBuffer; pMarkerInfo: ptr VkDebugMarkerMarkerInfoEXT) {.cdecl, importc.}

const
  vKAMDGcnShader* = 1
  vkAmdGcnShaderSpecVersion* = 1
  vkAmdGcnShaderExtensionName* = "VK_AMD_gcn_shader"
  vKNVDedicatedAllocation* = 1
  vkNvDedicatedAllocationSpecVersion* = 1
  vkNvDedicatedAllocationExtensionName* = "VK_NV_dedicated_allocation"

type
  VkDedicatedAllocationImageCreateInfoNV* = object
    sType*: VkStructureType
    pNext*: pointer
    dedicatedAllocation*: VkBool32

  VkDedicatedAllocationBufferCreateInfoNV* = object
    sType*: VkStructureType
    pNext*: pointer
    dedicatedAllocation*: VkBool32

  VkDedicatedAllocationMemoryAllocateInfoNV* = object
    sType*: VkStructureType
    pNext*: pointer
    image*: VkImage
    buffer*: VkBuffer

const
  vKAMDDrawIndirectCount* = 1
  vkAmdDrawIndirectCountSpecVersion* = 1
  vkAmdDrawIndirectCountExtensionName* = "VK_AMD_draw_indirect_count"

type
  PFN_vkCmdDrawIndirectCountAMD* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}
  PFN_vkCmdDrawIndexedIndirectCountAMD* = proc (commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCmdDrawIndirectCountAMD*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}
  proc vkCmdDrawIndexedIndirectCountAMD*(commandBuffer: VkCommandBuffer; buffer: VkBuffer; offset: VkDeviceSize; countBuffer: VkBuffer; countBufferOffset: VkDeviceSize; maxDrawCount: uint32; stride: uint32) {.cdecl, importc.}

const
  vKAMDNegativeViewportHeight* = 1
  vkAmdNegativeViewportHeightSpecVersion* = 1
  vkAmdNegativeViewportHeightExtensionName* = "VK_AMD_negative_viewport_height"
  vKAMDGpuShaderHalfFloat* = 1
  vkAmdGpuShaderHalfFloatSpecVersion* = 1
  vkAmdGpuShaderHalfFloatExtensionName* = "VK_AMD_gpu_shader_half_float"
  vKAMDShaderBallot* = 1
  vkAmdShaderBallotSpecVersion* = 1
  vkAmdShaderBallotExtensionName* = "VK_AMD_shader_ballot"
  vKAMDTextureGatherBiasLod* = 1
  vkAmdTextureGatherBiasLodSpecVersion* = 1
  vkAmdTextureGatherBiasLodExtensionName* = "VK_AMD_texture_gather_bias_lod"

type
  VkTextureLODGatherFormatPropertiesAMD* = object
    sType*: VkStructureType
    pNext*: pointer
    supportsTextureGatherLODBiasAMD*: VkBool32


const
  vKKHXMultiview* = 1
  vkKhxMultiviewSpecVersion* = 1
  vkKhxMultiviewExtensionName* = "VK_KHX_multiview"

type
  VkRenderPassMultiviewCreateInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    subpassCount*: uint32
    pViewMasks*: ptr uint32
    dependencyCount*: uint32
    pViewOffsets*: ptr  int32
    correlationMaskCount*: uint32
    pCorrelationMasks*: ptr uint32

  VkPhysicalDeviceMultiviewFeaturesKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    multiview*: VkBool32
    multiviewGeometryShader*: VkBool32
    multiviewTessellationShader*: VkBool32

  VkPhysicalDeviceMultiviewPropertiesKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    maxMultiviewViewCount*: uint32
    maxMultiviewInstanceIndex*: uint32

const
  vKIMGFormatPvrtc* = 1
  vkImgFormatPvrtcSpecVersion* = 1
  vkImgFormatPvrtcExtensionName* = "VK_IMG_format_pvrtc"
  vKNVExternalMemoryCapabilities* = 1
  vkNvExternalMemoryCapabilitiesSpecVersion* = 1
  vkNvExternalMemoryCapabilitiesExtensionName* = "VK_NV_external_memory_capabilities"

type
  VkExternalMemoryHandleTypeFlagBitsNV* {.pure, size: sizeof(cint).} = enum
    opaqueWin32 = 0x00000001,
    opaqueWin32Kmt = 0x00000002,
    d3d11Image = 0x00000004,
    d3d11ImageKmt = 0x00000008,

  VkExternalMemoryHandleTypeFlagsNV* = VkFlags

  VkExternalMemoryFeatureFlagBitsNV* {.pure, size: sizeof(cint).} = enum
    dedicatedOnly = 0x00000001,
    exportable = 0x00000002,
    importable = 0x00000004,

  VkExternalMemoryFeatureFlagsNV* = VkFlags

  VkExternalImageFormatPropertiesNV* = object
    imageFormatProperties*: VkImageFormatProperties
    externalMemoryFeatures*: VkExternalMemoryFeatureFlagsNV
    exportFromImportedHandleTypes*: VkExternalMemoryHandleTypeFlagsNV
    compatibleHandleTypes*: VkExternalMemoryHandleTypeFlagsNV

  PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV* = proc (physicalDevice: VkPhysicalDevice; format: VkFormat; iamgeType: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; externalHandleType: VkExternalMemoryHandleTypeFlagsNV; pExternalImageFormatProperties: ptr VkExternalImageFormatPropertiesNV): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetPhysicalDeviceExternalImageFormatPropertiesNV*(physicalDevice: VkPhysicalDevice; format: VkFormat; iamgeType: VkImageType; tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags; externalHandleType: VkExternalMemoryHandleTypeFlagsNV; pExternalImageFormatProperties: ptr VkExternalImageFormatPropertiesNV): VkResult {.cdecl, importc.}

const
  vKNVExternalMemory* = 1
  vkNvExternalMemorySpecVersion* = 1
  vkNvExternalMemoryExtensionName* = "VK_NV_external_memory"

type
  VkExternalMemoryImageCreateInfoNV* = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlagsNV

  VkExportMemoryAllocateInfoNV* = object
    sType*: VkStructureType
    pNext*: pointer
    handleTypes*: VkExternalMemoryHandleTypeFlagsNV


when defined(windows):
  const
    vKNVExternalMemoryWin32* = 1
    vkNvExternalMemoryWin32SpecVersion* = 1
    vkNvExternalMemoryWin32ExtensionName* = "VK_NV_external_memory_win32"
  
  type
    VkImportMemoryWin32HandleInfoNV* = object
      sType*: VkStructureType
      pNext*: pointer
      handleType*: VkExternalMemoryHandleTypeFlagsNV
      handle*: HANDLE

    VkExportMemoryWin32HandleInfoNV* = object
      sType*: VkStructureType
      pNext*: pointer
      pAttributes*: ptr SECURITY_ATTRIBUTES
      dwAccess*: DWORD

    PFN_vkGetMemoryWin32HandleNV* = proc (device: VkDevice; memory: VkDeviceMemory; handleType: VkExternalMemoryHandleTypeFlagsNV; pHandle: ptr HANDLE): VkResult {.cdecl.}
  
  when not defined(VK_NO_PROTOTYPES):
    proc vkGetMemoryWin32HandleNV*(device: VkDevice; memory: VkDeviceMemory; handleType: VkExternalMemoryHandleTypeFlagsNV; pHandle: ptr HANDLE): VkResult {.cdecl, importc.}


when defined(windows):
  const
    vKNVWin32KeyedMutex* = 1
    vkNvWin32KeyedMutexSpecVersion* = 1
    vkNvWin32KeyedMutexExtensionName* = "VK_NV_win32_keyed_mutex"

  type
    VkWin32KeyedMutexAcquireReleaseInfoNV* = object
      sType*: VkStructureType
      pNext*: pointer
      acquireCount*: uint32
      pAcquireSyncs*: ptr VkDeviceMemory
      pAcquireKeys*: ptr uint64
      pAcquireTimeoutMilliseconds*: ptr uint32
      releaseCount*: uint32
      pReleaseSyncs*: ptr VkDeviceMemory
      pReleaseKeys*: ptr uint64

const
  vKKHXDeviceGroup* = 1
  vkKhxDeviceGroupSpecVersion* = 2
  vkKhxDeviceGroupExtensionName* = "VK_KHX_device_group"
  vkMaxDeviceGroupSizeKhx* = 32

type
  VkPeerMemoryFeatureFlagBitsKHX* {.pure, size: sizeof(cint).} = enum
    copySrc = 0x00000001,
    copyDst = 0x00000002,
    genericSrc = 0x00000004,
    genericDst = 0x00000008,

  VkPeerMemoryFeatureFlagsKHX* = VkFlags

  VkMemoryAllocateFlagBitsKHX* {.pure, size: sizeof(cint).} = enum
    deviceMask = 0x00000001,

  VkMemoryAllocateFlagsKHX* = VkFlags
  VkDeviceGroupPresentModeFlagBitsKHX* {.pure, size: sizeof(cint).} = enum
    local = 0x00000001,
    remote = 0x00000002,
    sum = 0x00000004,
    localMultiDevice = 0x00000008,

  VkDeviceGroupPresentModeFlagsKHX* = VkFlags

  VkMemoryAllocateFlagsInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkMemoryAllocateFlagsKHX
    deviceMask*: uint32

  VkDeviceGroupRenderPassBeginInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    deviceMask*: uint32
    deviceRenderAreaCount*: uint32
    pDeviceRenderAreas*: ptr VkRect2D

  VkDeviceGroupCommandBufferBeginInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    deviceMask*: uint32

  VkDeviceGroupSubmitInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    waitSemaphoreCount*: uint32
    pWaitSemaphoreDeviceIndices*: ptr uint32
    commandBufferCount*: uint32
    pCommandBufferDeviceMasks*: ptr uint32
    signalSemaphoreCount*: uint32
    pSignalSemaphoreDeviceIndices*: ptr uint32

  VkDeviceGroupBindSparseInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    resourceDeviceIndex*: uint32
    memoryDeviceIndex*: uint32

  VkBindBufferMemoryDeviceGroupInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32

  VkBindImageMemoryDeviceGroupInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    deviceIndexCount*: uint32
    pDeviceIndices*: ptr uint32
    SFRRectCount*: uint32
    pSFRRects*: ptr VkRect2D

  VkDeviceGroupPresentCapabilitiesKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    presentMask*: array[vkMaxDeviceGroupSizeKhx, uint32]
    modes*: VkDeviceGroupPresentModeFlagsKHX

  VkImageSwapchainCreateInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    swapchain*: VkSwapchainKHR

  VkBindImageMemorySwapchainInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    swapchain*: VkSwapchainKHR
    imageIndex*: uint32

  VkAcquireNextImageInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    swapchain*: VkSwapchainKHR
    timeout*: uint64
    semaphore*: VkSemaphore
    fence*: VkFence
    deviceMask*: uint32

  VkDeviceGroupPresentInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    swapchainCount*: uint32
    pDeviceMasks*: ptr uint32
    mode*: VkDeviceGroupPresentModeFlagBitsKHX

  VkDeviceGroupSwapchainCreateInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    modes*: VkDeviceGroupPresentModeFlagsKHX

  PFN_vkGetDeviceGroupPeerMemoryFeaturesKHX* = proc (device: VkDevice; heapIndex: uint32; localDeviceIndex: uint32; remoteDeviceIndex: uint32; pPeerMemoryFeatures: ptr VkPeerMemoryFeatureFlagsKHX) {.cdecl.}
  PFN_vkCmdSetDeviceMaskKHX* = proc (commandBuffer: VkCommandBuffer; deviceMask: uint32) {.cdecl.}
  PFN_vkCmdDispatchBaseKHX* = proc (commandBuffer: VkCommandBuffer; baseGroupX: uint32; baseGroupY: uint32; baseGroupZ: uint32; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl.}
  PFN_vkGetDeviceGroupPresentCapabilitiesKHX* = proc (device: VkDevice; pDeviceGroupPresentCapabilities: ptr VkDeviceGroupPresentCapabilitiesKHX): VkResult {.cdecl.}
  PFN_vkGetDeviceGroupSurfacePresentModesKHX* = proc (device: VkDevice; surface: VkSurfaceKHR; pModes: ptr VkDeviceGroupPresentModeFlagsKHX): VkResult {.cdecl.}
  PFN_vkGetPhysicalDevicePresentRectanglesKHX* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pRectCount: ptr uint32; pRects: ptr VkRect2D): VkResult {.cdecl.}
  PFN_vkAcquireNextImage2KHX* = proc (device: VkDevice; pAcquireInfo: ptr VkAcquireNextImageInfoKHX; pImageIndex: ptr uint32): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetDeviceGroupPeerMemoryFeaturesKHX*(device: VkDevice; heapIndex: uint32; localDeviceIndex: uint32; remoteDeviceIndex: uint32; pPeerMemoryFeatures: ptr VkPeerMemoryFeatureFlagsKHX) {.cdecl, importc.}
  proc vkCmdSetDeviceMaskKHX*(commandBuffer: VkCommandBuffer; deviceMask: uint32) {.cdecl, importc.}
  proc vkCmdDispatchBaseKHX*(commandBuffer: VkCommandBuffer; baseGroupX: uint32; baseGroupY: uint32; baseGroupZ: uint32; groupCountX: uint32; groupCountY: uint32; groupCountZ: uint32) {.cdecl, importc.}
  proc vkGetDeviceGroupPresentCapabilitiesKHX*(device: VkDevice; pDeviceGroupPresentCapabilities: ptr VkDeviceGroupPresentCapabilitiesKHX): VkResult {.cdecl, importc.}
  proc vkGetDeviceGroupSurfacePresentModesKHX*(device: VkDevice; surface: VkSurfaceKHR; pModes: ptr VkDeviceGroupPresentModeFlagsKHX): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDevicePresentRectanglesKHX*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pRectCount: ptr uint32; pRects: ptr VkRect2D): VkResult {.cdecl, importc.}
  proc vkAcquireNextImage2KHX*(device: VkDevice; pAcquireInfo: ptr VkAcquireNextImageInfoKHX; pImageIndex: ptr uint32): VkResult {.cdecl, importc.}

const
  vKEXTValidationFlags* = 1
  vkExtValidationFlagsSpecVersion* = 1
  vkExtValidationFlagsExtensionName* = "VK_EXT_validation_flags"

type
  VkValidationCheckEXT* {.pure, size: sizeof(cint).} = enum
    checkAll = 0,
    checkShaders = 1,

  VkValidationFlagsEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    disabledValidationCheckCount*: uint32
    pDisabledValidationChecks*: ptr VkValidationCheckEXT


when defined(VK_USE_PLATFORM_VI_NN):
  const
    vKNNViSurface* = 1
    vkNnViSurfaceSpecVersion* = 1
    vkNnViSurfaceExtensionName* = "VK_NN_vi_surface"

  type
    VkViSurfaceCreateFlagsNN* = VkFlags

    VkViSurfaceCreateInfoNN* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkViSurfaceCreateFlagsNN
      window*: pointer

    PFN_vkCreateViSurfaceNN* = proc (instance: VkInstance; pCreateInfo: ptr VkViSurfaceCreateInfoNN; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}

  when not defined(VK_NO_PROTOTYPES):
    proc vkCreateViSurfaceNN*(instance: VkInstance; pCreateInfo: ptr VkViSurfaceCreateInfoNN; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}

const
  vKEXTShaderSubgroupBallot* = 1
  vkExtShaderSubgroupBallotSpecVersion* = 1
  vkExtShaderSubgroupBallotExtensionName* = "VK_EXT_shader_subgroup_ballot"
  vKEXTShaderSubgroupVote* = 1
  vkExtShaderSubgroupVoteSpecVersion* = 1
  vkExtShaderSubgroupVoteExtensionName* = "VK_EXT_shader_subgroup_vote"
  vKKHXDeviceGroupCreation* = 1
  vkKhxDeviceGroupCreationSpecVersion* = 1
  vkKhxDeviceGroupCreationExtensionName* = "VK_KHX_device_group_creation"

type
  VkPhysicalDeviceGroupPropertiesKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    physicalDevices*: array[vkMaxDeviceGroupSizeKhx, VkPhysicalDevice]
    subsetAllocation*: VkBool32

  VkDeviceGroupDeviceCreateInfoKHX* = object
    sType*: VkStructureType
    pNext*: pointer
    physicalDeviceCount*: uint32
    pPhysicalDevices*: ptr VkPhysicalDevice

  PFN_vkEnumeratePhysicalDeviceGroupsKHX* = proc (instance: VkInstance; pPhysicalDeviceGroupCount: ptr uint32; pPhysicalDeviceGroupProperties: ptr VkPhysicalDeviceGroupPropertiesKHX): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkEnumeratePhysicalDeviceGroupsKHX*(instance: VkInstance; pPhysicalDeviceGroupCount: ptr uint32; pPhysicalDeviceGroupProperties: ptr VkPhysicalDeviceGroupPropertiesKHX): VkResult {.cdecl, importc.}

const
  vKNVXDeviceGeneratedCommands* = 1

type
    VkObjectTableNVX* = VkNonDispatchableHandle
    VkIndirectCommandsLayoutNVX* = VkNonDispatchableHandle

const
  vkNvxDeviceGeneratedCommandsSpecVersion* = 3
  vkNvxDeviceGeneratedCommandsExtensionName* = "VK_NVX_device_generated_commands"

type
  VkIndirectCommandsTokenTypeNVX* {.pure, size: sizeof(cint).} = enum
    pipeline = 0,
    descriptorSet = 1,
    indexBuffer = 2,
    vertexBuffer = 3,
    pushConstant = 4,
    drawIndexed = 5,
    draw = 6,
    dispatch = 7

  VkObjectEntryTypeNVX* {.pure, size: sizeof(cint).} = enum
    descriptorSet = 0,
    pipeline = 1,
    indexBuffer = 2,
    vertexBuffer = 3,
    pushConstant = 4

  VkIndirectCommandsLayoutUsageFlagBitsNVX* {.pure, size: sizeof(cint).} = enum
    unorderedSequences = 0x00000001,
    sparseSequences = 0x00000002,
    emptyExecutions = 0x00000004,
    indexedSequences = 0x00000008,

  VkIndirectCommandsLayoutUsageFlagsNVX* = VkFlags

  VkObjectEntryUsageFlagBitsNVX* {.pure, size: sizeof(cint).} = enum
    graphics = 0x00000001,
    compute = 0x00000002,

  VkObjectEntryUsageFlagsNVX* = VkFlags

  VkDeviceGeneratedCommandsFeaturesNVX* = object
    sType*: VkStructureType
    pNext*: pointer
    computeBindingPointSupport*: VkBool32

  VkDeviceGeneratedCommandsLimitsNVX* = object
    sType*: VkStructureType
    pNext*: pointer
    maxIndirectCommandsLayoutTokenCount*: uint32
    maxObjectEntryCounts*: uint32
    minSequenceCountBufferOffsetAlignment*: uint32
    minSequenceIndexBufferOffsetAlignment*: uint32
    minCommandsTokenBufferOffsetAlignment*: uint32

  VkIndirectCommandsTokenNVX* = object
    tokenType*: VkIndirectCommandsTokenTypeNVX
    buffer*: VkBuffer
    offset*: VkDeviceSize

  VkIndirectCommandsLayoutTokenNVX* = object
    tokenType*: VkIndirectCommandsTokenTypeNVX
    bindingUnit*: uint32
    dynamicCount*: uint32
    divisor*: uint32

  VkIndirectCommandsLayoutCreateInfoNVX* = object
    sType*: VkStructureType
    pNext*: pointer
    pipelineBindPoint*: VkPipelineBindPoint
    flags*: VkIndirectCommandsLayoutUsageFlagsNVX
    tokenCount*: uint32
    pTokens*: ptr VkIndirectCommandsLayoutTokenNVX

  VkCmdProcessCommandsInfoNVX* = object
    sType*: VkStructureType
    pNext*: pointer
    objectTable*: VkObjectTableNVX
    indirectCommandsLayout*: VkIndirectCommandsLayoutNVX
    indirectCommandsTokenCount*: uint32
    pIndirectCommandsTokens*: ptr VkIndirectCommandsTokenNVX
    maxSequencesCount*: uint32
    targetCommandBuffer*: VkCommandBuffer
    sequencesCountBuffer*: VkBuffer
    sequencesCountOffset*: VkDeviceSize
    sequencesIndexBuffer*: VkBuffer
    sequencesIndexOffset*: VkDeviceSize

  VkCmdReserveSpaceForCommandsInfoNVX* = object
    sType*: VkStructureType
    pNext*: pointer
    objectTable*: VkObjectTableNVX
    indirectCommandsLayout*: VkIndirectCommandsLayoutNVX
    maxSequencesCount*: uint32

  VkObjectTableCreateInfoNVX* = object
    sType*: VkStructureType
    pNext*: pointer
    objectCount*: uint32
    pObjectEntryTypes*: ptr VkObjectEntryTypeNVX
    pObjectEntryCounts*: ptr uint32
    pObjectEntryUsageFlags*: ptr VkObjectEntryUsageFlagsNVX
    maxUniformBuffersPerDescriptor*: uint32
    maxStorageBuffersPerDescriptor*: uint32
    maxStorageImagesPerDescriptor*: uint32
    maxSampledImagesPerDescriptor*: uint32
    maxPipelineLayouts*: uint32

  VkObjectTableEntryNVX* = object
    entryType*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX

  VkObjectTablePipelineEntryNVX* = object
    entryType*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    pipeline*: VkPipeline

  VkObjectTableDescriptorSetEntryNVX* = object
    entryType*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    pipelineLayout*: VkPipelineLayout
    descriptorSet*: VkDescriptorSet

  VkObjectTableVertexBufferEntryNVX* = object
    entryType*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    buffer*: VkBuffer

  VkObjectTableIndexBufferEntryNVX* = object
    entryType*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    buffer*: VkBuffer
    indexType*: VkIndexType

  VkObjectTablePushConstantEntryNVX* = object
    entryType*: VkObjectEntryTypeNVX
    flags*: VkObjectEntryUsageFlagsNVX
    pipelineLayout*: VkPipelineLayout
    stageFlags*: VkShaderStageFlags

  PFN_vkCmdProcessCommandsNVX* = proc (commandBuffer: VkCommandBuffer; pProcessCommandsInfo: ptr VkCmdProcessCommandsInfoNVX) {.cdecl.}
  PFN_vkCmdReserveSpaceForCommandsNVX* = proc (commandBuffer: VkCommandBuffer; pReserveSpaceInfo: ptr VkCmdReserveSpaceForCommandsInfoNVX) {.cdecl.}
  PFN_vkCreateIndirectCommandsLayoutNVX* = proc (device: VkDevice; pCreateInfo: ptr VkIndirectCommandsLayoutCreateInfoNVX; pAllocator: ptr VkAllocationCallbacks; pIndirectCommandsLayout: ptr VkIndirectCommandsLayoutNVX): VkResult {.cdecl.}
  PFN_vkDestroyIndirectCommandsLayoutNVX* = proc (device: VkDevice; indirectCommandsLayout: VkIndirectCommandsLayoutNVX; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkCreateObjectTableNVX* = proc (device: VkDevice; pCreateInfo: ptr VkObjectTableCreateInfoNVX; pAllocator: ptr VkAllocationCallbacks; pObjectTable: ptr VkObjectTableNVX): VkResult {.cdecl.}
  PFN_vkDestroyObjectTableNVX* = proc (device: VkDevice; objectTable: VkObjectTableNVX; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkRegisterObjectsNVX* = proc (device: VkDevice; objectTable: VkObjectTableNVX; objectCount: uint32; ppObjectTableEntries: ptr ptr VkObjectTableEntryNVX; pObjectIndices: ptr uint32): VkResult {.cdecl.}
  PFN_vkUnregisterObjectsNVX* = proc (device: VkDevice; objectTable: VkObjectTableNVX; objectCount: uint32; pObjectEntryTypes: ptr VkObjectEntryTypeNVX; pObjectIndices: ptr uint32): VkResult {.cdecl.}
  PFN_vkGetPhysicalDeviceGeneratedCommandsPropertiesNVX* = proc (physicalDevice: VkPhysicalDevice; pFeatures: ptr VkDeviceGeneratedCommandsFeaturesNVX; pLimits: ptr VkDeviceGeneratedCommandsLimitsNVX) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCmdProcessCommandsNVX*(commandBuffer: VkCommandBuffer; pProcessCommandsInfo: ptr VkCmdProcessCommandsInfoNVX) {.cdecl, importc.}
  proc vkCmdReserveSpaceForCommandsNVX*(commandBuffer: VkCommandBuffer; pReserveSpaceInfo: ptr VkCmdReserveSpaceForCommandsInfoNVX) {.cdecl, importc.}
  proc vkCreateIndirectCommandsLayoutNVX*(device: VkDevice; pCreateInfo: ptr VkIndirectCommandsLayoutCreateInfoNVX; pAllocator: ptr VkAllocationCallbacks; pIndirectCommandsLayout: ptr VkIndirectCommandsLayoutNVX): VkResult {.cdecl, importc.}
  proc vkDestroyIndirectCommandsLayoutNVX*(device: VkDevice; indirectCommandsLayout: VkIndirectCommandsLayoutNVX; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkCreateObjectTableNVX*(device: VkDevice; pCreateInfo: ptr VkObjectTableCreateInfoNVX; pAllocator: ptr VkAllocationCallbacks; pObjectTable: ptr VkObjectTableNVX): VkResult {.cdecl, importc.}
  proc vkDestroyObjectTableNVX*(device: VkDevice; objectTable: VkObjectTableNVX; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkRegisterObjectsNVX*(device: VkDevice; objectTable: VkObjectTableNVX; objectCount: uint32; ppObjectTableEntries: ptr ptr VkObjectTableEntryNVX; pObjectIndices: ptr uint32): VkResult {.cdecl, importc.}
  proc vkUnregisterObjectsNVX*(device: VkDevice; objectTable: VkObjectTableNVX; objectCount: uint32; pObjectEntryTypes: ptr VkObjectEntryTypeNVX; pObjectIndices: ptr uint32): VkResult {.cdecl, importc.}
  proc vkGetPhysicalDeviceGeneratedCommandsPropertiesNVX*(physicalDevice: VkPhysicalDevice; pFeatures: ptr VkDeviceGeneratedCommandsFeaturesNVX; pLimits: ptr VkDeviceGeneratedCommandsLimitsNVX) {.cdecl, importc.}

const
  vKNVClipSpaceWScaling* = 1
  vkNvClipSpaceWScalingSpecVersion* = 1
  vkNvClipSpaceWScalingExtensionName* = "VK_NV_clip_space_w_scaling"

type
  VkViewportWScalingNV* = object
    xcoeff*: cfloat
    ycoeff*: cfloat

  VkPipelineViewportWScalingStateCreateInfoNV* = object
    sType*: VkStructureType
    pNext*: pointer
    viewportWScalingEnable*: VkBool32
    viewportCount*: uint32
    pViewportWScalings*: ptr VkViewportWScalingNV

  PFN_vkCmdSetViewportWScalingNV* = proc (commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewportWScalings: ptr VkViewportWScalingNV) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCmdSetViewportWScalingNV*(commandBuffer: VkCommandBuffer; firstViewport: uint32; viewportCount: uint32; pViewportWScalings: ptr VkViewportWScalingNV) {.cdecl, importc.}

const
  vKExtDirectModeDisplay* = 1
  vkExtDirectModeDisplaySpecVersion* = 1
  vkExtDirectModeDisplayExtensionName* = "VK_EXT_direct_mode_display"

type
  PFN_vkReleaseDisplayEXT* = proc (physicalDevice: VkPhysicalDevice; display: VkDisplayKHR): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkReleaseDisplayEXT*(physicalDevice: VkPhysicalDevice; display: VkDisplayKHR): VkResult {.cdecl, importc.}


when defined(linux) and not defined(android):
  const
    vKExtAcquireXlibDisplay* = 1
  
  const
    vkExtAcquireXlibDisplaySpecVersion* = 1
    vkExtAcquireXlibDisplayExtensionName* = "VK_EXT_acquire_xlib_display"
  
  type
    PFN_vkAcquireXlibDisplayEXT* = proc (physicalDevice: VkPhysicalDevice; dpy: pointer; display: VkDisplayKHR): VkResult {.cdecl.}
    PFN_vkGetRandROutputDisplayEXT* = proc (physicalDevice: VkPhysicalDevice; dpy: pointer; rrOutput: culong; pDisplay: ptr VkDisplayKHR): VkResult {.cdecl.}
  
  when not defined(VK_NO_PROTOTYPES):
    proc vkAcquireXlibDisplayEXT*(physicalDevice: VkPhysicalDevice; dpy: pointer; display: VkDisplayKHR): VkResult {.cdecl, importc.}
    proc vkGetRandROutputDisplayEXT*(physicalDevice: VkPhysicalDevice; dpy: pointer; rrOutput: culong; pDisplay: ptr VkDisplayKHR): VkResult {.cdecl, importc.}

const
  vKEXTDisplaySurfaceCounter* = 1
  vkExtDisplaySurfaceCounterSpecVersion* = 1
  vkExtDisplaySurfaceCounterExtensionName* = "VK_EXT_display_surface_counter"

type
  VkSurfaceCounterFlagBitsEXT* {.pure, size: sizeof(cint).} = enum
    vblank = 0x00000001,

  VkSurfaceCounterFlagsEXT* = VkFlags
  VkSurfaceCapabilities2EXT* = object
    sType*: VkStructureType
    pNext*: pointer
    minImageCount*: uint32
    maxImageCount*: uint32
    currentExtent*: VkExtent2D
    minImageExtent*: VkExtent2D
    maxImageExtent*: VkExtent2D
    maxImageArrayLayers*: uint32
    supportedTransforms*: VkSurfaceTransformFlagsKHR
    currentTransform*: VkSurfaceTransformFlagBitsKHR
    supportedCompositeAlpha*: VkCompositeAlphaFlagsKHR
    supportedUsageFlags*: VkImageUsageFlags
    supportedSurfaceCounters*: VkSurfaceCounterFlagsEXT

  PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT* = proc (physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2EXT): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetPhysicalDeviceSurfaceCapabilities2EXT*(physicalDevice: VkPhysicalDevice; surface: VkSurfaceKHR; pSurfaceCapabilities: ptr VkSurfaceCapabilities2EXT): VkResult {.cdecl, importc.}

const
  vKEXTDisplayControl* = 1
  vkExtDisplayControlSpecVersion* = 1
  vkExtDisplayControlExtensionName* = "VK_EXT_display_control"

type
  VkDisplayPowerStateEXT* {.pure, size: sizeof(cint).} = enum
    off = 0,
    suspend = 1,
    on = 2,

  VkDeviceEventTypeEXT* {.pure, size: sizeof(cint).} = enum
    displayHotplug = 0,

  VkDisplayEventTypeEXT* {.pure, size: sizeof(cint).} = enum
    firstPixelOut = 0,

  VkDisplayPowerInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    powerState*: VkDisplayPowerStateEXT

  VkDeviceEventInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    deviceEvent*: VkDeviceEventTypeEXT

  VkDisplayEventInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    displayEvent*: VkDisplayEventTypeEXT

  VkSwapchainCounterCreateInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    surfaceCounters*: VkSurfaceCounterFlagsEXT

  PFN_vkDisplayPowerControlEXT* = proc (device: VkDevice; display: VkDisplayKHR; pDisplayPowerInfo: ptr VkDisplayPowerInfoEXT): VkResult {.cdecl.}
  PFN_vkRegisterDeviceEventEXT* = proc (device: VkDevice; pDeviceEventInfo: ptr VkDeviceEventInfoEXT; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl.}
  PFN_vkRegisterDisplayEventEXT* = proc (device: VkDevice; display: VkDisplayKHR; pDisplayEventInfo: ptr VkDisplayEventInfoEXT; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl.}
  PFN_vkGetSwapchainCounterEXT* = proc (device: VkDevice; swapchain: VkSwapchainKHR; counter: VkSurfaceCounterFlagBitsEXT; pCounterValue: ptr uint64): VkResult {.cdecl.}


when not defined(VK_NO_PROTOTYPES):
  proc vkDisplayPowerControlEXT*(device: VkDevice; display: VkDisplayKHR; pDisplayPowerInfo: ptr VkDisplayPowerInfoEXT): VkResult {.cdecl, importc.}
  proc vkRegisterDeviceEventEXT*(device: VkDevice; pDeviceEventInfo: ptr VkDeviceEventInfoEXT; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkRegisterDisplayEventEXT*(device: VkDevice; display: VkDisplayKHR; pDisplayEventInfo: ptr VkDisplayEventInfoEXT; pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult {.cdecl, importc.}
  proc vkGetSwapchainCounterEXT*(device: VkDevice; swapchain: VkSwapchainKHR; counter: VkSurfaceCounterFlagBitsEXT; pCounterValue: ptr uint64): VkResult {.cdecl, importc.}

const
  vKGOOGLEDisplayTiming* = 1
  vkGoogleDisplayTimingSpecVersion* = 1
  vkGoogleDisplayTimingExtensionName* = "VK_GOOGLE_display_timing"

type
  VkRefreshCycleDurationGOOGLE* = object
    refreshDuration*: uint64

  VkPastPresentationTimingGOOGLE* = object
    presentID*: uint32
    desiredPresentTime*: uint64
    actualPresentTime*: uint64
    earliestPresentTime*: uint64
    presentMargin*: uint64

  VkPresentTimeGOOGLE* = object
    presentID*: uint32
    desiredPresentTime*: uint64

  VkPresentTimesInfoGOOGLE* = object
    sType*: VkStructureType
    pNext*: pointer
    swapchainCount*: uint32
    pTimes*: ptr VkPresentTimeGOOGLE

  PFN_vkGetRefreshCycleDurationGOOGLE* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pDisplayTimingProperties: ptr VkRefreshCycleDurationGOOGLE): VkResult {.cdecl.}
  PFN_vkGetPastPresentationTimingGOOGLE* = proc (device: VkDevice; swapchain: VkSwapchainKHR; pPresentationTimingCount: ptr uint32; pPresentationTimings: ptr VkPastPresentationTimingGOOGLE): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkGetRefreshCycleDurationGOOGLE*(device: VkDevice; swapchain: VkSwapchainKHR; pDisplayTimingProperties: ptr VkRefreshCycleDurationGOOGLE): VkResult {.cdecl, importc.}
  proc vkGetPastPresentationTimingGOOGLE*(device: VkDevice; swapchain: VkSwapchainKHR; pPresentationTimingCount: ptr uint32; pPresentationTimings: ptr VkPastPresentationTimingGOOGLE): VkResult {.cdecl, importc.}

const
  vKNVSampleMaskOverrideCoverage* = 1
  vkNvSampleMaskOverrideCoverageSpecVersion* = 1
  vkNvSampleMaskOverrideCoverageExtensionName* = "VK_NV_sample_mask_override_coverage"
  vKNVGeometryShaderPassthrough* = 1
  vkNvGeometryShaderPassthroughSpecVersion* = 1
  vkNvGeometryShaderPassthroughExtensionName* = "VK_NV_geometry_shader_passthrough"
  vKNVViewportArray2* = 1
  vkNvViewportArray2SpecVersion* = 1
  vkNvViewportArray2ExtensionName* = "VK_NV_viewport_array2"
  vKNVXMultiviewPerViewAttributes* = 1
  vkNvxMultiviewPerViewAttributesSpecVersion* = 1
  vkNvxMultiviewPerViewAttributesExtensionName* = "VK_NVX_multiview_per_view_attributes"

type
  VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX* = object
    sType*: VkStructureType
    pNext*: pointer
    perViewPositionAllComponents*: VkBool32

const
  vKNVViewportSwizzle* = 1
  vkNvViewportSwizzleSpecVersion* = 1
  vkNvViewportSwizzleExtensionName* = "VK_NV_viewport_swizzle"

type
  VkViewportCoordinateSwizzleNV* {.pure, size: sizeof(cint).} = enum
    positiveX = 0,
    negativeX = 1,
    positiveY = 2,
    negativeY = 3,
    positiveZ = 4,
    negativeZ = 5,
    positiveW = 6,
    negativeW = 7,

  VkPipelineViewportSwizzleStateCreateFlagsNV* = VkFlags

  VkViewportSwizzleNV* = object
    x*: VkViewportCoordinateSwizzleNV
    y*: VkViewportCoordinateSwizzleNV
    z*: VkViewportCoordinateSwizzleNV
    w*: VkViewportCoordinateSwizzleNV

  VkPipelineViewportSwizzleStateCreateInfoNV* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineViewportSwizzleStateCreateFlagsNV
    viewportCount*: uint32
    pViewportSwizzles*: ptr VkViewportSwizzleNV

const
  vKEXTDiscardRectangles* = 1
  vkExtDiscardRectanglesSpecVersion* = 1
  vkExtDiscardRectanglesExtensionName* = "VK_EXT_discard_rectangles"

type
  VkDiscardRectangleModeEXT* {.pure, size: sizeof(cint).} = enum
    inclusive = 0,
    exclusive = 1,

  VkPipelineDiscardRectangleStateCreateFlagsEXT* = VkFlags

  VkPhysicalDeviceDiscardRectanglePropertiesEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    maxDiscardRectangles*: uint32

  VkPipelineDiscardRectangleStateCreateInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineDiscardRectangleStateCreateFlagsEXT
    discardRectangleMode*: VkDiscardRectangleModeEXT
    discardRectangleCount*: uint32
    pDiscardRectangles*: ptr VkRect2D

  PFN_vkCmdSetDiscardRectangleEXT* = proc (commandBuffer: VkCommandBuffer; firstDiscardRectangle: uint32; discardRectangleCount: uint32; pDiscardRectangles: ptr VkRect2D) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCmdSetDiscardRectangleEXT*(commandBuffer: VkCommandBuffer; firstDiscardRectangle: uint32; discardRectangleCount: uint32; pDiscardRectangles: ptr VkRect2D) {.cdecl, importc.}

const
  vKEXTSwapchainColorspace* = 1
  vkExtSwapchainColorSpaceSpecVersion* = 3
  vkExtSwapchainColorSpaceExtensionName* = "VK_EXT_swapchain_colorspace"
  vKEXTHdrMetadata* = 1
  vkExtHdrMetadataSpecVersion* = 1
  vkExtHdrMetadataExtensionName* = "VK_EXT_hdr_metadata"

type
  VkXYColorEXT* = object
    x*: cfloat
    y*: cfloat

  VkHdrMetadataEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    displayPrimaryRed*: VkXYColorEXT
    displayPrimaryGreen*: VkXYColorEXT
    displayPrimaryBlue*: VkXYColorEXT
    whitePoint*: VkXYColorEXT
    maxLuminance*: cfloat
    minLuminance*: cfloat
    maxContentLightLevel*: cfloat
    maxFrameAverageLightLevel*: cfloat

  PFN_vkSetHdrMetadataEXT* = proc (device: VkDevice; swapchainCount: uint32; pSwapchains: ptr VkSwapchainKHR; pMetadata: ptr VkHdrMetadataEXT) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkSetHdrMetadataEXT*(device: VkDevice; swapchainCount: uint32; pSwapchains: ptr VkSwapchainKHR; pMetadata: ptr VkHdrMetadataEXT) {.cdecl, importc.}


when defined(ios):
  const
    vKMVKIosSurface* = 1
    vkMvkIosSurfaceSpecVersion* = 2
    vkMvkIosSurfaceExtensionName* = "VK_MVK_ios_surface"

  type
    VkIOSSurfaceCreateFlagsMVK* = VkFlags
    VkIOSSurfaceCreateInfoMVK* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkIOSSurfaceCreateFlagsMVK
      pView*: pointer

    PFN_vkCreateIOSSurfaceMVK* = proc (instance: VkInstance; pCreateInfo: ptr VkIOSSurfaceCreateInfoMVK; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}
  
  when not defined(VK_NO_PROTOTYPES):
    proc vkCreateIOSSurfaceMVK*(instance: VkInstance; pCreateInfo: ptr VkIOSSurfaceCreateInfoMVK; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}


when defined(macosx) and not defined(ios):
  const
    vKMVKMacosSurface* = 1
    vkMvkMacosSurfaceSpecVersion* = 2
    vkMvkMacosSurfaceExtensionName* = "VK_MVK_macos_surface"

  type
    VkMacOSSurfaceCreateFlagsMVK* = VkFlags
    VkMacOSSurfaceCreateInfoMVK* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkMacOSSurfaceCreateFlagsMVK
      pView*: pointer

    PFN_vkCreateMacOSSurfaceMVK* = proc (instance: VkInstance; pCreateInfo: ptr VkMacOSSurfaceCreateInfoMVK; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl.}

  when not defined(VK_NO_PROTOTYPES):
    proc vkCreateMacOSSurfaceMVK*(instance: VkInstance; pCreateInfo: ptr VkMacOSSurfaceCreateInfoMVK; pAllocator: ptr VkAllocationCallbacks; pSurface: ptr VkSurfaceKHR): VkResult {.cdecl, importc.}

const
  vKEXTSamplerFilterMinmax* = 1
  vkExtSamplerFilterMinmaxSpecVersion* = 1
  vkExtSamplerFilterMinmaxExtensionName* = "VK_EXT_sampler_filter_minmax"

type
  VkSamplerReductionModeEXT* {.pure, size: sizeof(cint).} = enum
    weightedAverage = 0,
    min = 1,
    max = 2,

  VkSamplerReductionModeCreateInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    reductionMode*: VkSamplerReductionModeEXT

  VkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    filterMinmaxSingleComponentFormats*: VkBool32
    filterMinmaxImageComponentMapping*: VkBool32

const
  vKAMDGpuShaderInt16* = 1
  vkAmdGpuShaderInt16SpecVersion* = 1
  vkAmdGpuShaderInt16ExtensionName* = "VK_AMD_gpu_shader_int16"
  vKAMDMixedAttachmentSamples* = 1
  vkAmdMixedAttachmentSamplesSpecVersion* = 1
  vkAmdMixedAttachmentSamplesExtensionName* = "VK_AMD_mixed_attachment_samples"
  vKAMDShaderFragmentMask* = 1
  vkAmdShaderFragmentMaskSpecVersion* = 1
  vkAmdShaderFragmentMaskExtensionName* = "VK_AMD_shader_fragment_mask"
  vKEXTShaderStencilExport* = 1
  vkExtShaderStencilExportSpecVersion* = 1
  vkExtShaderStencilExportExtensionName* = "VK_EXT_shader_stencil_export"
  vKEXTSampleLocations* = 1
  vkExtSampleLocationsSpecVersion* = 1
  vkExtSampleLocationsExtensionName* = "VK_EXT_sample_locations"

type
  VkSampleLocationEXT* = object
    x*: cfloat
    y*: cfloat

  VkSampleLocationsInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    sampleLocationsPerPixel*: VkSampleCountFlagBits
    sampleLocationGridSize*: VkExtent2D
    sampleLocationsCount*: uint32
    pSampleLocations*: ptr VkSampleLocationEXT

  VkAttachmentSampleLocationsEXT* = object
    attachmentIndex*: uint32
    sampleLocationsInfo*: VkSampleLocationsInfoEXT

  VkSubpassSampleLocationsEXT* = object
    subpassIndex*: uint32
    sampleLocationsInfo*: VkSampleLocationsInfoEXT

  VkRenderPassSampleLocationsBeginInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    attachmentInitialSampleLocationsCount*: uint32
    pAttachmentInitialSampleLocations*: ptr VkAttachmentSampleLocationsEXT
    postSubpassSampleLocationsCount*: uint32
    pSubpassSampleLocations*: ptr VkSubpassSampleLocationsEXT

  VkPipelineSampleLocationsStateCreateInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    sampleLocationsEnable*: VkBool32
    sampleLocationsInfo*: VkSampleLocationsInfoEXT

  VkPhysicalDeviceSampleLocationsPropertiesEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    sampleLocationSampleCounts*: VkSampleCountFlags
    maxSampleLocationGridSize*: VkExtent2D
    sampleLocationCoordinateRange*: array[2, cfloat]
    sampleLocationSubPixelBits*: uint32
    variableSampleLocations*: VkBool32

  VkMultisamplePropertiesEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    maxSampleLocationGridSize*: VkExtent2D

  PFN_vkCmdSetSampleLocationsEXT* = proc (commandBuffer: VkCommandBuffer; pSampleLocationsInfo: ptr VkSampleLocationsInfoEXT) {.cdecl.}
  PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT* = proc (physicalDevice: VkPhysicalDevice; samples: VkSampleCountFlagBits; pMultisampleProperties: ptr VkMultisamplePropertiesEXT) {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCmdSetSampleLocationsEXT*(commandBuffer: VkCommandBuffer; pSampleLocationsInfo: ptr VkSampleLocationsInfoEXT) {.cdecl, importc.}
  proc vkGetPhysicalDeviceMultisamplePropertiesEXT*(physicalDevice: VkPhysicalDevice; samples: VkSampleCountFlagBits; pMultisampleProperties: ptr VkMultisamplePropertiesEXT) {.cdecl, importc.}

const
  vKEXTBlendOperationAdvanced* = 1
  vkExtBlendOperationAdvancedSpecVersion* = 2
  vkExtBlendOperationAdvancedExtensionName* = "VK_EXT_blend_operation_advanced"

type
  VkBlendOverlapEXT* {.pure, size: sizeof(cint).} = enum
    uncorrelated = 0,
    disjoint = 1,
    conjoint = 2,

  VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    advancedBlendCoherentOperations*: VkBool32

  VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    advancedBlendMaxColorAttachments*: uint32
    advancedBlendIndependentBlend*: VkBool32
    advancedBlendNonPremultipliedSrcColor*: VkBool32
    advancedBlendNonPremultipliedDstColor*: VkBool32
    advancedBlendCorrelatedOverlap*: VkBool32
    advancedBlendAllOperations*: VkBool32

  VkPipelineColorBlendAdvancedStateCreateInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    srcPremultiplied*: VkBool32
    dstPremultiplied*: VkBool32
    blendOverlap*: VkBlendOverlapEXT

const
  vKNVFragmentCoverageToColor* = 1
  vkNvFragmentCoverageToColorSpecVersion* = 1
  vkNvFragmentCoverageToColorExtensionName* = "VK_NV_fragment_coverage_to_color"

type
  VkPipelineCoverageToColorStateCreateFlagsNV* = VkFlags
  VkPipelineCoverageToColorStateCreateInfoNV* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCoverageToColorStateCreateFlagsNV
    coverageToColorEnable*: VkBool32
    coverageToColorLocation*: uint32

const
  vKNVFramebufferMixedSamples* = 1
  vkNvFramebufferMixedSamplesSpecVersion* = 1
  vkNvFramebufferMixedSamplesExtensionName* = "VK_NV_framebuffer_mixed_samples"

type
  VkCoverageModulationModeNV* {.pure, size: sizeof(cint).} = enum
    none = 0,
    rgb = 1,
    alpha = 2,
    rgba = 3,

  VkPipelineCoverageModulationStateCreateFlagsNV* = VkFlags

  VkPipelineCoverageModulationStateCreateInfoNV* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCoverageModulationStateCreateFlagsNV
    coverageModulationMode*: VkCoverageModulationModeNV
    coverageModulationTableEnable*: VkBool32
    coverageModulationTableCount*: uint32
    pCoverageModulationTable*: ptr cfloat

const
  vKNVFillRectangle* = 1
  vkNvFillRectangleSpecVersion* = 1
  vkNvFillRectangleExtensionName* = "VK_NV_fill_rectangle"
  vKEXTPostDepthCoverage* = 1
  vkExtPostDepthCoverageSpecVersion* = 1
  vkExtPostDepthCoverageExtensionName* = "VK_EXT_post_depth_coverage"
  vKEXTValidationCache* = 1

type
    VkValidationCacheEXT* = VkNonDispatchableHandle

const
  vkExtValidationCacheSpecVersion* = 1
  vkExtValidationCacheExtensionName* = "VK_EXT_validation_cache"

type
  VkValidationCacheHeaderVersionEXT* {.pure, size: sizeof(cint).} = enum
    one = 1,

  VkValidationCacheCreateFlagsEXT* = VkFlags

  VkValidationCacheCreateInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkValidationCacheCreateFlagsEXT
    initialDataSize*: csize
    pInitialData*: pointer

  VkShaderModuleValidationCacheCreateInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    validationCache*: VkValidationCacheEXT

  PFN_vkCreateValidationCacheEXT* = proc (device: VkDevice; pCreateInfo: ptr VkValidationCacheCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pValidationCache: ptr VkValidationCacheEXT): VkResult {.cdecl.}
  PFN_vkDestroyValidationCacheEXT* = proc (device: VkDevice; validationCache: VkValidationCacheEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl.}
  PFN_vkMergeValidationCachesEXT* = proc (device: VkDevice; dstCache: VkValidationCacheEXT; srcCacheCount: uint32; pSrcCaches: ptr VkValidationCacheEXT): VkResult {.cdecl.}
  PFN_vkGetValidationCacheDataEXT* = proc (device: VkDevice; validationCache: VkValidationCacheEXT; pDataSize: ptr csize; pData: pointer): VkResult {.cdecl.}

when not defined(VK_NO_PROTOTYPES):
  proc vkCreateValidationCacheEXT*(device: VkDevice; pCreateInfo: ptr VkValidationCacheCreateInfoEXT; pAllocator: ptr VkAllocationCallbacks; pValidationCache: ptr VkValidationCacheEXT): VkResult {.cdecl, importc.}
  proc vkDestroyValidationCacheEXT*(device: VkDevice; validationCache: VkValidationCacheEXT; pAllocator: ptr VkAllocationCallbacks) {.cdecl, importc.}
  proc vkMergeValidationCachesEXT*(device: VkDevice; dstCache: VkValidationCacheEXT; srcCacheCount: uint32; pSrcCaches: ptr VkValidationCacheEXT): VkResult {.cdecl, importc.}
  proc vkGetValidationCacheDataEXT*(device: VkDevice; validationCache: VkValidationCacheEXT; pDataSize: ptr csize; pData: pointer): VkResult {.cdecl, importc.}

const
  vKEXTShaderViewportIndexLayer* = 1
  vkExtShaderViewportIndexLayerSpecVersion* = 1
  vkExtShaderViewportIndexLayerExtensionName* = "VK_EXT_shader_viewport_index_layer"
