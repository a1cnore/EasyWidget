//
//  EasyEntry.swift
//  
//
//  Created by Marvin Kleinpass on 27.09.20.
//
import SwiftUI
/*
 
 */
public class EasyEntry: TimeLineEntryViewable {
    public var date: Date
    public var view: AnyView
    
    public init(_ date: Date = Date(), _ content: AnyView) {
        self.date = date
        self.view = content
    }
}

extension EasyEntry {
    public convenience init() {
        self.init(Date(),AnyView(Text("\(Date())")))
    }
}

