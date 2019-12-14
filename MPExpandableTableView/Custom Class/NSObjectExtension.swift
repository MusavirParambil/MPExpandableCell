//
//  NSObjectExtension.swift
//  WildTrails4
//
//  Created by Rajesh Vishwakarma on 15/02/18.
//  Copyright © 2018 WildTrails. All rights reserved.
//
import Foundation

extension NSObject {
    
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
