//
//  NSObject.swift
//  
//
//  Created by Majid Boudaoud on 18/04/2020.
//

import Foundation

public extension NSObject {
    class var className: String {
        return String(describing: self.classForCoder())
    }
}
