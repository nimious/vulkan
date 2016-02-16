## *io-vulkan* - Nim bindings for Vulkan, the API for access to graphics and
## compute on GPUs.
##
## This file is part of the `Nim I/O <http://nimio.us>`_ package collection.
## See the file LICENSE included in this distribution for licensing details.
## GitHub pull requests are encouraged. (c) 2015 Headcrash Industries LLC.

{.deadCodeElim: on.}


when not (defined(android) or defined(linux) or defined(windows)):
  {.error: "vulkan does not support this platform".}


const
  vkVersion10* = 1

template vkMakeVersion*(major, minor, patch: expr): expr =
  ((major shl 22) or (minor shl 12) or patch)

const
  vkApiVersion* = vkMakeVersion(1, 0, 3)
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
  vkSubpassExternal* = (not 0)
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
    errorValidationFailedExt = - 1000011001,
    errorIncompatibleDisplayKhr = - 1000003001,
    errorOutOfDateKhr = - 1000001004,
    errorNativeWindowInUseKhr = - 1000000001,
    errorSurfaceLostKhr = - 1000000000,
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
    debugReportCreateInfoExt = 1000011000,

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
    astc4x4UnormBlock = 157,
    astc4x4SrgbBlock = 158,
    astc5x4UnormBlock = 159,
    astc5x4SrgbBlock = 160,
    astc5x5UnormBlock = 161,
    astc5x5SrgbBlock = 162,
    astc6x5UnormBlock = 163,
    astc6x5SrgbBlock = 164,
    astc6x6UnormBlock = 165,
    astc6x6SrgbBlock = 166,
    astc8x5UnormBlock = 167,
    astc8x5SrgbBlock = 168,
    astc8x6UnormBlock = 169,
    astc8x6SrgbBlock = 170,
    astc8x8UnormBlock = 171,
    astc8x8SrgbBlock = 172,
    astc10x5UnormBlock = 173,
    astc10x5SrgbBlock = 174,
    astc10x6UnormBlock = 175,
    astc10x6SrgbBlock = 176,
    astc10x8UnormBlock = 177,
    astc10x8SrgbBlock = 178,
    astc10x10UnormBlock = 179,
    astc10x10SrgbBlock = 180,
    astc12x10UnormBlock = 181,
    astc12x10SrgbBlock = 182,
    astc12x12UnormBlock = 183,
    astc12x12SrgbBlock = 184,

  VkImageType* {.pure, size: sizeof(cint).} = enum
    image1d = 0,
    image2d = 1,
    image3d = 2,

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

  VkImageViewType* {.pure, size: sizeof(cint).} = enum
    view1d = 0,
    view2d = 1,
    view3d = 2,
    viewCube = 3,
    view1dArray = 4,
    view2dArray = 5,
    viewCubeArray = 6,

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

  VkFilter* {.pure, size: sizeof(cint).} = enum
    nearest = 0,
    linear = 1,

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
    load = 0,
    clear = 1,
    dontCare = 2,

  VkAttachmentStoreOp* {.pure, size: sizeof(cint).} = enum
    store = 0,
    dontCare = 1,

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

  VkInstanceCreateFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkFormatFeatureFlagBits* {.pure, size: sizeof(cint).} = enum
    sampledImageBit = 0x00000001,
    storageImageBit = 0x00000002,
    storageImageAtomicBit = 0x00000004,
    uniformTexelBufferBit = 0x00000008,
    storageTexelBufferBit = 0x00000010,
    storageTexelBufferAtomicBit = 0x00000020,
    vertexBufferBit = 0x00000040,
    colorAttachmentBit = 0x00000080,
    colorAttachmentBlendBit = 0x00000100,
    depthStencilAttachmentBit = 0x00000200,
    blitSrcBit = 0x00000400,
    blitDstBit = 0x00000800,
    sampledImageFilterLinear = 0x00001000

  VkFormatFeatureFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkImageUsageFlagBits* {.pure, size: sizeof(cint).} = enum
    transferSrcBit = 0x00000001,
    transferDstBit = 0x00000002,
    sampledBit = 0x00000004,
    storageBit = 0x00000008,
    colorAttachmentBit = 0x00000010,
    depthStencilAttachmentBit = 0x00000020,
    transientAttachmentBit = 0x00000040,
    inputAttachmentBit = 0x00000080

  VkImageUsageFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkImageCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    sparseBindingBit = 0x00000001,
    sparseResidencyBit = 0x00000002,
    sparseAliasedBit = 0x00000004,
    mutableFormatBit = 0x00000008,
    cubeCompatibleBit = 0x00000010

  VkImageCreateFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkSampleCountFlagBits* {.pure, size: sizeof(cint).} = enum
    oneBit = 0x00000001,
    twoBit = 0x00000002,
    fourBit = 0x00000004,
    eightBit = 0x00000008,
    sixteenBit = 0x00000010,
    thirtytwoBit = 0x00000020,
    sixtyfourBit = 0x00000040

  VkSampleCountFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkQueueFlagBits* {.pure, size: sizeof(cint).} = enum
    graphicsBit = 0x00000001,
    computeBit = 0x00000002,
    transferBit = 0x00000004,
    sparseBindingBit = 0x00000008

  VkQueueFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkMemoryPropertyFlagBits* {.pure, size: sizeof(cint).} = enum
    deviceLocalBit = 0x00000001,
    hostVisibleBit = 0x00000002,
    hostCoherentBit = 0x00000004,
    hostCachedBit = 0x00000008,
    lazilyAllocatedBit = 0x00000010

  VkMemoryPropertyFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkMemoryHeapFlagBits* {.pure, size: sizeof(cint).} = enum
    deviceLocalBit = 0x00000001

  VkMemoryHeapFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkDeviceCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkDeviceQueueCreateFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkPipelineStageFlagBits* {.pure, size: sizeof(cint).} = enum
    topOfPipeBit = 0x00000001,
    drawIndirectBit = 0x00000002,
    vertexInputBit = 0x00000004,
    vertexShaderBit = 0x00000008,
    tessellationControlShaderBit = 0x00000010,
    tessellationEvaluationShaderBit = 0x00000020,
    geometryShaderBit = 0x00000040,
    fragmentShaderBit = 0x00000080,
    earlyFragmentTestsBit = 0x00000100,
    lateFragmentTestsBit = 0x00000200,
    colorAttachmentOutputBit = 0x00000400,
    computeShaderBit = 0x00000800,
    transferBit = 0x00001000,
    bottomOfPipeBit = 0x00002000,
    hostBit = 0x00004000,
    allGraphicsBit = 0x00008000,
    allCommandsBit = 0x00010000

  VkPipelineStageFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkMemoryMapFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkImageAspectFlagBits* {.pure, size: sizeof(cint).} = enum
    colorBit = 0x00000001,
    depthBit = 0x00000002,
    stencilBit = 0x00000004,
    metadataBit = 0x00000008

  VkImageAspectFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkSparseImageFormatFlagBits* {.pure, size: sizeof(cint).} = enum
    singleMiptailBit = 0x00000001,
    alignedMipSizeBit = 0x00000002,
    nonstandardBlockSizeBit = 0x00000004

  VkSparseImageFormatFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkSparseMemoryBindFlagBits* {.pure, size: sizeof(cint).} = enum
    metadataBit = 0x00000001

  VkSparseMemoryBindFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkFenceCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    signaledBit = 0x00000001

  VkFenceCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkSemaphoreCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkEventCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkQueryPoolCreateFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkQueryPipelineStatisticFlagBits* {.pure, size: sizeof(cint).} = enum
    inputAssemblyVerticesBit = 0x00000001,
    inputAssemblyPrimitivesBit = 0x00000002,
    vertexShaderInvocationsBit = 0x00000004,
    geometryShaderInvocationsBit = 0x00000008,
    geometryShaderPrimitivesBit = 0x00000010,
    clippingInvocationsBit = 0x00000020,
    clippingPrimitivesBit = 0x00000040,
    fragmentShaderInvocationsBit = 0x00000080,
    tessellationControlShaderPatchesBit = 0x00000100,
    tessellationEvaluationShaderInvocationsBit = 0x00000200,
    computeShaderInvocationsBit = 0x00000400

  VkQueryPipelineStatisticFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkQueryResultFlagBits* {.pure, size: sizeof(cint).} = enum
    sixtyfourBit = 0x00000001,
    waitBit = 0x00000002,
    withAvailabilityBit = 0x00000004,
    partialBit = 0x00000008

  VkQueryResultFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkBufferCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    bindingBit = 0x00000001,
    residencyBit = 0x00000002,
    aliasedBit = 0x00000004

  VkBufferCreateFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkBufferUsageFlagBits* {.pure, size: sizeof(cint).} = enum
    transferSrcBit = 0x00000001,
    transferDstBit = 0x00000002,
    uniformTexelBufferBit = 0x00000004,
    storageTexelBufferBit = 0x00000008,
    uniformBufferBit = 0x00000010,
    storageBufferBit = 0x00000020,
    indexBufferBit = 0x00000040,
    vertexBufferBit = 0x00000080,
    indirectBufferBit = 0x00000100

  VkBufferUsageFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkBufferViewCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkImageViewCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkShaderModuleCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkPipelineCacheCreateFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkPipelineCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    disableOptimizationBit = 0x00000001,
    allowDerivativesBit = 0x00000002,
    derivativeBit = 0x00000004

  VkPipelineCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkPipelineShaderStageCreateFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkShaderStageFlagBits* {.pure, size: sizeof(cint).} = enum
    vertexBit = 0x00000001,
    tessellationControlBit = 0x00000002,
    tessellationEvaluationBit = 0x00000004,
    geometryBit = 0x00000008,
    fragmentBit = 0x00000010,
    allGraphics = 0x0000001F,
    computeBit = 0x00000020,
    all = 0x7FFFFFFF

  VkPipelineVertexInputStateCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkPipelineInputAssemblyStateCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkPipelineTessellationStateCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkPipelineViewportStateCreateFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkPipelineRasterizationStateCreateFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkCullModeFlagBits* {.pure, size: sizeof(cint).} = enum
    none = 0,
    frontBit = 0x00000001,
    backBit = 0x00000002,
    frontAndBack = 0x00000003

  VkCullModeFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkPipelineMultisampleStateCreateFlags* {.pure, size: sizeof(cint).}= VkFlags
  VkPipelineDepthStencilStateCreateFlags* {.pure, size: sizeof(cint).}= VkFlags
  VkPipelineColorBlendStateCreateFlags* {.pure, size: sizeof(cint).}= VkFlags

  VkColorComponentFlagBits* {.pure, size: sizeof(cint).}= enum
    rBit = 0x00000001,
    gBit = 0x00000002,
    bBit = 0x00000004,
    aBit = 0x00000008

  VkColorComponentFlags* {.pure, size: sizeof(cint).}= VkFlags
  VkPipelineDynamicStateCreateFlags* {.pure, size: sizeof(cint).}= VkFlags
  VkPipelineLayoutCreateFlags* {.pure, size: sizeof(cint).}= VkFlags
  VkShaderStageFlags* {.pure, size: sizeof(cint).}= VkFlags
  VkSamplerCreateFlags* {.pure, size: sizeof(cint).}= VkFlags
  VkDescriptorSetLayoutCreateFlags* {.pure, size: sizeof(cint).}= VkFlags

  VkDescriptorPoolCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    freeDescriptorSetBit = 0x00000001

  VkDescriptorPoolCreateFlags* = VkFlags
  VkDescriptorPoolResetFlags* = VkFlags
  VkFramebufferCreateFlags* = VkFlags
  VkRenderPassCreateFlags* = VkFlags

  VkAttachmentDescriptionFlagBits* {.pure, size: sizeof(cint).} = enum
    mayAliasBit = 0x00000001

  VkAttachmentDescriptionFlags* {.pure, size: sizeof(cint).} = VkFlags
  VkSubpassDescriptionFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkAccessFlagBits* {.pure, size: sizeof(cint).} = enum
    indirectCommandReadBit = 0x00000001,
    indexReadBit = 0x00000002,
    vertexAttributeReadBit = 0x00000004,
    uniformReadBit = 0x00000008,
    inputAttachmentReadBit = 0x00000010,
    shaderReadBit = 0x00000020,
    shaderWriteBit = 0x00000040,
    colorAttachmentReadBit = 0x00000080,
    colorAttachmentWriteBit = 0x00000100,
    depthStencilAttachmentReadBit = 0x00000200,
    depthStencilAttachmentWriteBit = 0x00000400,
    transferReadBit = 0x00000800,
    transferWriteBit = 0x00001000,
    hostReadBit = 0x00002000,
    hostWriteBit = 0x00004000,
    memoryReadBit = 0x00008000,
    memoryWriteBit = 0x00010000

  VkAccessFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkDependencyFlagBits* {.pure, size: sizeof(cint).} = enum
    byRegionBit = 0x00000001

  VkDependencyFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkCommandPoolCreateFlagBits* {.pure, size: sizeof(cint).} = enum
    transientBit = 0x00000001,
    resetCommandBufferBit = 0x00000002

  VkCommandPoolCreateFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkCommandPoolResetFlagBits* {.pure, size: sizeof(cint).} = enum
    releaseResourcesBit = 0x00000001

  VkCommandPoolResetFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkCommandBufferUsageFlagBits* {.pure, size: sizeof(cint).} = enum
    oneTimeSubmitBit = 0x00000001,
    renderPassContinueBit = 0x00000002,
    simultaneousUseBit = 0x00000004

  VkCommandBufferUsageFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkQueryControlFlagBits* {.pure, size: sizeof(cint).} = enum
    preciseBit = 0x00000001

  VkQueryControlFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkCommandBufferResetFlagBits* {.pure, size: sizeof(cint).} = enum
    releaseResourcesBit = 0x00000001

  VkCommandBufferResetFlags* {.pure, size: sizeof(cint).} = VkFlags

  VkStencilFaceFlagBits* {.pure, size: sizeof(cint).} = enum
    faceFrontBit = 0x00000001,
    faceBackBit = 0x00000002,
    frontAndBack = 0x00000003

  VkStencilFaceFlags* {.pure, size: sizeof(cint).} = VkFlags

type
  PFN_vkAllocationFunction* = proc (pUserData: pointer; size: csize;
    alignment: csize; allocationScope: VkSystemAllocationScope): pointer

  PFN_vkReallocationFunction* = proc (pUserData: pointer; pOriginal: pointer;
    size: csize; alignment: csize; allocationScope: VkSystemAllocationScope):
    pointer

  PFN_vkFreeFunction* = proc (pUserData: pointer; pMemory: pointer)

  PFN_vkInternalAllocationNotification* = proc (pUserData: pointer; size: csize;
      allocationType: VkInternalAllocationType;
      allocationScope: VkSystemAllocationScope)

  PFN_vkInternalFreeNotification* = proc (pUserData: pointer; size: csize;
      allocationType: VkInternalAllocationType;
      allocationScope: VkSystemAllocationScope)

  PFN_vkVoidFunction* = proc ()

type
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
    minTexelOffset*: int32
    maxTexelOffset*: uint32
    minTexelGatherOffset*: int32
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
    pipelineCacheUUID*: array[vkUuidSize, uint8]
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
    x*: int32
    y*: int32
    z*: int32

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
    x*: int32
    y*: int32

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
    basePipelineIndex*: int32

  VkComputePipelineCreateInfo* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkPipelineCreateFlags
    stage*: VkPipelineShaderStageCreateInfo
    layout*: VkPipelineLayout
    basePipelineHandle*: VkPipeline
    basePipelineIndex*: int32

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
    `type`*: VkDescriptorType
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

  VkClearColorValue* = object {.union.}
    float32*: array[4, cfloat]
    int32*: array[4, int32]
    uint32*: array[4, uint32]

  VkClearDepthStencilValue* = object
    depth*: cfloat
    stencil*: uint32

  VkClearValue* = object {.union.}
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
    vertexOffset*: int32
    firstInstance*: uint32

  VkDrawIndirectCommand* = object
    vertexCount*: uint32
    instanceCount*: uint32
    firstVertex*: uint32
    firstInstance*: uint32

type
  PFN_vkCreateInstance* = proc (pCreateInfo: ptr VkInstanceCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pInstance: ptr VkInstance): VkResult

  PFN_vkDestroyInstance* = proc (instance: VkInstance;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkEnumeratePhysicalDevices* = proc (instance: VkInstance;
    pPhysicalDeviceCount: ptr uint32; pPhysicalDevices: ptr VkPhysicalDevice):
    VkResult

  PFN_vkGetPhysicalDeviceFeatures* = proc (physicalDevice: VkPhysicalDevice;
    pFeatures: ptr VkPhysicalDeviceFeatures)

  PFN_vkGetPhysicalDeviceFormatProperties* = proc (
    physicalDevice: VkPhysicalDevice; format: VkFormat;
    pFormatProperties: ptr VkFormatProperties)

  PFN_vkGetPhysicalDeviceImageFormatProperties* = proc (
    physicalDevice: VkPhysicalDevice; format: VkFormat; imgType: VkImageType;
    tiling: VkImageTiling; usage: VkImageUsageFlags; flags: VkImageCreateFlags;
    pImageFormatProperties: ptr VkImageFormatProperties): VkResult

  PFN_vkGetPhysicalDeviceProperties* = proc (physicalDevice: VkPhysicalDevice;
    pProperties: ptr VkPhysicalDeviceProperties)

  PFN_vkGetPhysicalDeviceQueueFamilyProperties* = proc (
    physicalDevice: VkPhysicalDevice; pQueueFamilyPropertyCount: ptr uint32;
    pQueueFamilyProperties: ptr VkQueueFamilyProperties)

  PFN_vkGetPhysicalDeviceMemoryProperties* = proc (
    physicalDevice: VkPhysicalDevice;
    pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties)

  PFN_vkGetInstanceProcAddr* = proc (instance: VkInstance; pName: cstring):
    PFN_vkVoidFunction

  PFN_vkGetDeviceProcAddr* = proc (device: VkDevice; pName: cstring):
    PFN_vkVoidFunction

  PFN_vkCreateDevice* = proc (physicalDevice: VkPhysicalDevice;
    pCreateInfo: ptr VkDeviceCreateInfo; pAllocator: ptr VkAllocationCallbacks;
    pDevice: ptr VkDevice): VkResult

  PFN_vkDestroyDevice* = proc (device: VkDevice;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkEnumerateInstanceExtensionProperties* = proc (pLayerName: cstring;
    pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties):
    VkResult

  PFN_vkEnumerateDeviceExtensionProperties* = proc (
    physicalDevice: VkPhysicalDevice; pLayerName: cstring;
    pPropertyCount: ptr uint32; pProperties: ptr VkExtensionProperties):
    VkResult

  PFN_vkEnumerateInstanceLayerProperties* = proc (pPropertyCount: ptr uint32;
    pProperties: ptr VkLayerProperties): VkResult

  PFN_vkEnumerateDeviceLayerProperties* = proc (physicalDevice: VkPhysicalDevice;
    pPropertyCount: ptr uint32; pProperties: ptr VkLayerProperties): VkResult

  PFN_vkGetDeviceQueue* = proc (device: VkDevice; queueFamilyIndex: uint32;
    queueIndex: uint32; pQueue: ptr VkQueue)

  PFN_vkQueueSubmit* = proc (queue: VkQueue; submitCount: uint32;
    pSubmits: ptr VkSubmitInfo; fence: VkFence): VkResult

  PFN_vkQueueWaitIdle* = proc (queue: VkQueue): VkResult
  PFN_vkDeviceWaitIdle* = proc (device: VkDevice): VkResult

  PFN_vkAllocateMemory* = proc (device: VkDevice;
    pAllocateInfo: ptr VkMemoryAllocateInfo;
    pAllocator: ptr VkAllocationCallbacks;
    pMemory: ptr VkDeviceMemory): VkResult

  PFN_vkFreeMemory* = proc (device: VkDevice; memory: VkDeviceMemory;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkMapMemory* = proc (device: VkDevice; memory: VkDeviceMemory;
    offset: VkDeviceSize; size: VkDeviceSize; flags: VkMemoryMapFlags;
    ppData: ptr pointer): VkResult

  PFN_vkUnmapMemory* = proc (device: VkDevice; memory: VkDeviceMemory)

  PFN_vkFlushMappedMemoryRanges* = proc (device: VkDevice;
    memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult

  PFN_vkInvalidateMappedMemoryRanges* = proc (device: VkDevice;
    memoryRangeCount: uint32; pMemoryRanges: ptr VkMappedMemoryRange): VkResult

  PFN_vkGetDeviceMemoryCommitment* = proc (device: VkDevice; memory: VkDeviceMemory;
    pCommittedMemoryInBytes: ptr VkDeviceSize)

  PFN_vkBindBufferMemory* = proc (device: VkDevice; buffer: VkBuffer;
    memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult

  PFN_vkBindImageMemory* = proc (device: VkDevice; image: VkImage;
    memory: VkDeviceMemory; memoryOffset: VkDeviceSize): VkResult

  PFN_vkGetBufferMemoryRequirements* = proc (device: VkDevice; buffer: VkBuffer;
    pMemoryRequirements: ptr VkMemoryRequirements)

  PFN_vkGetImageMemoryRequirements* = proc (device: VkDevice; image: VkImage;
    pMemoryRequirements: ptr VkMemoryRequirements)

  PFN_vkGetImageSparseMemoryRequirements* = proc (device: VkDevice; image: VkImage;
    pSparseMemoryRequirementCount: ptr uint32;
    pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements)

  PFN_vkGetPhysicalDeviceSparseImageFormatProperties* = proc (
    physicalDevice: VkPhysicalDevice; format: VkFormat; `type`: VkImageType;
    samples: VkSampleCountFlagBits; usage: VkImageUsageFlags;
    tiling: VkImageTiling; pPropertyCount: ptr uint32;
    pProperties: ptr VkSparseImageFormatProperties)

  PFN_vkQueueBindSparse* = proc (queue: VkQueue; bindInfoCount: uint32;
    pBindInfo: ptr VkBindSparseInfo; fence: VkFence): VkResult

  PFN_vkCreateFence* = proc (device: VkDevice; pCreateInfo: ptr VkFenceCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pFence: ptr VkFence): VkResult

  PFN_vkDestroyFence* = proc (device: VkDevice; fence: VkFence;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkResetFences* = proc (device: VkDevice; fenceCount: uint32;
    pFences: ptr VkFence): VkResult

  PFN_vkGetFenceStatus* = proc (device: VkDevice; fence: VkFence): VkResult

  PFN_vkWaitForFences* = proc (device: VkDevice; fenceCount: uint32;
    pFences: ptr VkFence; waitAll: VkBool32; timeout: uint64): VkResult

  PFN_vkCreateSemaphore* = proc (device: VkDevice;
    pCreateInfo: ptr VkSemaphoreCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pSemaphore: ptr VkSemaphore):
    VkResult

  PFN_vkDestroySemaphore* = proc (device: VkDevice; semaphore: VkSemaphore;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreateEvent* = proc (device: VkDevice;
    pCreateInfo: ptr VkEventCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pEvent: ptr VkEvent): VkResult

  PFN_vkDestroyEvent* = proc (device: VkDevice; event: VkEvent;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkGetEventStatus* = proc (device: VkDevice; event: VkEvent): VkResult
  PFN_vkSetEvent* = proc (device: VkDevice; event: VkEvent): VkResult
  PFN_vkResetEvent* = proc (device: VkDevice; event: VkEvent): VkResult

  PFN_vkCreateQueryPool* = proc (device: VkDevice;
    pCreateInfo: ptr VkQueryPoolCreateInfo;
    pAllocator: ptr VkAllocationCallbacks;
    pQueryPool: ptr VkQueryPool): VkResult

  PFN_vkDestroyQueryPool* = proc (device: VkDevice; queryPool: VkQueryPool;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkGetQueryPoolResults* = proc (device: VkDevice; queryPool: VkQueryPool;
    firstQuery: uint32; queryCount: uint32; dataSize: csize; pData: pointer;
    stride: VkDeviceSize; flags: VkQueryResultFlags): VkResult

  PFN_vkCreateBuffer* = proc (device: VkDevice;
    pCreateInfo: ptr VkBufferCreateInfo; pAllocator: ptr VkAllocationCallbacks;
    pBuffer: ptr VkBuffer): VkResult

  PFN_vkDestroyBuffer* = proc (device: VkDevice; buffer: VkBuffer;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreateBufferView* = proc (device: VkDevice;
    pCreateInfo: ptr VkBufferViewCreateInfo;
    pAllocator: ptr VkAllocationCallbacks;
    pView: ptr VkBufferView): VkResult

  PFN_vkDestroyBufferView* = proc (device: VkDevice; bufferView: VkBufferView;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreateImage* = proc (device: VkDevice;
    pCreateInfo: ptr VkImageCreateInfo; pAllocator: ptr VkAllocationCallbacks;
    pImage: ptr VkImage): VkResult

  PFN_vkDestroyImage* = proc (device: VkDevice; image: VkImage;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkGetImageSubresourceLayout* = proc (device: VkDevice; image: VkImage;
    pSubresource: ptr VkImageSubresource; pLayout: ptr VkSubresourceLayout)

  PFN_vkCreateImageView* = proc (device: VkDevice;
    pCreateInfo: ptr VkImageViewCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pView: ptr VkImageView): VkResult

  PFN_vkDestroyImageView* = proc (device: VkDevice; imageView: VkImageView;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreateShaderModule* = proc (device: VkDevice;
    pCreateInfo: ptr VkShaderModuleCreateInfo;
    pAllocator: ptr VkAllocationCallbacks;
    pShaderModule: ptr VkShaderModule): VkResult

  PFN_vkDestroyShaderModule* = proc (device: VkDevice;
    shaderModule: VkShaderModule; pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreatePipelineCache* = proc (device: VkDevice;
    pCreateInfo: ptr VkPipelineCacheCreateInfo;
    pAllocator: ptr VkAllocationCallbacks;
    pPipelineCache: ptr VkPipelineCache): VkResult

  PFN_vkDestroyPipelineCache* = proc (device: VkDevice;
    pipelineCache: VkPipelineCache; pAllocator: ptr VkAllocationCallbacks)

  PFN_vkGetPipelineCacheData* = proc (device: VkDevice;
    pipelineCache: VkPipelineCache; pDataSize: ptr csize; pData: pointer):
    VkResult

  PFN_vkMergePipelineCaches* = proc (device: VkDevice;
   dstCache: VkPipelineCache; srcCacheCount: uint32;
   pSrcCaches: ptr VkPipelineCache): VkResult

  PFN_vkCreateGraphicsPipelines* = proc (device: VkDevice;
    pipelineCache: VkPipelineCache; createInfoCount: uint32;
    pCreateInfos: ptr VkGraphicsPipelineCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult

  PFN_vkCreateComputePipelines* = proc (device: VkDevice;
    pipelineCache: VkPipelineCache; createInfoCount: uint32;
    pCreateInfos: ptr VkComputePipelineCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pPipelines: ptr VkPipeline): VkResult

  PFN_vkDestroyPipeline* = proc (device: VkDevice; pipeline: VkPipeline;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreatePipelineLayout* = proc (device: VkDevice;
    pCreateInfo: ptr VkPipelineLayoutCreateInfo;
    pAllocator: ptr VkAllocationCallbacks;
    pPipelineLayout: ptr VkPipelineLayout): VkResult

  PFN_vkDestroyPipelineLayout* = proc (device: VkDevice;
    pipelineLayout: VkPipelineLayout; pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreateSampler* = proc (device: VkDevice;
    pCreateInfo: ptr VkSamplerCreateInfo; pAllocator: ptr VkAllocationCallbacks;
    pSampler: ptr VkSampler): VkResult

  PFN_vkDestroySampler* = proc (device: VkDevice; sampler: VkSampler;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreateDescriptorSetLayout* = proc (device: VkDevice;
    pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo;
    pAllocator: ptr VkAllocationCallbacks;
    pSetLayout: ptr VkDescriptorSetLayout): VkResult

  PFN_vkDestroyDescriptorSetLayout* = proc (device: VkDevice;
    descriptorSetLayout: VkDescriptorSetLayout;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreateDescriptorPool* = proc (device: VkDevice;
    pCreateInfo: ptr VkDescriptorPoolCreateInfo;
    pAllocator: ptr VkAllocationCallbacks;
    pDescriptorPool: ptr VkDescriptorPool): VkResult

  PFN_vkDestroyDescriptorPool* = proc (device: VkDevice;
    descriptorPool: VkDescriptorPool; pAllocator: ptr VkAllocationCallbacks)

  PFN_vkResetDescriptorPool* = proc (device: VkDevice;
    descriptorPool: VkDescriptorPool; flags: VkDescriptorPoolResetFlags):
    VkResult

  PFN_vkAllocateDescriptorSets* = proc (device: VkDevice;
    pAllocateInfo: ptr VkDescriptorSetAllocateInfo;
    pDescriptorSets: ptr VkDescriptorSet): VkResult

  PFN_vkFreeDescriptorSets* = proc (device: VkDevice;
    descriptorPool: VkDescriptorPool; descriptorSetCount: uint32;
    pDescriptorSets: ptr VkDescriptorSet): VkResult

  PFN_vkUpdateDescriptorSets* = proc (device: VkDevice;
    descriptorWriteCount: uint32; pDescriptorWrites: ptr VkWriteDescriptorSet;
    descriptorCopyCount: uint32; pDescriptorCopies: ptr VkCopyDescriptorSet)

  PFN_vkCreateFramebuffer* = proc (device: VkDevice;
    pCreateInfo: ptr VkFramebufferCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pFramebuffer: ptr VkFramebuffer):
    VkResult

  PFN_vkDestroyFramebuffer* = proc (device: VkDevice;
    framebuffer: VkFramebuffer; pAllocator: ptr VkAllocationCallbacks)

  PFN_vkCreateRenderPass* = proc (device: VkDevice;
    pCreateInfo: ptr VkRenderPassCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pRenderPass: ptr VkRenderPass):
    VkResult

  PFN_vkDestroyRenderPass* = proc (device: VkDevice; renderPass: VkRenderPass;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkGetRenderAreaGranularity* = proc (device: VkDevice;
    renderPass: VkRenderPass; pGranularity: ptr VkExtent2D)

  PFN_vkCreateCommandPool* = proc (device: VkDevice;
    pCreateInfo: ptr VkCommandPoolCreateInfo;
    pAllocator: ptr VkAllocationCallbacks; pCommandPool: ptr VkCommandPool):
    VkResult

  PFN_vkDestroyCommandPool* = proc (device: VkDevice;
    commandPool: VkCommandPool; pAllocator: ptr VkAllocationCallbacks)

  PFN_vkResetCommandPool* = proc (device: VkDevice; commandPool: VkCommandPool;
    flags: VkCommandPoolResetFlags): VkResult

  PFN_vkAllocateCommandBuffers* = proc (device: VkDevice;
    pAllocateInfo: ptr VkCommandBufferAllocateInfo;
    pCommandBuffers: ptr VkCommandBuffer): VkResult

  PFN_vkFreeCommandBuffers* = proc (device: VkDevice;
    commandPool: VkCommandPool; ommandBufferCount: uint32;
    pCommandBuffers: ptr VkCommandBuffer)

  PFN_vkBeginCommandBuffer* = proc (commandBuffer: VkCommandBuffer;
    pBeginInfo: ptr VkCommandBufferBeginInfo): VkResult

  PFN_vkEndCommandBuffer* = proc (commandBuffer: VkCommandBuffer): VkResult

  PFN_vkResetCommandBuffer* = proc (commandBuffer: VkCommandBuffer;
    flags: VkCommandBufferResetFlags): VkResult

  PFN_vkCmdBindPipeline* = proc (commandBuffer: VkCommandBuffer;
    pipelineBindPoint: VkPipelineBindPoint; pipeline: VkPipeline)

  PFN_vkCmdSetViewport* = proc (commandBuffer: VkCommandBuffer;
    firstViewport: uint32; viewportCount: uint32; pViewports: ptr VkViewport)

  PFN_vkCmdSetScissor* = proc (commandBuffer: VkCommandBuffer;
    firstScissor: uint32; scissorCount: uint32; pScissors: ptr VkRect2D)

  PFN_vkCmdSetLineWidth* = proc (commandBuffer: VkCommandBuffer; lineWidth: cfloat)

  PFN_vkCmdSetDepthBias* = proc (commandBuffer: VkCommandBuffer;
    depthBiasConstantFactor: cfloat; depthBiasClamp: cfloat;
    depthBiasSlopeFactor: cfloat)

  PFN_vkCmdSetBlendConstants* = proc (commandBuffer: VkCommandBuffer;
    blendConstants: array[4, cfloat])

  PFN_vkCmdSetDepthBounds* = proc (commandBuffer: VkCommandBuffer;
    minDepthBounds: cfloat; maxDepthBounds: cfloat)

  PFN_vkCmdSetStencilCompareMask* = proc (commandBuffer: VkCommandBuffer;
    faceMask: VkStencilFaceFlags; compareMask: uint32)

  PFN_vkCmdSetStencilWriteMask* = proc (commandBuffer: VkCommandBuffer;
    faceMask: VkStencilFaceFlags; writeMask: uint32)

  PFN_vkCmdSetStencilReference* = proc (commandBuffer: VkCommandBuffer;
    faceMask: VkStencilFaceFlags; reference: uint32)

  PFN_vkCmdBindDescriptorSets* = proc (commandBuffer: VkCommandBuffer;
    pipelineBindPoint: VkPipelineBindPoint; layout: VkPipelineLayout;
    firstSet: uint32; descriptorSetCount: uint32;
    pDescriptorSets: ptr VkDescriptorSet; dynamicOffsetCount: uint32;
    pDynamicOffsets: ptr uint32)

  PFN_vkCmdBindIndexBuffer* = proc (commandBuffer: VkCommandBuffer;
    buffer: VkBuffer; offset: VkDeviceSize; indexType: VkIndexType)

  PFN_vkCmdBindVertexBuffers* = proc (commandBuffer: VkCommandBuffer;
    firstBinding: uint32; bindingCount: uint32; pBuffers: ptr VkBuffer;
    pOffsets: ptr VkDeviceSize)

  PFN_vkCmdDraw* = proc (commandBuffer: VkCommandBuffer; vertexCount: uint32;
    instanceCount: uint32; firstVertex: uint32; firstInstance: uint32)

  PFN_vkCmdDrawIndexed* = proc (commandBuffer: VkCommandBuffer;
    indexCount: uint32; instanceCount: uint32; firstIndex: uint32;
    vertexOffset: int32; firstInstance: uint32)

  PFN_vkCmdDrawIndirect* = proc (commandBuffer: VkCommandBuffer;
    buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32)

  PFN_vkCmdDrawIndexedIndirect* = proc (commandBuffer: VkCommandBuffer;
    buffer: VkBuffer; offset: VkDeviceSize; drawCount: uint32; stride: uint32)

  PFN_vkCmdDispatch* = proc (commandBuffer: VkCommandBuffer; x: uint32;
    y: uint32; z: uint32)

  PFN_vkCmdDispatchIndirect* = proc (commandBuffer: VkCommandBuffer;
    buffer: VkBuffer; offset: VkDeviceSize)

  PFN_vkCmdCopyBuffer* = proc (commandBuffer: VkCommandBuffer;
    srcBuffer: VkBuffer; dstBuffer: VkBuffer; regionCount: uint32;
    pRegions: ptr VkBufferCopy)

  PFN_vkCmdCopyImage* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage;
    srcImageLayout: VkImageLayout; dstImage: VkImage;
    dstImageLayout: VkImageLayout; regionCount: uint32;
    pRegions: ptr VkImageCopy)

  PFN_vkCmdBlitImage* = proc (commandBuffer: VkCommandBuffer; srcImage: VkImage;
    srcImageLayout: VkImageLayout; dstImage: VkImage;
    dstImageLayout: VkImageLayout; regionCount: uint32;
    pRegions: ptr VkImageBlit; filter: VkFilter)

  PFN_vkCmdCopyBufferToImage* = proc (commandBuffer: VkCommandBuffer;
    srcBuffer: VkBuffer; dstImage: VkImage; dstImageLayout: VkImageLayout;
    regionCount: uint32; pRegions: ptr VkBufferImageCopy)

  PFN_vkCmdCopyImageToBuffer* = proc (commandBuffer: VkCommandBuffer;
    srcImage: VkImage; srcImageLayout: VkImageLayout;
    dstBuffer: VkBuffer; regionCount: uint32; pRegions: ptr VkBufferImageCopy)

  PFN_vkCmdUpdateBuffer* = proc (commandBuffer: VkCommandBuffer;
    dstBuffer: VkBuffer; dstOffset: VkDeviceSize; dataSize: VkDeviceSize;
    pData: ptr uint32)

  PFN_vkCmdFillBuffer* = proc (commandBuffer: VkCommandBuffer;
    dstBuffer: VkBuffer; dstOffset: VkDeviceSize; size: VkDeviceSize;
    data: uint32)

  PFN_vkCmdClearColorImage* = proc (commandBuffer: VkCommandBuffer;
    image: VkImage; imageLayout: VkImageLayout; pColor: ptr VkClearColorValue;
    rangeCount: uint32; pRanges: ptr VkImageSubresourceRange)

  PFN_vkCmdClearDepthStencilImage* = proc (commandBuffer: VkCommandBuffer;
    image: VkImage; imageLayout: VkImageLayout;
    pDepthStencil: ptr VkClearDepthStencilValue; rangeCount: uint32;
    pRanges: ptr VkImageSubresourceRange)

  PFN_vkCmdClearAttachments* = proc (commandBuffer: VkCommandBuffer;
    attachmentCount: uint32; pAttachments: ptr VkClearAttachment;
    rectCount: uint32; pRects: ptr VkClearRect)

  PFN_vkCmdResolveImage* = proc (commandBuffer: VkCommandBuffer;
    srcImage: VkImage; srcImageLayout: VkImageLayout; dstImage: VkImage;
    dstImageLayout: VkImageLayout; regionCount: uint32;
    pRegions: ptr VkImageResolve)

  PFN_vkCmdSetEvent* = proc (commandBuffer: VkCommandBuffer; event: VkEvent;
    stageMask: VkPipelineStageFlags)

  PFN_vkCmdResetEvent* = proc (commandBuffer: VkCommandBuffer; event: VkEvent;
    stageMask: VkPipelineStageFlags)

  PFN_vkCmdWaitEvents* = proc (commandBuffer: VkCommandBuffer;
    eventCount: uint32; pEvents: ptr VkEvent;
    srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags;
    memoryBarrierCount: uint32; pMemoryBarriers: ptr VkMemoryBarrier;
    bufferMemoryBarrierCount: uint32;
    pBufferMemoryBarriers: ptr VkBufferMemoryBarrier;
    imageMemoryBarrierCount: uint32;
    pImageMemoryBarriers: ptr VkImageMemoryBarrier)

  PFN_vkCmdPipelineBarrier* = proc (commandBuffer: VkCommandBuffer;
    srcStageMask: VkPipelineStageFlags; dstStageMask: VkPipelineStageFlags;
    dependencyFlags: VkDependencyFlags; memoryBarrierCount: uint32;
    pMemoryBarriers: ptr VkMemoryBarrier; bufferMemoryBarrierCount: uint32;
    pBufferMemoryBarriers: ptr VkBufferMemoryBarrier;
    imageMemoryBarrierCount: uint32;
    pImageMemoryBarriers: ptr VkImageMemoryBarrier)

  PFN_vkCmdBeginQuery* = proc (commandBuffer: VkCommandBuffer;
    queryPool: VkQueryPool; query: uint32; flags: VkQueryControlFlags)

  PFN_vkCmdEndQuery* = proc (commandBuffer: VkCommandBuffer;
    queryPool: VkQueryPool; query: uint32)

  PFN_vkCmdResetQueryPool* = proc (commandBuffer: VkCommandBuffer;
    queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32)

  PFN_vkCmdWriteTimestamp* = proc (commandBuffer: VkCommandBuffer;
    pipelineStage: VkPipelineStageFlagBits; queryPool: VkQueryPool;
    query: uint32)

  PFN_vkCmdCopyQueryPoolResults* = proc (commandBuffer: VkCommandBuffer;
    queryPool: VkQueryPool; firstQuery: uint32; queryCount: uint32;
    dstBuffer: VkBuffer; dstOffset: VkDeviceSize; stride: VkDeviceSize;
    flags: VkQueryResultFlags)

  PFN_vkCmdPushConstants* = proc (commandBuffer: VkCommandBuffer;
    layout: VkPipelineLayout; stageFlags: VkShaderStageFlags; offset: uint32;
    size: uint32; pValues: pointer)

  PFN_vkCmdBeginRenderPass* = proc (commandBuffer: VkCommandBuffer;
    pRenderPassBegin: ptr VkRenderPassBeginInfo; contents: VkSubpassContents)

  PFN_vkCmdNextSubpass* = proc (commandBuffer: VkCommandBuffer;
    contents: VkSubpassContents)

  PFN_vkCmdEndRenderPass* = proc (commandBuffer: VkCommandBuffer)

  PFN_vkCmdExecuteCommands* = proc (commandBuffer: VkCommandBuffer;
    commandBufferCount: uint32; pCommandBuffers: ptr VkCommandBuffer)

proc vkCreateInstance*(
  pCreateInfo: ptr VkInstanceCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pInstance: ptr VkInstance): VkResult
  {.cdecl, importc.}

proc vkDestroyInstance*(
  instance: VkInstance;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkEnumeratePhysicalDevices*(
  instance: VkInstance;
  pPhysicalDeviceCount: ptr uint32;
  pPhysicalDevices: ptr VkPhysicalDevice): VkResult
  {.cdecl, importc.}

proc vkGetPhysicalDeviceFeatures*(
  physicalDevice: VkPhysicalDevice;
  pFeatures: ptr VkPhysicalDeviceFeatures)
  {.cdecl, importc.}

proc vkGetPhysicalDeviceFormatProperties*(
  physicalDevice: VkPhysicalDevice;
  format: VkFormat;
  pFormatProperties: ptr VkFormatProperties)
  {.cdecl, importc.}

proc vkGetPhysicalDeviceImageFormatProperties*(
  physicalDevice: VkPhysicalDevice;
  format: VkFormat;
  imgType: VkImageType;
  tiling: VkImageTiling;
  usage: VkImageUsageFlags;
  flags: VkImageCreateFlags;
  pImageFormatProperties: ptr VkImageFormatProperties): VkResult
  {.cdecl, importc.}

proc vkGetPhysicalDeviceProperties*(
  physicalDevice: VkPhysicalDevice;
  pProperties: ptr VkPhysicalDeviceProperties)
  {.cdecl, importc.}

proc vkGetPhysicalDeviceQueueFamilyProperties*(
  physicalDevice: VkPhysicalDevice;
  pQueueFamilyPropertyCount: ptr uint32;
  pQueueFamilyProperties: ptr VkQueueFamilyProperties)
  {.cdecl, importc.}

proc vkGetPhysicalDeviceMemoryProperties*(
  physicalDevice: VkPhysicalDevice;
  pMemoryProperties: ptr VkPhysicalDeviceMemoryProperties)
  {.cdecl, importc.}

proc vkGetInstanceProcAddr*(
  instance: VkInstance;
  pName: cstring): PFN_vkVoidFunction
  {.cdecl, importc.}

proc vkGetDeviceProcAddr*(
  device: VkDevice;
  pName: cstring): PFN_vkVoidFunction
  {.cdecl, importc.}

proc vkCreateDevice*(
  physicalDevice: VkPhysicalDevice;
  pCreateInfo: ptr VkDeviceCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pDevice: ptr VkDevice): VkResult
  {.cdecl, importc.}

proc vkDestroyDevice*(
  device: VkDevice;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkEnumerateInstanceExtensionProperties*(
  pLayerName: cstring;
  pPropertyCount: ptr uint32;
  pProperties: ptr VkExtensionProperties): VkResult
  {.cdecl, importc.}

proc vkEnumerateDeviceExtensionProperties*(
  physicalDevice: VkPhysicalDevice;
  pLayerName: cstring;
  pPropertyCount: ptr uint32;
  pProperties: ptr VkExtensionProperties): VkResult
  {.cdecl, importc.}

proc vkEnumerateInstanceLayerProperties*(
  pPropertyCount: ptr uint32;
  pProperties: ptr VkLayerProperties): VkResult
  {.cdecl, importc.}

proc vkEnumerateDeviceLayerProperties*(
  physicalDevice: VkPhysicalDevice;
  pPropertyCount: ptr uint32;
  pProperties: ptr VkLayerProperties): VkResult
  {.cdecl, importc.}

proc vkGetDeviceQueue*(
  device: VkDevice;
  queueFamilyIndex: uint32;
  queueIndex: uint32;
  pQueue: ptr VkQueue)
  {.cdecl, importc.}

proc vkQueueSubmit*(
  queue: VkQueue;
  submitCount: uint32;
  pSubmits: ptr VkSubmitInfo;
  fence: VkFence): VkResult
  {.cdecl, importc.}

proc vkQueueWaitIdle*(
  queue: VkQueue): VkResult
  {.cdecl, importc.}

proc vkDeviceWaitIdle*(
  device: VkDevice): VkResult
  {.cdecl, importc.}

proc vkAllocateMemory*(
  device: VkDevice;
  pAllocateInfo: ptr VkMemoryAllocateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pMemory: ptr VkDeviceMemory): VkResult
  {.cdecl, importc.}

proc vkFreeMemory*(
  device: VkDevice;
  memory: VkDeviceMemory;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkMapMemory*(
  device: VkDevice;
  memory: VkDeviceMemory;
  offset: VkDeviceSize;
  size: VkDeviceSize;
  flags: VkMemoryMapFlags;
  ppData: ptr pointer): VkResult
  {.cdecl, importc.}

proc vkUnmapMemory*(device: VkDevice; memory: VkDeviceMemory)
  {.cdecl, importc.}

proc vkFlushMappedMemoryRanges*(
  device: VkDevice;
  memoryRangeCount: uint32;
  pMemoryRanges: ptr VkMappedMemoryRange): VkResult
  {.cdecl, importc.}

proc vkInvalidateMappedMemoryRanges*(
  device: VkDevice;
  memoryRangeCount: uint32;
  pMemoryRanges: ptr VkMappedMemoryRange): VkResult
  {.cdecl, importc.}

proc vkGetDeviceMemoryCommitment*(
  device: VkDevice;
  memory: VkDeviceMemory;
  pCommittedMemoryInBytes: ptr VkDeviceSize)
  {.cdecl, importc.}

proc vkBindBufferMemory*(
  device: VkDevice;
  buffer: VkBuffer;
  memory: VkDeviceMemory;
  memoryOffset: VkDeviceSize): VkResult
  {.cdecl, importc.}

proc vkBindImageMemory*(
  device: VkDevice;
  image: VkImage;
  memory: VkDeviceMemory;
  memoryOffset: VkDeviceSize): VkResult
  {.cdecl, importc.}

proc vkGetBufferMemoryRequirements*(
  device: VkDevice;
  buffer: VkBuffer;
  pMemoryRequirements: ptr VkMemoryRequirements)
  {.cdecl, importc.}

proc vkGetImageMemoryRequirements*(
  device: VkDevice;
  image: VkImage;
  pMemoryRequirements: ptr VkMemoryRequirements)
  {.cdecl, importc.}

proc vkGetImageSparseMemoryRequirements*(
  device: VkDevice;
  image: VkImage;
  pSparseMemoryRequirementCount: ptr uint32;
  pSparseMemoryRequirements: ptr VkSparseImageMemoryRequirements)
  {.cdecl, importc.}

proc vkGetPhysicalDeviceSparseImageFormatProperties*(
  physicalDevice: VkPhysicalDevice;
  format: VkFormat; imgType: VkImageType;
  samples: VkSampleCountFlagBits; usage: VkImageUsageFlags;
  tiling: VkImageTiling; pPropertyCount: ptr uint32;
  pProperties: ptr VkSparseImageFormatProperties)
  {.cdecl, importc.}

proc vkQueueBindSparse*(
  queue: VkQueue;
  bindInfoCount: uint32;
  pBindInfo: ptr VkBindSparseInfo;
  fence: VkFence): VkResult
  {.cdecl, importc.}

proc vkCreateFence*(
  device: VkDevice;
  pCreateInfo: ptr VkFenceCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pFence: ptr VkFence): VkResult
  {.cdecl, importc.}

proc vkDestroyFence*(
  device: VkDevice;
  fence: VkFence;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkResetFences*(
  device: VkDevice;
  fenceCount: uint32;
  pFences: ptr VkFence): VkResult
  {.cdecl, importc.}

proc vkGetFenceStatus*(
  device: VkDevice;
  fence: VkFence): VkResult
  {.cdecl, importc.}

proc vkWaitForFences*(
  device: VkDevice;
  fenceCount: uint32;
  pFences: ptr VkFence;
  waitAll: VkBool32;
  timeout: uint64): VkResult
  {.cdecl, importc.}

proc vkCreateSemaphore*(
  device: VkDevice;
  pCreateInfo: ptr VkSemaphoreCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pSemaphore: ptr VkSemaphore): VkResult
  {.cdecl, importc.}

proc vkDestroySemaphore*(
  device: VkDevice;
  semaphore: VkSemaphore;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreateEvent*(
  device: VkDevice;
  pCreateInfo: ptr VkEventCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pEvent: ptr VkEvent): VkResult
  {.cdecl, importc.}

proc vkDestroyEvent*(
  device: VkDevice;
  event: VkEvent;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkGetEventStatus*(
  device: VkDevice; event: VkEvent): VkResult
  {.cdecl, importc.}

proc vkSetEvent*(
  device: VkDevice; event: VkEvent): VkResult
  {.cdecl, importc.}

proc vkResetEvent*(
  device: VkDevice; event: VkEvent): VkResult
  {.cdecl, importc.}

proc vkCreateQueryPool*(
  device: VkDevice;
  pCreateInfo: ptr VkQueryPoolCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pQueryPool: ptr VkQueryPool): VkResult
  {.cdecl, importc.}

proc vkDestroyQueryPool*(
  device: VkDevice;
  queryPool: VkQueryPool;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkGetQueryPoolResults*(
  device: VkDevice;
  queryPool: VkQueryPool;
  firstQuery: uint32;
  queryCount: uint32;
  dataSize: csize;
  pData: pointer;
  stride: VkDeviceSize;
  flags: VkQueryResultFlags): VkResult
  {.cdecl, importc.}

proc vkCreateBuffer*(
  device: VkDevice;
  pCreateInfo: ptr VkBufferCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pBuffer: ptr VkBuffer): VkResult
  {.cdecl, importc.}

proc vkDestroyBuffer*(
  device: VkDevice;
  buffer: VkBuffer;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreateBufferView*(
  device: VkDevice;
  pCreateInfo: ptr VkBufferViewCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pView: ptr VkBufferView): VkResult
  {.cdecl, importc.}

proc vkDestroyBufferView*(
  device: VkDevice;
  bufferView: VkBufferView;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreateImage*(
  device: VkDevice;
  pCreateInfo: ptr VkImageCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pImage: ptr VkImage): VkResult
  {.cdecl, importc.}

proc vkDestroyImage*(
  device: VkDevice;
  image: VkImage;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkGetImageSubresourceLayout*(
  device: VkDevice;
  image: VkImage;
  pSubresource: ptr VkImageSubresource;
  pLayout: ptr VkSubresourceLayout)
  {.cdecl, importc.}

proc vkCreateImageView*(
  device: VkDevice;
  pCreateInfo: ptr VkImageViewCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pView: ptr VkImageView): VkResult
  {.cdecl, importc.}

proc vkDestroyImageView*(
  device: VkDevice;
  imageView: VkImageView;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreateShaderModule*(
  device: VkDevice;
  pCreateInfo: ptr VkShaderModuleCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pShaderModule: ptr VkShaderModule): VkResult
  {.cdecl, importc.}

proc vkDestroyShaderModule*(
  device: VkDevice;
  shaderModule: VkShaderModule;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreatePipelineCache*(
  device: VkDevice;
  pCreateInfo: ptr VkPipelineCacheCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pPipelineCache: ptr VkPipelineCache): VkResult
  {.cdecl, importc.}

proc vkDestroyPipelineCache*(
  device: VkDevice;
  pipelineCache: VkPipelineCache;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkGetPipelineCacheData*(
  device: VkDevice;
  pipelineCache: VkPipelineCache;
  pDataSize: ptr csize;
  pData: pointer): VkResult
  {.cdecl, importc.}

proc vkMergePipelineCaches*(
  device: VkDevice;
  dstCache: VkPipelineCache;
  srcCacheCount: uint32;
  pSrcCaches: ptr VkPipelineCache): VkResult
  {.cdecl, importc.}

proc vkCreateGraphicsPipelines*(
  device: VkDevice;
  pipelineCache: VkPipelineCache;
  createInfoCount: uint32;
  pCreateInfos: ptr VkGraphicsPipelineCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pPipelines: ptr VkPipeline): VkResult
  {.cdecl, importc.}

proc vkCreateComputePipelines*(
  device: VkDevice;
  pipelineCache: VkPipelineCache;
  createInfoCount: uint32;
  pCreateInfos: ptr VkComputePipelineCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pPipelines: ptr VkPipeline): VkResult
  {.cdecl, importc.}

proc vkDestroyPipeline*(
  device: VkDevice;
  pipeline: VkPipeline;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreatePipelineLayout*(
  device: VkDevice;
  pCreateInfo: ptr VkPipelineLayoutCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pPipelineLayout: ptr VkPipelineLayout): VkResult
  {.cdecl, importc.}

proc vkDestroyPipelineLayout*(
  device: VkDevice;
  pipelineLayout: VkPipelineLayout;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreateSampler*(
  device: VkDevice;
  pCreateInfo: ptr VkSamplerCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pSampler: ptr VkSampler): VkResult
  {.cdecl, importc.}

proc vkDestroySampler*(
  device: VkDevice;
  sampler: VkSampler;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreateDescriptorSetLayout*(
  device: VkDevice;
  pCreateInfo: ptr VkDescriptorSetLayoutCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pSetLayout: ptr VkDescriptorSetLayout): VkResult
  {.cdecl, importc.}

proc vkDestroyDescriptorSetLayout*(
  device: VkDevice;
  descriptorSetLayout: VkDescriptorSetLayout;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreateDescriptorPool*(
  device: VkDevice;
  pCreateInfo: ptr VkDescriptorPoolCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pDescriptorPool: ptr VkDescriptorPool): VkResult
  {.cdecl, importc.}

proc vkDestroyDescriptorPool*(
  device: VkDevice;
  descriptorPool: VkDescriptorPool;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkResetDescriptorPool*(
  device: VkDevice;
  descriptorPool: VkDescriptorPool;
  flags: VkDescriptorPoolResetFlags): VkResult
  {.cdecl, importc.}

proc vkAllocateDescriptorSets*(
  device: VkDevice;
  pAllocateInfo: ptr VkDescriptorSetAllocateInfo;
  pDescriptorSets: ptr VkDescriptorSet): VkResult
  {.cdecl, importc.}

proc vkFreeDescriptorSets*(
  device: VkDevice;
  descriptorPool: VkDescriptorPool;
  descriptorSetCount: uint32;
  pDescriptorSets: ptr VkDescriptorSet): VkResult
  {.cdecl, importc.}

proc vkUpdateDescriptorSets*(
  device: VkDevice;
  descriptorWriteCount: uint32;
  pDescriptorWrites: ptr VkWriteDescriptorSet;
  descriptorCopyCount: uint32;
  pDescriptorCopies: ptr VkCopyDescriptorSet)
  {.cdecl, importc.}

proc vkCreateFramebuffer*(
  device: VkDevice;
  pCreateInfo: ptr VkFramebufferCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pFramebuffer: ptr VkFramebuffer): VkResult
  {.cdecl, importc.}

proc vkDestroyFramebuffer*(
  device: VkDevice;
  framebuffer: VkFramebuffer;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkCreateRenderPass*(
  device: VkDevice;
  pCreateInfo: ptr VkRenderPassCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pRenderPass: ptr VkRenderPass): VkResult
  {.cdecl, importc.}

proc vkDestroyRenderPass*(
  device: VkDevice;
  renderPass: VkRenderPass;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkGetRenderAreaGranularity*(
  device: VkDevice;
  renderPass: VkRenderPass;
  pGranularity: ptr VkExtent2D)
  {.cdecl, importc.}

proc vkCreateCommandPool*(
  device: VkDevice;
  pCreateInfo: ptr VkCommandPoolCreateInfo;
  pAllocator: ptr VkAllocationCallbacks;
  pCommandPool: ptr VkCommandPool): VkResult
  {.cdecl, importc.}

proc vkDestroyCommandPool*(
  device: VkDevice;
  commandPool: VkCommandPool;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkResetCommandPool*(
  device: VkDevice;
  commandPool: VkCommandPool;
  flags: VkCommandPoolResetFlags): VkResult
  {.cdecl, importc.}

proc vkAllocateCommandBuffers*(
  device: VkDevice;
  pAllocateInfo: ptr VkCommandBufferAllocateInfo;
  pCommandBuffers: ptr VkCommandBuffer): VkResult
  {.cdecl, importc.}

proc vkFreeCommandBuffers*(
  device: VkDevice;
  commandPool: VkCommandPool;
  commandBufferCount: uint32;
  pCommandBuffers: ptr VkCommandBuffer)
  {.cdecl, importc.}

proc vkBeginCommandBuffer*(
  commandBuffer: VkCommandBuffer;
  pBeginInfo: ptr VkCommandBufferBeginInfo): VkResult
  {.cdecl, importc.}

proc vkEndCommandBuffer*(
  commandBuffer: VkCommandBuffer): VkResult
  {.cdecl, importc.}

proc vkResetCommandBuffer*(
  commandBuffer: VkCommandBuffer;
  flags: VkCommandBufferResetFlags): VkResult
  {.cdecl, importc.}

proc vkCmdBindPipeline*(
  commandBuffer: VkCommandBuffer;
  pipelineBindPoint: VkPipelineBindPoint;
  pipeline: VkPipeline)
  {.cdecl, importc.}

proc vkCmdSetViewport*(
  commandBuffer: VkCommandBuffer;
  firstViewport: uint32;
  viewportCount: uint32;
  pViewports: ptr VkViewport)
  {.cdecl, importc.}

proc vkCmdSetScissor*(
  commandBuffer: VkCommandBuffer;
  firstScissor: uint32;
  scissorCount: uint32;
  pScissors: ptr VkRect2D)
  {.cdecl, importc.}

proc vkCmdSetLineWidth*(
  commandBuffer: VkCommandBuffer;
  lineWidth: cfloat)
  {.cdecl, importc.}

proc vkCmdSetDepthBias*(
  commandBuffer: VkCommandBuffer;
  depthBiasConstantFactor: cfloat;
  depthBiasClamp: cfloat;
  depthBiasSlopeFactor: cfloat)
  {.cdecl, importc.}

proc vkCmdSetBlendConstants*(
  commandBuffer: VkCommandBuffer;
  blendConstants: array[4, cfloat])
  {.cdecl, importc.}

proc vkCmdSetDepthBounds*(
  commandBuffer: VkCommandBuffer;
  minDepthBounds: cfloat;
  maxDepthBounds: cfloat)
  {.cdecl, importc.}

proc vkCmdSetStencilCompareMask*(
  commandBuffer: VkCommandBuffer;
  faceMask: VkStencilFaceFlags;
  compareMask: uint32)
  {.cdecl, importc.}

proc vkCmdSetStencilWriteMask*(
  commandBuffer: VkCommandBuffer;
  faceMask: VkStencilFaceFlags;
  writeMask: uint32)
  {.cdecl, importc.}

proc vkCmdSetStencilReference*(
  commandBuffer: VkCommandBuffer;
  faceMask: VkStencilFaceFlags;
  reference: uint32)
  {.cdecl, importc.}

proc vkCmdBindDescriptorSets*(
  commandBuffer: VkCommandBuffer;
  pipelineBindPoint: VkPipelineBindPoint;
  layout: VkPipelineLayout;
  firstSet: uint32;
  descriptorSetCount: uint32;
  pDescriptorSets: ptr VkDescriptorSet;
  dynamicOffsetCount: uint32;
  pDynamicOffsets: ptr uint32)
  {.cdecl, importc.}

proc vkCmdBindIndexBuffer*(
  commandBuffer: VkCommandBuffer;
  buffer: VkBuffer;
  offset: VkDeviceSize;
  indexType: VkIndexType)
  {.cdecl, importc.}

proc vkCmdBindVertexBuffers*(
  commandBuffer: VkCommandBuffer;
  firstBinding: uint32;
  bindingCount: uint32;
  pBuffers: ptr VkBuffer;
  pOffsets: ptr VkDeviceSize)
  {.cdecl, importc.}

proc vkCmdDraw*(
  commandBuffer: VkCommandBuffer;
  vertexCount: uint32;
  instanceCount: uint32;
  firstVertex: uint32;
  firstInstance: uint32)
  {.cdecl, importc.}

proc vkCmdDrawIndexed*(
  commandBuffer: VkCommandBuffer;
  indexCount: uint32;
  instanceCount: uint32;
  firstIndex: uint32;
  vertexOffset: int32;
  firstInstance: uint32)
  {.cdecl, importc.}

proc vkCmdDrawIndirect*(
  commandBuffer: VkCommandBuffer;
  buffer: VkBuffer;
  offset: VkDeviceSize;
  drawCount: uint32;
  stride: uint32)
  {.cdecl, importc.}

proc vkCmdDrawIndexedIndirect*(
  commandBuffer: VkCommandBuffer;
  buffer: VkBuffer;
  offset: VkDeviceSize;
  drawCount: uint32;
  stride: uint32)
  {.cdecl, importc.}

proc vkCmdDispatch*(
  commandBuffer: VkCommandBuffer;
  x: uint32;
  y: uint32;
  z: uint32)
  {.cdecl, importc.}

proc vkCmdDispatchIndirect*(
  commandBuffer: VkCommandBuffer;
  buffer: VkBuffer;
  offset: VkDeviceSize)
  {.cdecl, importc.}

proc vkCmdCopyBuffer*(
  commandBuffer: VkCommandBuffer;
  srcBuffer: VkBuffer;
  dstBuffer: VkBuffer;
  regionCount: uint32;
  pRegions: ptr VkBufferCopy)
  {.cdecl, importc.}

proc vkCmdCopyImage*(
  commandBuffer: VkCommandBuffer;
  srcImage: VkImage;
  srcImageLayout: VkImageLayout;
  dstImage: VkImage;
  dstImageLayout: VkImageLayout;
  regionCount: uint32;
  pRegions: ptr VkImageCopy)
  {.cdecl, importc.}

proc vkCmdBlitImage*(
  commandBuffer: VkCommandBuffer;
  srcImage: VkImage;
  srcImageLayout: VkImageLayout;
  dstImage: VkImage;
  dstImageLayout: VkImageLayout;
  regionCount: uint32;
  pRegions: ptr VkImageBlit;
  filter: VkFilter)
  {.cdecl, importc.}

proc vkCmdCopyBufferToImage*(
  commandBuffer: VkCommandBuffer;
  srcBuffer: VkBuffer;
  dstImage: VkImage;
  dstImageLayout: VkImageLayout;
  regionCount: uint32;
  pRegions: ptr VkBufferImageCopy)
  {.cdecl, importc.}

proc vkCmdCopyImageToBuffer*(
  commandBuffer: VkCommandBuffer;
  srcImage: VkImage;
  srcImageLayout: VkImageLayout;
  dstBuffer: VkBuffer;
  regionCount: uint32;
  pRegions: ptr VkBufferImageCopy)
  {.cdecl, importc.}

proc vkCmdUpdateBuffer*(
  commandBuffer: VkCommandBuffer;
  dstBuffer: VkBuffer;
  dstOffset: VkDeviceSize;
  dataSize: VkDeviceSize;
  pData: ptr uint32)
  {.cdecl, importc.}

proc vkCmdFillBuffer*(
  commandBuffer: VkCommandBuffer;
  dstBuffer: VkBuffer;
  dstOffset: VkDeviceSize;
  size: VkDeviceSize;
  data: uint32)
  {.cdecl, importc.}

proc vkCmdClearColorImage*(
  commandBuffer: VkCommandBuffer;
  image: VkImage;
  imageLayout: VkImageLayout;
  pColor: ptr VkClearColorValue;
  rangeCount: uint32;
  pRanges: ptr VkImageSubresourceRange)
  {.cdecl, importc.}

proc vkCmdClearDepthStencilImage*(
  commandBuffer: VkCommandBuffer;
  image: VkImage;
  imageLayout: VkImageLayout;
  pDepthStencil: ptr VkClearDepthStencilValue;
  rangeCount: uint32;
  pRanges: ptr VkImageSubresourceRange)
  {.cdecl, importc.}

proc vkCmdClearAttachments*(
  commandBuffer: VkCommandBuffer;
  attachmentCount: uint32;
  pAttachments: ptr VkClearAttachment;
  rectCount: uint32;
  pRects: ptr VkClearRect)
  {.cdecl, importc.}

proc vkCmdResolveImage*(
  commandBuffer: VkCommandBuffer;
  srcImage: VkImage;
  srcImageLayout: VkImageLayout;
  dstImage: VkImage;
  dstImageLayout: VkImageLayout;
  regionCount: uint32;
  pRegions: ptr VkImageResolve)
  {.cdecl, importc.}

proc vkCmdSetEvent*(
  commandBuffer: VkCommandBuffer;
  event: VkEvent;
  stageMask: VkPipelineStageFlags)
  {.cdecl, importc.}

proc vkCmdResetEvent*(
  commandBuffer: VkCommandBuffer;
  event: VkEvent;
  stageMask: VkPipelineStageFlags)
  {.cdecl, importc.}

proc vkCmdWaitEvents*(
  commandBuffer: VkCommandBuffer;
  eventCount: uint32;
  pEvents: ptr VkEvent;
  srcStageMask: VkPipelineStageFlags;
  dstStageMask: VkPipelineStageFlags;
  memoryBarrierCount: uint32;
  pMemoryBarriers: ptr VkMemoryBarrier;
  bufferMemoryBarrierCount: uint32;
  pBufferMemoryBarriers: ptr VkBufferMemoryBarrier;
  imageMemoryBarrierCount: uint32;
  pImageMemoryBarriers: ptr VkImageMemoryBarrier)
  {.cdecl, importc.}

proc vkCmdPipelineBarrier*(
  commandBuffer: VkCommandBuffer;
  srcStageMask: VkPipelineStageFlags;
  dstStageMask: VkPipelineStageFlags;
  dependencyFlags: VkDependencyFlags;
  memoryBarrierCount: uint32;
  pMemoryBarriers: ptr VkMemoryBarrier;
  bufferMemoryBarrierCount: uint32;
  pBufferMemoryBarriers: ptr VkBufferMemoryBarrier;
  imageMemoryBarrierCount: uint32;
  pImageMemoryBarriers: ptr VkImageMemoryBarrier)
  {.cdecl, importc.}

proc vkCmdBeginQuery*(
  commandBuffer: VkCommandBuffer;
  queryPool: VkQueryPool;
  query: uint32;
  flags: VkQueryControlFlags)
  {.cdecl, importc.}

proc vkCmdEndQuery*(
  commandBuffer: VkCommandBuffer;
  queryPool: VkQueryPool;
  query: uint32)
  {.cdecl, importc.}

proc vkCmdResetQueryPool*(
  commandBuffer: VkCommandBuffer;
  queryPool: VkQueryPool;
  firstQuery: uint32;
  queryCount: uint32)
  {.cdecl, importc}

proc vkCmdWriteTimestamp*(
  commandBuffer: VkCommandBuffer;
  pipelineStage: VkPipelineStageFlagBits;
  queryPool: VkQueryPool;
  query: uint32)
  {.cdecl, importc.}

proc vkCmdCopyQueryPoolResults*(
  commandBuffer: VkCommandBuffer;
  queryPool: VkQueryPool;
  firstQuery: uint32;
  queryCount: uint32;
  dstBuffer: VkBuffer;
  dstOffset: VkDeviceSize;
  stride: VkDeviceSize;
  flags: VkQueryResultFlags)
  {.cdecl, importc.}

proc vkCmdPushConstants*(
  commandBuffer: VkCommandBuffer;
  layout: VkPipelineLayout;
  stageFlags: VkShaderStageFlags;
  offset: uint32;
  size: uint32;
  pValues: pointer)
  {.cdecl, importc.}

proc vkCmdBeginRenderPass*(
  commandBuffer: VkCommandBuffer;
  pRenderPassBegin: ptr VkRenderPassBeginInfo;
  contents: VkSubpassContents)
  {.cdecl, importc.}

proc vkCmdNextSubpass*(
  commandBuffer: VkCommandBuffer;
  contents: VkSubpassContents)
  {.cdecl, importc.}

proc vkCmdEndRenderPass*(
  commandBuffer: VkCommandBuffer)
  {.cdecl, importc.}

proc vkCmdExecuteCommands*(
  commandBuffer: VkCommandBuffer;
  commandBufferCount: uint32;
  pCommandBuffers: ptr VkCommandBuffer)
  {.cdecl, importc.}

const
  VK_KHR_surface* = 1

type
  VkSurfaceKHR* = pointer

const
  VK_KHR_SURFACE_SPEC_VERSION* = 25
  VK_KHR_SURFACE_EXTENSION_NAME* = "VK_KHR_surface"

type
  VkColorSpaceKHR* {.pure, size: sizeof(cint).} = enum
    srgbNonlinearKhr = 0,

  VkPresentModeKHR* {.pure, size: sizeof(cint).} = enum
    immediateKhr = 0,
    mailboxKhr = 1,
    fifoKhr = 2,
    fifoRelaxedKhr = 3,

  VkSurfaceTransformFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    identityBitKhr = 0x00000001,
    rotate90BitKhr = 0x00000002,
    rotate180BitKhr = 0x00000004,
    rotate270BitKhr = 0x00000008,
    horizontalMirrorBitKhr = 0x00000010,
    horizontalMirrorRotate90BitKhr = 0x00000020,
    horizontalMirrorRotate180BitKhr = 0x00000040,
    horizontalMirrorRotate270BitKhr = 0x00000080,
    inheritBitKhr = 0x00000100

  VkSurfaceTransformFlagsKHR* {.pure, size: sizeof(cint).} = VkFlags

  VkCompositeAlphaFlagBitsKHR* {.pure, size: sizeof(cint).} = enum
    opaqueBitKhr = 0x00000001,
    preMultipliedBitKhr = 0x00000002,
    postMultipliedBitKhr = 0x00000004,
    inheritBitKhr = 0x00000008

  VkCompositeAlphaFlagsKHR* {.pure, size: sizeof(cint).} = VkFlags

type
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

type
  PFN_vkDestroySurfaceKHR* = proc (
    instance: VkInstance;
    surface: VkSurfaceKHR;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkGetPhysicalDeviceSurfaceSupportKHR* = proc (
    physicalDevice: VkPhysicalDevice;
    queueFamilyIndex: uint32;
    surface: VkSurfaceKHR;
    pSupported: ptr VkBool32): VkResult

  PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR* = proc (
    physicalDevice: VkPhysicalDevice;
    surface: VkSurfaceKHR;
    pSurfaceCapabilities: ptr VkSurfaceCapabilitiesKHR): VkResult

  PFN_vkGetPhysicalDeviceSurfaceFormatsKHR* = proc (
    physicalDevice: VkPhysicalDevice;
    surface: VkSurfaceKHR;
    pSurfaceFormatCount: ptr uint32;
    pSurfaceFormats: ptr VkSurfaceFormatKHR): VkResult

  PFN_vkGetPhysicalDeviceSurfacePresentModesKHR* = proc (
    physicalDevice: VkPhysicalDevice;
    surface: VkSurfaceKHR;
    pPresentModeCount: ptr uint32;
    pPresentModes: ptr VkPresentModeKHR): VkResult

proc vkDestroySurfaceKHR*(
  instance: VkInstance;
  surface: VkSurfaceKHR;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkGetPhysicalDeviceSurfaceSupportKHR*(
  physicalDevice: VkPhysicalDevice;
  queueFamilyIndex: uint32;
  surface: VkSurfaceKHR;
  pSupported: ptr VkBool32): VkResult
  {.cdecl, importc.}

proc vkGetPhysicalDeviceSurfaceCapabilitiesKHR*(
  physicalDevice: VkPhysicalDevice;
  surface: VkSurfaceKHR;
  pSurfaceCapabilities: ptr VkSurfaceCapabilitiesKHR): VkResult
  {.cdecl, importc.}

proc vkGetPhysicalDeviceSurfaceFormatsKHR*(
  physicalDevice: VkPhysicalDevice;
  surface: VkSurfaceKHR;
  pSurfaceFormatCount: ptr uint32;
  pSurfaceFormats: ptr VkSurfaceFormatKHR): VkResult
  {.cdecl, importc.}

proc vkGetPhysicalDeviceSurfacePresentModesKHR*(
  physicalDevice: VkPhysicalDevice;
  surface: VkSurfaceKHR;
  pPresentModeCount: ptr uint32;
  pPresentModes: ptr VkPresentModeKHR): VkResult
  {.cdecl, importc.}

const
  VK_KHR_swapchain* = 1

type
  VkSwapchainKHR* = pointer

const
  vkKhrSwapchainSpecVersion* = 67
  vkKhrSwapchainExtensionName* = "VK_KHR_swapchain"

type
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

  PFN_vkCreateSwapchainKHR* = proc (
    device: VkDevice;
    pCreateInfo: ptr VkSwapchainCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pSwapchain: ptr VkSwapchainKHR): VkResult

  PFN_vkDestroySwapchainKHR* = proc (
    device: VkDevice;
    swapchain: VkSwapchainKHR;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkGetSwapchainImagesKHR* = proc (
    device: VkDevice;
    swapchain: VkSwapchainKHR;
    pSwapchainImageCount: ptr uint32;
    pSwapchainImages: ptr VkImage): VkResult

  PFN_vkAcquireNextImageKHR* = proc (
    device: VkDevice;
    swapchain: VkSwapchainKHR;
    timeout: uint64;
    semaphore: VkSemaphore;
    fence: VkFence;
    pImageIndex: ptr uint32): VkResult

  PFN_vkQueuePresentKHR* = proc (
    queue: VkQueue;
    pPresentInfo: ptr VkPresentInfoKHR): VkResult


proc vkCreateSwapchainKHR*(
  device: VkDevice;
  pCreateInfo: ptr VkSwapchainCreateInfoKHR;
  pAllocator: ptr VkAllocationCallbacks;
  pSwapchain: ptr VkSwapchainKHR): VkResult
  {.cdecl, importc.}

proc vkDestroySwapchainKHR*(
  device: VkDevice;
  swapchain: VkSwapchainKHR;
  pAllocator: ptr VkAllocationCallbacks)
  {.cdecl, importc.}

proc vkGetSwapchainImagesKHR*(
  device: VkDevice;
  swapchain: VkSwapchainKHR;
  pSwapchainImageCount: ptr uint32;
  pSwapchainImages: ptr VkImage): VkResult
  {.cdecl, importc.}

proc vkAcquireNextImageKHR*(
  device: VkDevice;
  swapchain: VkSwapchainKHR;
  timeout: uint64;
  semaphore: VkSemaphore;
  fence: VkFence;
  pImageIndex: ptr uint32): VkResult
  {.cdecl, importc.}

proc vkQueuePresentKHR*(
  queue: VkQueue;
  pPresentInfo: ptr VkPresentInfoKHR): VkResult
  {.cdecl, importc.}

const
  vKKHRDisplay* = 1

type
  VkDisplayKHR* = pointer
  VkDisplayModeKHR* = pointer

const
  vkKhrDisplaySpecVersion* = 21
  vkKhrDisplayExtensionName* = "VK_KHR_display"

type
  VkDisplayPlaneAlphaFlagBitsKHR* = enum
    opaqueBitKhr = 0x00000001,
    globalBitKhr = 0x00000002,
    perPixelBitKhr = 0x00000004,
    perPixelPremultipliedBitKhr = 0x00000008

  VkDisplayModeCreateFlagsKHR* = VkFlags
  VkDisplayPlaneAlphaFlagsKHR* = VkFlags
  VkDisplaySurfaceCreateFlagsKHR* = VkFlags

type
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

type
  PFN_vkGetPhysicalDeviceDisplayPropertiesKHR* = proc (
    physicalDevice: VkPhysicalDevice;
    pPropertyCount: ptr uint32;
    pProperties: ptr VkDisplayPropertiesKHR): VkResult

  PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR* = proc (
    physicalDevice: VkPhysicalDevice;
    pPropertyCount: ptr uint32;
    pProperties: ptr VkDisplayPlanePropertiesKHR): VkResult

  PFN_vkGetDisplayPlaneSupportedDisplaysKHR* = proc (
    physicalDevice: VkPhysicalDevice;
    planeIndex: uint32;
    pDisplayCount: ptr uint32;
    pDisplays: ptr VkDisplayKHR): VkResult

  PFN_vkGetDisplayModePropertiesKHR* = proc (physicalDevice: VkPhysicalDevice;
    display: VkDisplayKHR;
    pPropertyCount: ptr uint32;
    pProperties: ptr VkDisplayModePropertiesKHR): VkResult

  PFN_vkCreateDisplayModeKHR* = proc (physicalDevice: VkPhysicalDevice;
    display: VkDisplayKHR;
    pCreateInfo: ptr VkDisplayModeCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pMode: ptr VkDisplayModeKHR): VkResult

  PFN_vkGetDisplayPlaneCapabilitiesKHR* = proc (
    physicalDevice: VkPhysicalDevice;
    mode: VkDisplayModeKHR; planeIndex: uint32;
    pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR): VkResult

  PFN_vkCreateDisplayPlaneSurfaceKHR* = proc (
    instance: VkInstance;
    pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pSurface: ptr VkSurfaceKHR): VkResult

proc vkGetPhysicalDeviceDisplayPropertiesKHR*(
  physicalDevice: VkPhysicalDevice;
  pPropertyCount: ptr uint32;
  pProperties: ptr VkDisplayPropertiesKHR): VkResult
  {.cdecl, importc.}

proc vkGetPhysicalDeviceDisplayPlanePropertiesKHR*(
  physicalDevice: VkPhysicalDevice;
  pPropertyCount: ptr uint32;
  pProperties: ptr VkDisplayPlanePropertiesKHR): VkResult
  {.cdecl, importc.}

proc vkGetDisplayPlaneSupportedDisplaysKHR*(
  physicalDevice: VkPhysicalDevice;
  planeIndex: uint32;
  pDisplayCount: ptr uint32;
  pDisplays: ptr VkDisplayKHR): VkResult
  {.cdecl, importc.}

proc vkGetDisplayModePropertiesKHR*(
  physicalDevice: VkPhysicalDevice;
  display: VkDisplayKHR;
  pPropertyCount: ptr uint32;
  pProperties: ptr VkDisplayModePropertiesKHR): VkResult
  {.cdecl, importc.}

proc vkCreateDisplayModeKHR*(
  physicalDevice: VkPhysicalDevice;
  display: VkDisplayKHR;
  pCreateInfo: ptr VkDisplayModeCreateInfoKHR;
  pAllocator: ptr VkAllocationCallbacks;
  pMode: ptr VkDisplayModeKHR): VkResult
  {.cdecl, importc.}

proc vkGetDisplayPlaneCapabilitiesKHR*(
  physicalDevice: VkPhysicalDevice;
  mode: VkDisplayModeKHR;
  planeIndex: uint32;
  pCapabilities: ptr VkDisplayPlaneCapabilitiesKHR): VkResult
  {.cdecl, importc.}

proc vkCreateDisplayPlaneSurfaceKHR*(
  instance: VkInstance;
  pCreateInfo: ptr VkDisplaySurfaceCreateInfoKHR;
  pAllocator: ptr VkAllocationCallbacks;
  pSurface: ptr VkSurfaceKHR): VkResult
  {.cdecl, importc.}

const
  vkKhrDisplaySwapchain* = 1
  vkKhrDisplaySwapchainSpecVersion* = 9
  vkKhrDisplaySwapchainExtensionName* = "VK_KHR_display_swapchain"

type
  VkDisplayPresentInfoKHR* = object
    sType*: VkStructureType
    pNext*: pointer
    srcRect*: VkRect2D
    dstRect*: VkRect2D
    persistent*: VkBool32

  PFN_vkCreateSharedSwapchainsKHR* = proc (
    device: VkDevice;
    swapchainCount: uint32;
    pCreateInfos: ptr VkSwapchainCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pSwapchains: ptr VkSwapchainKHR): VkResult

proc vkCreateSharedSwapchainsKHR*(
  device: VkDevice;
  swapchainCount: uint32;
  pCreateInfos: ptr VkSwapchainCreateInfoKHR;
  pAllocator: ptr VkAllocationCallbacks;
  pSwapchains: ptr VkSwapchainKHR): VkResult
  {.cdecl, importc.}


when defined(vkUsePlatformXlibKhr):
  const
    vkKhrXlibSurface* = 1

  const
    vkKhrXlibSurfaceSpecVersion* = 6
    vkKhrXlibSurfaceExtensionName* = "VK_KHR_xlib_surface"

  type
    VkXlibSurfaceCreateFlagsKHR* = VkFlags

    VkXlibSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkXlibSurfaceCreateFlagsKHR
      dpy*: ptr Display
      window*: Window

  type
    PFN_vkCreateXlibSurfaceKHR* = proc (
      instance: VkInstance; pCreateInfo: ptr VkXlibSurfaceCreateInfoKHR;
      pAllocator: ptr VkAllocationCallbacks;
      pSurface: ptr VkSurfaceKHR): VkResult

    PFN_vkGetPhysicalDeviceXlibPresentationSupportKHR* = proc (
      physicalDevice: VkPhysicalDevice;
      queueFamilyIndex: uint32;
      dpy: ptr Display;
      visualID: VisualID): VkBool32

  proc vkCreateXlibSurfaceKHR*(
    instance: VkInstance;
    pCreateInfo: ptr VkXlibSurfaceCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pSurface: ptr VkSurfaceKHR): VkResult
    {.cdecl, importc.}

  proc vkGetPhysicalDeviceXlibPresentationSupportKHR*(
    physicalDevice: VkPhysicalDevice;
    queueFamilyIndex: uint32;
    dpy: ptr Display;
    visualID: VisualID): VkBool32
    {.cdecl, importc.}


when defined(vkUsePlatformXcbKhr):
  const
    vkKhrXcbSurface* = 1

  const
    vkKhrXcbSurfaceSpecVersion* = 6
    vkKhrXcbSurfaceExtensionName* = "VK_KHR_xcb_surface"

  type
    VkXcbSurfaceCreateFlagsKHR* = VkFlags

    VkXcbSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkXcbSurfaceCreateFlagsKHR
      connection*: ptr xcb_connection_t
      window*: xcb_window_t

  type
    PFN_vkCreateXcbSurfaceKHR* = proc (
      instance: VkInstance;
      pCreateInfo: ptr VkXcbSurfaceCreateInfoKHR;
      pAllocator: ptr VkAllocationCallbacks;
      pSurface: ptr VkSurfaceKHR): VkResult

    PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR* = proc (
      physicalDevice: VkPhysicalDevice;
      queueFamilyIndex: uint32;
      connection: ptr xcb_connection_t;
      visual_id: xcb_visualid_t): VkBool32

  proc vkCreateXcbSurfaceKHR*(
    instance: VkInstance;
    pCreateInfo: ptr VkXcbSurfaceCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pSurface: ptr VkSurfaceKHR): VkResult
    {.cdecl, importc.}

  proc vkGetPhysicalDeviceXcbPresentationSupportKHR*(
    physicalDevice: VkPhysicalDevice;
    queueFamilyIndex: uint32;
    connection: ptr xcb_connection_t;
    visual_id: xcb_visualid_t): VkBool32
    {.cdecl, importc.}


when defined(vkUsePlatformWaylandKhr):
  const
    vkKhrWaylandSurface* = 1

  const
    vkKhrWaylandSurfaceSpecVersion* = 5
    vkKhrWaylandSurfaceExtensionName* = "VK_KHR_wayland_surface"

  type
    VkWaylandSurfaceCreateFlagsKHR* = VkFlags

    VkWaylandSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkWaylandSurfaceCreateFlagsKHR
      display*: ptr wl_display
      surface*: ptr wl_surface

    PFN_vkCreateWaylandSurfaceKHR* = proc (
      instance: VkInstance; pCreateInfo: ptr VkWaylandSurfaceCreateInfoKHR;
      pAllocator: ptr VkAllocationCallbacks;
      pSurface: ptr VkSurfaceKHR): VkResult

    PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR* = proc (
      physicalDevice: VkPhysicalDevice;
      queueFamilyIndex: uint32;
      display: ptr wl_display): VkBool32

  proc vkCreateWaylandSurfaceKHR*(
    instance: VkInstance;
    pCreateInfo: ptr VkWaylandSurfaceCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pSurface: ptr VkSurfaceKHR): VkResult
    {.cdecl, importc.}

  proc vkGetPhysicalDeviceWaylandPresentationSupportKHR*(
    physicalDevice: VkPhysicalDevice;
    queueFamilyIndex: uint32;
    display: ptr wl_display): VkBool32
    {.cdecl, importc.}


when defined(vkUsePlatformMirKhr):
  const
    vkKhrMirSurface* = 1

  const
    vkKhrMirSurfaceSpecVersion* = 4
    vkKhrMirSurfaceExtensionName* = "VK_KHR_mir_surface"

  type
    VkMirSurfaceCreateFlagsKHR* = VkFlags

    VkMirSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkMirSurfaceCreateFlagsKHR
      connection*: ptr MirConnection
      mirSurface*: ptr MirSurface

    PFN_vkCreateMirSurfaceKHR* = proc (
      instance: VkInstance;
      pCreateInfo: ptr VkMirSurfaceCreateInfoKHR;
      pAllocator: ptr VkAllocationCallbacks;
      pSurface: ptr VkSurfaceKHR): VkResult

    PFN_vkGetPhysicalDeviceMirPresentationSupportKHR* = proc (
      physicalDevice: VkPhysicalDevice;
      queueFamilyIndex: uint32;
      connection: ptr MirConnection): VkBool32

  proc vkCreateMirSurfaceKHR*(
    instance: VkInstance;
    pCreateInfo: ptr VkMirSurfaceCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pSurface: ptr VkSurfaceKHR): VkResult
    {.cdecl, importc.}

  proc vkGetPhysicalDeviceMirPresentationSupportKHR*(
    physicalDevice: VkPhysicalDevice;
    queueFamilyIndex: uint32;
    connection: ptr MirConnection): VkBool32
    {.cdecl, importc.}


when defined(vkUsePlatformAndroidKhr):
  const
    vkKhrAndroidSurface* = 1

  const
    vkKhrAndroidSurfaceSpecVersion* = 6
    vkKhrAndroidSurfaceExtensionName* = "VK_KHR_android_surface"

  type
    VkAndroidSurfaceCreateFlagsKHR* = VkFlags

    VkAndroidSurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkAndroidSurfaceCreateFlagsKHR
      window*: ptr ANativeWindow

    PFN_vkCreateAndroidSurfaceKHR* = proc (
      instance: VkInstance;
      pCreateInfo: ptr VkAndroidSurfaceCreateInfoKHR;
      pAllocator: ptr VkAllocationCallbacks;
      pSurface: ptr VkSurfaceKHR): VkResult

  proc vkCreateAndroidSurfaceKHR*(
    instance: VkInstance;
    pCreateInfo: ptr VkAndroidSurfaceCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pSurface: ptr VkSurfaceKHR): VkResult
    {.cdecl, importc.}


when defined(vkUsePlatformWin32Khr):
  const
    vkKhrWin32Surface* = 1

  const
    vkKhrWin32SurfaceSpecVersion* = 5
    vkKhrWin32SurfaceExtensionName* = "VK_KHR_win32_surface"

  type
    VkWin32SurfaceCreateFlagsKHR* = VkFlags

    VkWin32SurfaceCreateInfoKHR* = object
      sType*: VkStructureType
      pNext*: pointer
      flags*: VkWin32SurfaceCreateFlagsKHR
      hinstance*: HINSTANCE
      hwnd*: HWND

    PFN_vkCreateWin32SurfaceKHR* = proc (
      instance: VkInstance;
      pCreateInfo: ptr VkWin32SurfaceCreateInfoKHR;
      pAllocator: ptr VkAllocationCallbacks;
      pSurface: ptr VkSurfaceKHR): VkResult

    PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR* = proc (
      physicalDevice: VkPhysicalDevice;
      queueFamilyIndex: uint32): VkBool32

  proc vkCreateWin32SurfaceKHR*(
    instance: VkInstance;
    pCreateInfo: ptr VkWin32SurfaceCreateInfoKHR;
    pAllocator: ptr VkAllocationCallbacks;
    pSurface: ptr VkSurfaceKHR): VkResult
    {.cdecl, importc.}

  proc vkGetPhysicalDeviceWin32PresentationSupportKHR*(
    physicalDevice: VkPhysicalDevice;
    queueFamilyIndex: uint32): VkBool32
    {.cdecl, importc.}


const
  VK_EXT_debug_report* = 1

type
  VkDebugReportCallbackEXT* = pointer

const
  VK_EXT_DEBUG_REPORT_SPEC_VERSION* = 1
  VK_EXT_DEBUG_REPORT_EXTENSION_NAME* = "VK_EXT_debug_report"

type
  VkDebugReportObjectTypeEXT* = enum
    unknownExt = 0,
    instanceExt = 1,
    physicalDeviceExt = 2,
    deviceExt = 3,
    queueExt = 4,
    semaphoreExt = 5,
    commandBufferExt = 6,
    fenceExt = 7,
    deviceMemoryExt = 8,
    bufferExt = 9,
    imageExt = 10,
    eventExt = 11,
    queryPoolExt = 12,
    bufferViewExt = 13,
    imageViewExt = 14,
    shaderModuleExt = 15,
    pipelineCacheExt = 16,
    pipelineLayoutExt = 17,
    renderPassExt = 18,
    pipelineExt = 19,
    descriptorSetLayoutExt = 20,
    samplerExt = 21,
    descriptorPoolExt = 22,
    descriptorSetExt = 23,
    framebufferExt = 24,
    commandPoolExt = 25,
    surfaceKhrExt = 26,
    swapchainKhrExt = 27,
    debugReportExt = 28

  VkDebugReportErrorEXT* = enum
    noneExt = 0,
    callbackRefExt = 1

  VkDebugReportFlagBitsEXT* = enum
    informationBitExt = 0x00000001,
    warningBitExt = 0x00000002,
    performanceWarningBitExt = 0x00000004,
    errorBitExt = 0x00000008,
    debugBitExt = 0x00000010

  VkDebugReportFlagsEXT* = VkFlags

  PFN_vkDebugReportCallbackEXT* = proc (
    flags: VkDebugReportFlagsEXT;
    objectType: VkDebugReportObjectTypeEXT;
    obj: uint64;
    location: csize;
    messageCode: int32;
    pLayerPrefix: cstring;
    pMessage: cstring;
    pUserData: pointer): VkBool32

  VkDebugReportCallbackCreateInfoEXT* = object
    sType*: VkStructureType
    pNext*: pointer
    flags*: VkDebugReportFlagsEXT
    pfnCallback*: PFN_vkDebugReportCallbackEXT
    pUserData*: pointer

  PFN_vkCreateDebugReportCallbackEXT* = proc (
    instance: VkInstance;
    pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT;
    pAllocator: ptr VkAllocationCallbacks;
    pCallback: ptr VkDebugReportCallbackEXT): VkResult

  PFN_vkDestroyDebugReportCallbackEXT* = proc (
    instance: VkInstance;
    callback: VkDebugReportCallbackEXT;
    pAllocator: ptr VkAllocationCallbacks)

  PFN_vkDebugReportMessageEXT* = proc (
    instance: VkInstance;
    flags: VkDebugReportFlagsEXT;
    objectType: VkDebugReportObjectTypeEXT;
    obj: uint64;
    location: csize;
    messageCode: int32;
    pLayerPrefix: cstring;
    pMessage: cstring)


when not defined(VK_NO_PROTOTYPES):
  proc vkCreateDebugReportCallbackEXT*(
    instance: VkInstance;
    pCreateInfo: ptr VkDebugReportCallbackCreateInfoEXT;
    pAllocator: ptr VkAllocationCallbacks;
    pCallback: ptr VkDebugReportCallbackEXT): VkResult
    {.cdecl, importc.}

  proc vkDestroyDebugReportCallbackEXT*(
    instance: VkInstance;
    callback: VkDebugReportCallbackEXT;
    pAllocator: ptr VkAllocationCallbacks)
    {.cdecl, importc.}

  proc vkDebugReportMessageEXT*(
    instance: VkInstance;
    flags: VkDebugReportFlagsEXT;
    objectType: VkDebugReportObjectTypeEXT;
    obj: uint64;
    location: csize;
    messageCode: int32;
    pLayerPrefix: cstring;
    pMessage: cstring)
    {.cdecl, importc.}
