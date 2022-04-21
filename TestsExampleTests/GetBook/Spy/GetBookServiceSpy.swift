import Foundation
@testable import TestsExample

class GetBookServiceSpy: GetBookServicing {
    
    private(set) var getBooksCallCount: Int = 0
    var getBooksToBeReturned: [String] = []
    
    func getBooks() -> [String] {
        getBooksCallCount += 1
        return getBooksToBeReturned
    }
    
}
