//
//  CSVProtocol.swift
//  ToDoList
//
//  Created by Диана Мишкова on 12.07.24.
//

import Foundation

protocol CSVProtocol {
    static func parse(csv: String) -> Self?
}
