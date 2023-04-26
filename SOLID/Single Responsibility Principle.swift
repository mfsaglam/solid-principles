//
//  Single Responsibility Principle.swift
//  SOLID
//
//  Created by Fatih Sağlam on 26.04.2023.
//

import Foundation

class Journal {
    var entries = [String]()
    var count = 0
    
    func addEntry(_ text: String) -> Int {
        count += 1
        entries.append("\(count) : \(text)")
        return count - 1
    }
    
    func removeEntry(_ index: Int) {
        entries.remove(at: index)
    }
}
