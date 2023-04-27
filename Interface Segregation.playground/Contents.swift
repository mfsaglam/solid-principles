import Foundation

class Document {
    
}

protocol Machine {
    func print(doc: Document)
    func scan(doc: Document)
    func fax(doc: Document)
}

class MFP: Machine {
    func print(doc: Document) {
        //ok
    }
    
    func scan(doc: Document) {
        //ok
    }
    
    func fax(doc: Document) {
        //ok
    }
}

enum NoRequiredFunctionality: Error {
    case doesNotScan
    case doesNotFax
}

class OldFashionaedPrinter: Printer {
    func print(doc: Document) {
        //ok
    }
    
    func scan(doc: Document) throws {
        throw NoRequiredFunctionality.doesNotScan
    }
    
    func fax(doc: Document) throws {
        throw NoRequiredFunctionality.doesNotFax
    }
}

protocol Printer {
    func print(doc: Document)
}

protocol Scanner {
    func scan(doc: Document)
}

protocol Fax {
    func fax(doc: Document)
}

class OrdinaryPrinter: Printer {
    func print(doc: Document) {
        //ok
    }
}

class Photocopier: Printer, Scanner {
    func print(doc: Document) {
        //
    }
    
    func scan(doc: Document) {
        //
    }
    
    
}

protocol MultiFunctionDevice: Printer, Scanner, Fax { }

class MultiFunctionMachine: MultiFunctionDevice {
    let printer: Printer
    let scanner: Scanner
    
    init(printer: Printer, scanner: Scanner) {
        self.printer = printer
        self.scanner = scanner
    }
    
    func print(doc: Document) {
        printer.print(doc: doc) // decorator
    }
    
    func scan(doc: Document) {
        scanner.scan(doc: doc)
    }
    
    func fax(doc: Document) {
        //
    }
}
