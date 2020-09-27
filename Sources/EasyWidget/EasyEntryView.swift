//
//  EasyEntryView.swift
//  
//
//  Created by Marvin Kleinpass on 27.09.20.
//

import SwiftUI

/*
 
 */
public struct EasyEntryView<Entry: TimeLineEntryViewable> : View {
    var entry: Entry?
    @ViewBuilder
    public var body: some View {
        if entry == nil {
            Text("\(Date())")
        } else {
            entry!.view.padding()
        }
    }
}
