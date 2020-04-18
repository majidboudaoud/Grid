//
//  File.swift
//  
//
//  Created by Majid Boudaoud on 18/04/2020.
//

import UIKit

public extension IndexPath {
    static func fromRow(_ row: Int, section: Int) -> IndexPath {
        return IndexPath(row: row, section: section)
    }
}
