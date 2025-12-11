//
//  Push.swift
//  Push2
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

/// Delivery enum
public enum Delivery: String, Sendable {
    case normal
    case silent
}

/// Platform enum
public enum Platform: Sendable {
    case iOS
    case macOS
    case tvOS
    case watchOS
    case visionOS
    case safari
    case android
    case web
    case custom(String)
}

/// push notification recipient
public struct Recipient: Sendable {
    /// device token
    public let token: String
    /// device platform
    public let platform: Platform

    /// init push notification recipient
    public init(
        token: String,
        platform: Platform
    ) {
        self.token = token
        self.platform = platform
    }
}

/// push notification
public struct Notification: Sendable {
    /// title
    public let title: String
    /// body
    public let body: String
    /// userInfo
    public let userInfo: [String: String]
    /// delivery
    public let delivery: Delivery

    /// init push notification
    public init(
        title: String,
        body: String,
        userInfo: [String: String] = [:],
        delivery: Delivery = .normal
    ) {
        self.title = title
        self.body = body
        self.userInfo = userInfo
        self.delivery = delivery
    }
}
