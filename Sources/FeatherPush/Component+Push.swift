//
//  Component+Push.swift
//  Feather-push
//
//  Created by Tibor Bodecs on 2024. 04. 10..
//

import FeatherComponent
import Logging

/// ComponentID
public enum PushComponentID: ComponentID {

    /// default push component identifier
    case `default`

    /// custom push component identifier
    case custom(String)

    ///  rawId
    public var rawId: String {
        switch self {
        case .default:
            return "push-component-id"
        case .custom(let value):
            return "\(value)-push-component-id"
        }
    }
}

public extension ComponentRegistry {

    /// add a new push component using a context
    func addPush(
        _ context: ComponentContext,
        id: PushComponentID = .default
    ) async throws {
        try await add(context, id: id)
    }

    /// returns a push component by a given id
    func push(
        _ id: PushComponentID = .default,
        logger: Logger? = nil
    ) throws -> PushComponent {
        guard let push = try get(id, logger: logger) as? PushComponent else {
            fatalError(
                "Push component not found, call `addPush()` to register."
            )
        }
        return push
    }
}
