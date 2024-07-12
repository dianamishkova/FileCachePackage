//
//  FileCache.swift
//  ToDoList
//
//  Created by Диана Мишкова on 18.06.24.
//

import Foundation

public class FileCachePackage<T: JSONProtocol & CSVProtocol> {
    public func save(items: [T], to fileName: String) throws {
        let jsonObject = items.map { $0.json }
        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
        let url = getFileURL(fileName: fileName)
        try jsonData.write(to: url)
        
    }
    
    public func load(fromJSON fileName: String) throws -> [T] {
        let url = getFileURL(fileName: fileName)
        let jsonData = try Data(contentsOf: url)
        guard let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [Any] else { return [] }
        return jsonObject.compactMap { T.parse(json: $0) }
    }
    
    public func load(fromCSV fileName: String) throws -> [T] {
        let url = getFileURL(fileName: fileName)
        let csvString = try String(contentsOf: url)
        let rows = csvString.components(separatedBy: "\n").dropFirst()
        return rows.compactMap { T.parse(csv: $0) }
        
    }
    
    private func getFileURL(fileName: String) -> URL {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0].appendingPathComponent(fileName)
    }
    
}
