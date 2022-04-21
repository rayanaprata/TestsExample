@testable import TestsExample
import XCTest

class GetBookByIdUseCaseTests: XCTestCase {

    private let serviceSpy = GetBookServiceSpy()
    private lazy var sut = GetBookByIdUseCase(servicing: serviceSpy)
    
    func test_execute_withId_shouldReturnCorrectBook() {
        serviceSpy.getBooksToBeReturned = ["Jantar Secreto"]
        let book = sut.execute(id: 0)
        XCTAssertEqual(book, "Jantar Secreto")
        XCTAssertEqual(serviceSpy.getBooksCallCount, 1)
    }

    func test_execute_withInvalidId_shouldReturnErrorMessage() {
        serviceSpy.getBooksToBeReturned = ["Jantar Secreto", "Jantar Secreto", "Jantar Secreto", "Jantar Secreto"]
        let book = sut.execute(id: 4)
        XCTAssertEqual(book, "Livro não encontrado.")
        XCTAssertEqual(serviceSpy.getBooksCallCount, 1)
    }
    
    func test_execute_withEmptyArray_shouldReturnErrorMessage() {
        serviceSpy.getBooksToBeReturned = []
        let book = sut.execute(id: 4)
        XCTAssertEqual(book, "Livro não encontrado.")
        XCTAssertEqual(serviceSpy.getBooksCallCount, 1)
    }
    
    func test_execute_callServiceOnce() {
        sut.execute(id: 0)
        XCTAssertEqual(serviceSpy.getBooksCallCount, 1)
    }
    
}
