//
//  CSVProtocol.swift
//  ToDoList
//
//  Created by Диана Мишкова on 12.07.24.
//

import Foundation

public protocol CSVProtocol {
    static func parse(csv: String) -> Self?
}
