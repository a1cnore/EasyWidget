//
//  EasyEntry.swift
//  
//
//  Created by Marvin Kleinpass on 27.09.20.
//
import SwiftUI
/*
 
 */
public struct EasyEntry<T>: TimeLineEntryViewable {
    public var date: Date
    public var view: AnyView
    public var data: T?
    
    public init(_ date: Date = Date(), _ content: AnyView, data: T?) {
        self.date = date
        self.view = content
        self.data = data
    }
     
    public init() {
        self.init(Date(),AnyView(Text("\(Date())")), data: nil)
    }
    
    public init(_ text: String) {
        self.init(Date(),AnyView(Text(text)), data: nil)
    }
}


