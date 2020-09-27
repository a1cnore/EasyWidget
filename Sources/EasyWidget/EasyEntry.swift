//
//  EasyEntry.swift
//  
//
//  Created by Marvin Kleinpass on 27.09.20.
//
import SwiftUI
/*
 
 */
public struct EasyEntry: TimeLineEntryViewable {
    public var date: Date
    public var view: AnyView
}

extension EasyEntry {
    
    public init() {
        self.date = Date()
        self.view = AnyView(Text("\(Date())"))
    }
    
    public init(_ date: Date = Date(), _ content: AnyView) {
        self.date = date
        self.view = content
    }
}

