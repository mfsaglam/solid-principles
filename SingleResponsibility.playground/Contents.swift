import Foundation

class Journal: CustomStringConvertible {
    var entries = [String]()
    var count: Int {
        entries.count
    }
    
    func addEntry(_ text: String) -> Int {
        entries.append("\(count) : \(text)")
        return count - 1
    }
    
    func removeEntry(_ index: Int) {
        entries.remove(at: index)
    }
    
    var description: String {
        entries.joined(separator: "\n")
    }
    
    
}

class Persistence {
    func saveToFile(journal: Journal, filename: String, overwrrite: Bool = false) {
        //saving logic
        print("\(journal.count) entry saved to file \(filename)")
    }
    
    func load(_ filename: String) { }
    func load(_ url: URL) { }
}

func main() {
    let j = Journal()
    let _ = j.addEntry("I cried today")
    let bug = j.addEntry("I ate a bug")
    print(j)
    
    j.removeEntry(bug)
    print("===")
    print(j)
    
    let p = Persistence()
    let filename = "/kh/jg/jhgjg"
    p.saveToFile(journal: j, filename: filename)
}

main()
