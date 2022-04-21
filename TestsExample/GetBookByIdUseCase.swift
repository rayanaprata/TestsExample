import Foundation

protocol GetBookByIdUseCasing {
    func execute(id: Int) -> String
}

class GetBookByIdUseCase: GetBookByIdUseCasing {
    
    private let servicing: GetBookServicing
    
    init(servicing: GetBookServicing) {
        self.servicing = servicing
    }
    
    func execute(id: Int) -> String {
        let books = getBooks()
        if id >= books.count {
            return "Livro não encontrado."
        }
        return books[id]
    }
    
    private func getBooks() -> [String] {
        return servicing.getBooks()
    }
    
}

protocol GetBookServicing {
    func getBooks() -> [String]
}

class GetBookService: GetBookServicing {
    
    func getBooks() -> [String] {
        ["Harry Potter", "O Cemitério", "Jantar Secreto"]
    }
    
}
