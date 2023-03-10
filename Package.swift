// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "FirebaseDependency",
	platforms: [.iOS(.v15), .macOS(.v13)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to
		// other packages.
		.library(
			name: "FirebaseAnalyticsDependency",
			targets: ["FirebaseAnalyticsDependency"]
		),
		.library(
			name: "FirebaseAnalyticsDependencyLive",
			targets: ["FirebaseAnalyticsDependencyLive"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.4.0"),
		.package(url: "https://github.com/pointfreeco/swift-dependencies", from: "0.1.4"),
	],
	targets: [
		// Targets are the basic building blocks of a package. A target can define a module or a test
		// suite.
		// Targets can depend on other targets in this package, and on products in packages this package
		// depends on.
		.target(
			name: "FirebaseAnalyticsDependency",
			dependencies: [
				.product(name: "Dependencies", package: "swift-dependencies"),
			]
		),
		.target(
			name: "FirebaseAnalyticsDependencyLive",
			dependencies: [
				"FirebaseAnalyticsDependency",
				.product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
			]
		),
		.testTarget(
			name: "FirebaseAnalyticsDependencyTests",
			dependencies: ["FirebaseAnalyticsDependencyLive"]
		),
	]
)
