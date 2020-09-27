//
//  File.swift
//  
//
//  Created by Marvin Kleinpass on 27.09.20.
//

import Intents

protocol EasyWidgetable {
    associatedtype Intent: INIntent
    associatedtype Entry: TimeLineEntryViewable
    typealias Widget = EasyWidget<Intent,Entry>
}

