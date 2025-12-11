//
//  PushComponent.swift
//  Push2
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import FeatherComponent

/// the push component protocol
public protocol PushComponent: Component {

    /// send a push notification to a given recipients
    func send(notification: Notification, to: [Recipient]) async throws
}
