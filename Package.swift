// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "SimpleServiceRegistry",
    products: [
        .library(name: "SimpleServiceRegistry", targets: ["SimpleServiceRegistry"]),
    ],
    targets: [
        .target(name: "SimpleServiceRegistry", path: "SimpleServiceRegistry/Classes"),
    ]
)
