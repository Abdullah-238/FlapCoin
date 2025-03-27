; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [134 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [268 x i32] [
	i32 34715100, ; 0: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 94
	i32 42639949, ; 1: System.Threading.Thread => 0x28aa24d => 125
	i32 67008169, ; 2: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 3: Microsoft.Maui.Graphics.dll => 0x44bb714 => 49
	i32 117431740, ; 4: System.Runtime.InteropServices => 0x6ffddbc => 120
	i32 165246403, ; 5: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 70
	i32 182336117, ; 6: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 89
	i32 195452805, ; 7: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 8: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 9: System.ComponentModel => 0xc38ff48 => 104
	i32 280992041, ; 10: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 293579439, ; 11: ExoPlayer.Dash.dll => 0x117faaaf => 55
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 66
	i32 336156722, ; 14: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 77
	i32 356389973, ; 16: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 17: System.Threading.Thread.dll => 0x16a510e1 => 125
	i32 385762202, ; 18: System.Memory.dll => 0x16fe439a => 112
	i32 395744057, ; 19: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 20: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 21: System.Collections => 0x1a61054f => 101
	i32 450948140, ; 22: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 76
	i32 452127346, ; 23: ExoPlayer.Database.dll => 0x1af2ea72 => 56
	i32 469710990, ; 24: System.dll => 0x1bff388e => 128
	i32 498788369, ; 25: System.ObjectModel => 0x1dbae811 => 117
	i32 500358224, ; 26: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 27: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 28: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 44
	i32 539058512, ; 29: Microsoft.Extensions.Logging => 0x20216150 => 41
	i32 592146354, ; 30: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 31: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 32: Xamarin.AndroidX.CustomView => 0x2568904f => 74
	i32 627931235, ; 33: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 663517072, ; 34: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 90
	i32 672442732, ; 35: System.Collections.Concurrent => 0x2814a96c => 98
	i32 688181140, ; 36: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 37: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 38: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 39: System.Runtime.Loader.dll => 0x2b15ed29 => 121
	i32 759451189, ; 40: MediaManager => 0x2d444e35 => 51
	i32 759454413, ; 41: System.Net.Requests => 0x2d445acd => 115
	i32 775507847, ; 42: System.IO.Compression => 0x2e394f87 => 109
	i32 777317022, ; 43: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 44: Microsoft.Extensions.Options => 0x2f0980eb => 43
	i32 812693636, ; 45: ExoPlayer.Dash => 0x3070b884 => 55
	i32 823281589, ; 46: System.Private.Uri.dll => 0x311247b5 => 118
	i32 830298997, ; 47: System.IO.Compression.Brotli => 0x317d5b75 => 108
	i32 904024072, ; 48: System.ComponentModel.Primitives.dll => 0x35e25008 => 102
	i32 915551335, ; 49: ExoPlayer.Ext.MediaSession => 0x36923467 => 61
	i32 926902833, ; 50: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 928116545, ; 51: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 94
	i32 939704684, ; 52: ExoPlayer.Extractor => 0x3802c16c => 59
	i32 967690846, ; 53: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 77
	i32 992768348, ; 54: System.Collections.dll => 0x3b2c715c => 101
	i32 1012816738, ; 55: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 88
	i32 1028013380, ; 56: ExoPlayer.UI.dll => 0x3d463d44 => 65
	i32 1028951442, ; 57: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 40
	i32 1029334545, ; 58: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 59: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 67
	i32 1044663988, ; 60: System.Linq.Expressions.dll => 0x3e444eb4 => 110
	i32 1052210849, ; 61: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 79
	i32 1082857460, ; 62: System.ComponentModel.TypeConverter => 0x408b17f4 => 103
	i32 1084122840, ; 63: Xamarin.Kotlin.StdLib => 0x409e66d8 => 95
	i32 1098259244, ; 64: System => 0x41761b2c => 128
	i32 1118262833, ; 65: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1151313727, ; 66: ExoPlayer.Rtsp => 0x449fa73f => 62
	i32 1168523401, ; 67: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 68: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 85
	i32 1203215381, ; 69: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 70: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 71: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 72: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 75
	i32 1309209905, ; 73: ExoPlayer.DataSource => 0x4e08f531 => 57
	i32 1324164729, ; 74: System.Linq => 0x4eed2679 => 111
	i32 1347751866, ; 75: Plugin.Maui.Audio => 0x50550fba => 50
	i32 1373134921, ; 76: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 77: Xamarin.AndroidX.SavedState => 0x52114ed3 => 88
	i32 1395857551, ; 78: Xamarin.AndroidX.Media.dll => 0x5333188f => 82
	i32 1406073936, ; 79: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 71
	i32 1430672901, ; 80: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 81: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 82: System.Collections.Immutable.dll => 0x5718a9ef => 99
	i32 1462112819, ; 83: System.IO.Compression.dll => 0x57261233 => 109
	i32 1469204771, ; 84: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 68
	i32 1470490898, ; 85: Microsoft.Extensions.Primitives => 0x57a5e912 => 44
	i32 1479771757, ; 86: System.Collections.Immutable => 0x5833866d => 99
	i32 1480156764, ; 87: ExoPlayer.DataSource.dll => 0x5839665c => 57
	i32 1480492111, ; 88: System.IO.Compression.Brotli.dll => 0x583e844f => 108
	i32 1493001747, ; 89: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 90: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 91: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 124
	i32 1551623176, ; 92: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 93: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 81
	i32 1624863272, ; 94: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 92
	i32 1634654947, ; 95: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 96: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 73
	i32 1639515021, ; 97: System.Net.Http.dll => 0x61b9038d => 113
	i32 1639986890, ; 98: System.Text.RegularExpressions => 0x61c036ca => 124
	i32 1657153582, ; 99: System.Runtime => 0x62c6282e => 122
	i32 1658251792, ; 100: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 93
	i32 1677501392, ; 101: System.Net.Primitives.dll => 0x63fca3d0 => 114
	i32 1679769178, ; 102: System.Security.Cryptography => 0x641f3e5a => 123
	i32 1700397376, ; 103: ExoPlayer.Transformer => 0x655a0140 => 64
	i32 1729485958, ; 104: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 69
	i32 1736233607, ; 105: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 106: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 107: System.Diagnostics.TraceSource.dll => 0x69239124 => 107
	i32 1765620304, ; 108: ExoPlayer.Core => 0x693d3a50 => 54
	i32 1766324549, ; 109: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 89
	i32 1770582343, ; 110: Microsoft.Extensions.Logging.dll => 0x6988f147 => 41
	i32 1780572499, ; 111: Mono.Android.Runtime.dll => 0x6a216153 => 132
	i32 1782862114, ; 112: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 113: Xamarin.AndroidX.Fragment => 0x6a96652d => 76
	i32 1793755602, ; 114: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 115: Xamarin.AndroidX.Loader => 0x6bcd3296 => 81
	i32 1813058853, ; 116: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 95
	i32 1813201214, ; 117: Xamarin.Google.Android.Material => 0x6c13413e => 93
	i32 1818569960, ; 118: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 86
	i32 1828688058, ; 119: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 42
	i32 1842015223, ; 120: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1850226322, ; 121: MediaManager.dll => 0x6e483692 => 51
	i32 1853025655, ; 122: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 123: System.Linq.Expressions => 0x6ec71a65 => 110
	i32 1875935024, ; 124: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 125: System.Collections.NonGeneric.dll => 0x71dc7c8b => 100
	i32 1968388702, ; 126: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 37
	i32 1984283898, ; 127: ExoPlayer.Ext.MediaSession.dll => 0x7645c4fa => 61
	i32 2003115576, ; 128: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 129: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 79
	i32 2025202353, ; 130: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 131: System.Private.Xml => 0x79eb68ee => 119
	i32 2055257422, ; 132: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 78
	i32 2066184531, ; 133: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 134: System.Diagnostics.TraceSource => 0x7b6f419e => 107
	i32 2079903147, ; 135: System.Runtime.dll => 0x7bf8cdab => 122
	i32 2090596640, ; 136: System.Numerics.Vectors => 0x7c9bf920 => 116
	i32 2106312818, ; 137: ExoPlayer.Decoder => 0x7d8bc872 => 58
	i32 2113912252, ; 138: ExoPlayer.UI => 0x7dffbdbc => 65
	i32 2127167465, ; 139: System.Console => 0x7ec9ffe9 => 105
	i32 2159891885, ; 140: Microsoft.Maui => 0x80bd55ad => 47
	i32 2169148018, ; 141: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 142: Microsoft.Extensions.Options.dll => 0x820d22b3 => 43
	i32 2192057212, ; 143: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 42
	i32 2193016926, ; 144: System.ObjectModel.dll => 0x82b6c85e => 117
	i32 2201107256, ; 145: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 96
	i32 2201231467, ; 146: System.Net.Http => 0x8334206b => 113
	i32 2202964214, ; 147: ExoPlayer.dll => 0x834e90f6 => 52
	i32 2207618523, ; 148: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2239138732, ; 149: ExoPlayer.SmoothStreaming => 0x85768bac => 63
	i32 2266799131, ; 150: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 38
	i32 2270573516, ; 151: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 152: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 87
	i32 2303942373, ; 153: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 154: System.Private.CoreLib.dll => 0x896b7878 => 130
	i32 2353062107, ; 155: System.Net.Primitives => 0x8c40e0db => 114
	i32 2368005991, ; 156: System.Xml.ReaderWriter.dll => 0x8d24e767 => 127
	i32 2371007202, ; 157: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 37
	i32 2395872292, ; 158: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 159: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 160: System.Console.dll => 0x912896e5 => 105
	i32 2471841756, ; 161: netstandard.dll => 0x93554fdc => 129
	i32 2475691224, ; 162: CoinFlip.dll => 0x93900cd8 => 97
	i32 2475788418, ; 163: Java.Interop.dll => 0x93918882 => 131
	i32 2476233210, ; 164: ExoPlayer => 0x939851fa => 52
	i32 2480646305, ; 165: Microsoft.Maui.Controls => 0x93dba8a1 => 45
	i32 2515854816, ; 166: ExoPlayer.Common => 0x95f4e5e0 => 53
	i32 2550873716, ; 167: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2593496499, ; 168: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 169: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 96
	i32 2617129537, ; 170: System.Private.Xml.dll => 0x9bfe3a41 => 119
	i32 2620871830, ; 171: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 73
	i32 2626028643, ; 172: ExoPlayer.Rtsp.dll => 0x9c860463 => 62
	i32 2626831493, ; 173: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 174: System.Runtime.Loader => 0x9ec4cf01 => 121
	i32 2713040075, ; 175: ExoPlayer.Hls => 0xa1b5b4cb => 60
	i32 2732626843, ; 176: Xamarin.AndroidX.Activity => 0xa2e0939b => 66
	i32 2737747696, ; 177: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 68
	i32 2752995522, ; 178: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 179: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 46
	i32 2764765095, ; 180: Microsoft.Maui.dll => 0xa4caf7a7 => 47
	i32 2778768386, ; 181: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 91
	i32 2785988530, ; 182: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2796087574, ; 183: ExoPlayer.Extractor.dll => 0xa6a8e916 => 59
	i32 2801831435, ; 184: Microsoft.Maui.Graphics => 0xa7008e0b => 49
	i32 2806116107, ; 185: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 186: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 71
	i32 2831556043, ; 187: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 188: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 91
	i32 2861189240, ; 189: Microsoft.Maui.Essentials => 0xaa8a4878 => 48
	i32 2868488919, ; 190: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 191: System.Private.CoreLib => 0xad6f1e8a => 130
	i32 2916838712, ; 192: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 92
	i32 2919462931, ; 193: System.Numerics.Vectors.dll => 0xae037813 => 116
	i32 2959614098, ; 194: System.ComponentModel.dll => 0xb0682092 => 104
	i32 2978675010, ; 195: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 75
	i32 3014907879, ; 196: CoinFlip => 0xb3b3d7e7 => 97
	i32 3027462113, ; 197: ExoPlayer.Common.dll => 0xb47367e1 => 53
	i32 3038032645, ; 198: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 199: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 83
	i32 3059408633, ; 200: Mono.Android.Runtime => 0xb65adef9 => 132
	i32 3059793426, ; 201: System.ComponentModel.Primitives => 0xb660be12 => 102
	i32 3077302341, ; 202: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3144327419, ; 203: ExoPlayer.Hls.dll => 0xbb6aa0fb => 60
	i32 3178803400, ; 204: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 84
	i32 3190271366, ; 205: ExoPlayer.Decoder.dll => 0xbe27ad86 => 58
	i32 3220365878, ; 206: System.Threading => 0xbff2e236 => 126
	i32 3258312781, ; 207: Xamarin.AndroidX.CardView => 0xc235e84d => 69
	i32 3305363605, ; 208: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 209: System.Net.Requests.dll => 0xc5b097e4 => 115
	i32 3317135071, ; 210: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 74
	i32 3329734229, ; 211: ExoPlayer.Database => 0xc677b655 => 56
	i32 3346324047, ; 212: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 85
	i32 3357674450, ; 213: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 214: Xamarin.AndroidX.Core => 0xc86c06e3 => 72
	i32 3366347497, ; 215: Java.Interop => 0xc8a662e9 => 131
	i32 3374999561, ; 216: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 87
	i32 3381016424, ; 217: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3396979385, ; 218: ExoPlayer.Transformer.dll => 0xca79cab9 => 64
	i32 3428513518, ; 219: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 39
	i32 3430777524, ; 220: netstandard => 0xcc7d82b4 => 129
	i32 3463511458, ; 221: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 222: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 103
	i32 3476120550, ; 223: Mono.Android => 0xcf3163e6 => 133
	i32 3479583265, ; 224: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 225: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3580758918, ; 226: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 227: System.Linq.dll => 0xd715a361 => 111
	i32 3641597786, ; 228: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 78
	i32 3643446276, ; 229: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 230: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 84
	i32 3657292374, ; 231: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 38
	i32 3660726404, ; 232: Plugin.Maui.Audio.dll => 0xda324084 => 50
	i32 3672681054, ; 233: Mono.Android.dll => 0xdae8aa5e => 133
	i32 3697841164, ; 234: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 235: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 83
	i32 3748608112, ; 236: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 106
	i32 3786282454, ; 237: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 70
	i32 3792276235, ; 238: System.Collections.NonGeneric => 0xe2098b0b => 100
	i32 3817368567, ; 239: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3822602673, ; 240: Xamarin.AndroidX.Media => 0xe3d849b1 => 82
	i32 3823082795, ; 241: System.Security.Cryptography.dll => 0xe3df9d2b => 123
	i32 3841636137, ; 242: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 40
	i32 3849253459, ; 243: System.Runtime.InteropServices.dll => 0xe56ef253 => 120
	i32 3889960447, ; 244: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 245: System.Collections.Concurrent.dll => 0xe839deed => 98
	i32 3896760992, ; 246: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 72
	i32 3921031405, ; 247: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 90
	i32 3928044579, ; 248: System.Xml.ReaderWriter => 0xea213423 => 127
	i32 3931092270, ; 249: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 86
	i32 3955647286, ; 250: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 67
	i32 3980434154, ; 251: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 252: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 253: System.Memory => 0xeff49a63 => 112
	i32 4046471985, ; 254: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 46
	i32 4073602200, ; 255: System.Threading.dll => 0xf2ce3c98 => 126
	i32 4094352644, ; 256: Microsoft.Maui.Essentials.dll => 0xf40add04 => 48
	i32 4100113165, ; 257: System.Private.Uri => 0xf462c30d => 118
	i32 4102112229, ; 258: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 259: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 260: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 39
	i32 4150914736, ; 261: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4173364138, ; 262: ExoPlayer.SmoothStreaming.dll => 0xf8c07baa => 63
	i32 4182413190, ; 263: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 80
	i32 4190597220, ; 264: ExoPlayer.Core.dll => 0xf9c77064 => 54
	i32 4213026141, ; 265: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 106
	i32 4271975918, ; 266: Microsoft.Maui.Controls.dll => 0xfea12dee => 45
	i32 4292120959 ; 267: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 80
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [268 x i32] [
	i32 94, ; 0
	i32 125, ; 1
	i32 33, ; 2
	i32 49, ; 3
	i32 120, ; 4
	i32 70, ; 5
	i32 89, ; 6
	i32 30, ; 7
	i32 31, ; 8
	i32 104, ; 9
	i32 2, ; 10
	i32 55, ; 11
	i32 30, ; 12
	i32 66, ; 13
	i32 15, ; 14
	i32 77, ; 15
	i32 14, ; 16
	i32 125, ; 17
	i32 112, ; 18
	i32 34, ; 19
	i32 26, ; 20
	i32 101, ; 21
	i32 76, ; 22
	i32 56, ; 23
	i32 128, ; 24
	i32 117, ; 25
	i32 13, ; 26
	i32 7, ; 27
	i32 44, ; 28
	i32 41, ; 29
	i32 21, ; 30
	i32 35, ; 31
	i32 74, ; 32
	i32 19, ; 33
	i32 90, ; 34
	i32 98, ; 35
	i32 1, ; 36
	i32 16, ; 37
	i32 4, ; 38
	i32 121, ; 39
	i32 51, ; 40
	i32 115, ; 41
	i32 109, ; 42
	i32 25, ; 43
	i32 43, ; 44
	i32 55, ; 45
	i32 118, ; 46
	i32 108, ; 47
	i32 102, ; 48
	i32 61, ; 49
	i32 28, ; 50
	i32 94, ; 51
	i32 59, ; 52
	i32 77, ; 53
	i32 101, ; 54
	i32 88, ; 55
	i32 65, ; 56
	i32 40, ; 57
	i32 3, ; 58
	i32 67, ; 59
	i32 110, ; 60
	i32 79, ; 61
	i32 103, ; 62
	i32 95, ; 63
	i32 128, ; 64
	i32 16, ; 65
	i32 62, ; 66
	i32 22, ; 67
	i32 85, ; 68
	i32 20, ; 69
	i32 18, ; 70
	i32 2, ; 71
	i32 75, ; 72
	i32 57, ; 73
	i32 111, ; 74
	i32 50, ; 75
	i32 32, ; 76
	i32 88, ; 77
	i32 82, ; 78
	i32 71, ; 79
	i32 0, ; 80
	i32 6, ; 81
	i32 99, ; 82
	i32 109, ; 83
	i32 68, ; 84
	i32 44, ; 85
	i32 99, ; 86
	i32 57, ; 87
	i32 108, ; 88
	i32 10, ; 89
	i32 5, ; 90
	i32 124, ; 91
	i32 25, ; 92
	i32 81, ; 93
	i32 92, ; 94
	i32 36, ; 95
	i32 73, ; 96
	i32 113, ; 97
	i32 124, ; 98
	i32 122, ; 99
	i32 93, ; 100
	i32 114, ; 101
	i32 123, ; 102
	i32 64, ; 103
	i32 69, ; 104
	i32 23, ; 105
	i32 1, ; 106
	i32 107, ; 107
	i32 54, ; 108
	i32 89, ; 109
	i32 41, ; 110
	i32 132, ; 111
	i32 17, ; 112
	i32 76, ; 113
	i32 9, ; 114
	i32 81, ; 115
	i32 95, ; 116
	i32 93, ; 117
	i32 86, ; 118
	i32 42, ; 119
	i32 29, ; 120
	i32 51, ; 121
	i32 26, ; 122
	i32 110, ; 123
	i32 8, ; 124
	i32 100, ; 125
	i32 37, ; 126
	i32 61, ; 127
	i32 5, ; 128
	i32 79, ; 129
	i32 0, ; 130
	i32 119, ; 131
	i32 78, ; 132
	i32 4, ; 133
	i32 107, ; 134
	i32 122, ; 135
	i32 116, ; 136
	i32 58, ; 137
	i32 65, ; 138
	i32 105, ; 139
	i32 47, ; 140
	i32 12, ; 141
	i32 43, ; 142
	i32 42, ; 143
	i32 117, ; 144
	i32 96, ; 145
	i32 113, ; 146
	i32 52, ; 147
	i32 14, ; 148
	i32 63, ; 149
	i32 38, ; 150
	i32 8, ; 151
	i32 87, ; 152
	i32 18, ; 153
	i32 130, ; 154
	i32 114, ; 155
	i32 127, ; 156
	i32 37, ; 157
	i32 13, ; 158
	i32 10, ; 159
	i32 105, ; 160
	i32 129, ; 161
	i32 97, ; 162
	i32 131, ; 163
	i32 52, ; 164
	i32 45, ; 165
	i32 53, ; 166
	i32 11, ; 167
	i32 20, ; 168
	i32 96, ; 169
	i32 119, ; 170
	i32 73, ; 171
	i32 62, ; 172
	i32 15, ; 173
	i32 121, ; 174
	i32 60, ; 175
	i32 66, ; 176
	i32 68, ; 177
	i32 21, ; 178
	i32 46, ; 179
	i32 47, ; 180
	i32 91, ; 181
	i32 27, ; 182
	i32 59, ; 183
	i32 49, ; 184
	i32 6, ; 185
	i32 71, ; 186
	i32 19, ; 187
	i32 91, ; 188
	i32 48, ; 189
	i32 36, ; 190
	i32 130, ; 191
	i32 92, ; 192
	i32 116, ; 193
	i32 104, ; 194
	i32 75, ; 195
	i32 97, ; 196
	i32 53, ; 197
	i32 34, ; 198
	i32 83, ; 199
	i32 132, ; 200
	i32 102, ; 201
	i32 12, ; 202
	i32 60, ; 203
	i32 84, ; 204
	i32 58, ; 205
	i32 126, ; 206
	i32 69, ; 207
	i32 7, ; 208
	i32 115, ; 209
	i32 74, ; 210
	i32 56, ; 211
	i32 85, ; 212
	i32 24, ; 213
	i32 72, ; 214
	i32 131, ; 215
	i32 87, ; 216
	i32 3, ; 217
	i32 64, ; 218
	i32 39, ; 219
	i32 129, ; 220
	i32 11, ; 221
	i32 103, ; 222
	i32 133, ; 223
	i32 24, ; 224
	i32 23, ; 225
	i32 31, ; 226
	i32 111, ; 227
	i32 78, ; 228
	i32 28, ; 229
	i32 84, ; 230
	i32 38, ; 231
	i32 50, ; 232
	i32 133, ; 233
	i32 33, ; 234
	i32 83, ; 235
	i32 106, ; 236
	i32 70, ; 237
	i32 100, ; 238
	i32 35, ; 239
	i32 82, ; 240
	i32 123, ; 241
	i32 40, ; 242
	i32 120, ; 243
	i32 32, ; 244
	i32 98, ; 245
	i32 72, ; 246
	i32 90, ; 247
	i32 127, ; 248
	i32 86, ; 249
	i32 67, ; 250
	i32 27, ; 251
	i32 9, ; 252
	i32 112, ; 253
	i32 46, ; 254
	i32 126, ; 255
	i32 48, ; 256
	i32 118, ; 257
	i32 22, ; 258
	i32 17, ; 259
	i32 39, ; 260
	i32 29, ; 261
	i32 63, ; 262
	i32 80, ; 263
	i32 54, ; 264
	i32 106, ; 265
	i32 45, ; 266
	i32 80 ; 267
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
