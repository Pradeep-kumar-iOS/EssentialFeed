//
//  XCTestCase+MemoryLeaksTracker.swift
//  EssentialFeedTests
//
//  Created by AB020QU on 2022/10/28.
//

import XCTest

extension XCTestCase {
    
    public func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance has not been deallocated. Potential memory leak.")
        }
    }
}
