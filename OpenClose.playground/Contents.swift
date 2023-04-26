import Cocoa

enum Color {
    case red
    case green
    case blue
}

enum Size {
    case small
    case medium
    case large
}

class Product {
    var name: String
    var color: Color
    var size: Size
    
    init(_ name: String, _ color: Color, _ size: Size) {
        self.name = name
        self.color = color
        self.size = size
    }
}

class ProductFilter {
    func filterByColor(products: [Product], color: Color) -> [Product] {
        var result = [Product]()
        
        for p in products {
            if p.color == color {
                result.append(p)
            }
        }
        
        return result
    }
    
    func filterBySize(products: [Product], size: Size) -> [Product] {
        var result = [Product]()
        
        for p in products {
            if p.size == size {
                result.append(p)
            }
        }
        
        return result
    }
}

//Specification

protocol Specification {
    associatedtype T
    func isSatisfied(_ item: T) -> Bool
}

protocol Filter {
    associatedtype T
    func filter<Spec: Specification>(_ items: [T], spec: Spec) -> [T]
        where Spec.T == T;
}

func main() {
    let apple = Product("apple", .green, .small)
    let tree = Product("tree", .green, .large)
    let house = Product("house", .blue, .large)
    
    let products = [apple, tree, house]
    
    let pf = ProductFilter()
    
    print("Green products(old):")
    
    for p in pf.filterByColor(products: products, color: .green) {
        print("- \(p.name) is green.")
    }
}

main()
