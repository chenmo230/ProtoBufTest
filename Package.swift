import PackageDescription

let package = Package(
    name: "ProtoBufDemo5",
    dependencies: [
        .Package(url: "https://github.com/apple/swift-protobuf.git", Version(0,9,26))
    ]
)
