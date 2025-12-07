//
//  PushTestSuite.swift
//  XCTFeatherPush
//
//  Created by Tibor Bodecs on 17/11/2023.
//

import Foundation
import FeatherPush

/// push test suit error
public struct PushTestSuiteError: Error {

    /// function
    public let function: String
    /// line
    public let line: Int
    /// error
    public let error: Error?

    init(
        function: String = #function,
        line: Int = #line,
        error: Error? = nil
    ) {
        self.function = function
        self.line = line
        self.error = error
    }
}

/// push test suite
public struct PushTestSuite: Sendable {

    let push: PushComponent

    /// push test suite init
    public init(_ push: PushComponent) {
        self.push = push
    }

    /// test all push sending
    public func testAll(
        from: String,
        to: String
    ) async throws {
        async let tests: [Void] = [
            testPlainText(from: from, to: to)
        ]
        do {
            _ = try await tests
        }
        catch let error as PushTestSuiteError {
            throw error
        }
        catch {
            throw PushTestSuiteError(error: error)
        }
    }
}

public extension PushTestSuite {

    func getAttachmentUrl() -> URL? {
        Bundle.module.url(forResource: "feather", withExtension: "png")
    }

    // MARK: - tests

    func testPlainText(
        from: String,
        to: String
    ) async throws {

    }

}
