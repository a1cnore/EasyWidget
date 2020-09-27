//
//  Provider.swift
//  
//
//  Created by Marvin Kleinpass on 26.09.20.
//

import Intents
import WidgetKit

public struct _Provider<_Intent:INIntent,_Entry> where _Entry: TimelineEntry {
    var computeTimeline:    computeTimeline
    var computeSnapshot:    computeSnapshot
    var computePlaceHolder: computePlaceHolder
}

extension _Provider {
    
    /// Public Init
    /// - Parameters:
    ///   - timeline: Suitable for basic Setup of the Timeline component
    ///   - snapshot: Snapshot to display, for more information see Apples Docs
    ///   - placeholder: How the Widget looks when not loaded.
    public init(_ timeline: @escaping computeTimeline, _ snapshot: @escaping computeSnapshot ,_ placeholder: @escaping computePlaceHolder) {
        self.computeTimeline    = timeline
        self.computeSnapshot    = snapshot
        self.computePlaceHolder = placeholder
    }
}


extension _Provider: IntentTimelineProvider {
    public typealias Entry                  = _Entry
    public typealias Intent                 = _Intent
    public typealias ConfigurationContext   = (configuration: _Intent, context: Context)
    public typealias ComputedTimeline       = (Timeline<_Entry>) -> Void
    public typealias ComputedSnapshot       = (_Entry) -> Void
    public typealias computeTimeline        = (ConfigurationContext) -> Timeline<_Entry>
    public typealias computeSnapshot        = (ConfigurationContext) -> _Entry
    public typealias computePlaceHolder     = (Context) -> _Entry
    
    public func placeholder(in context: Context) -> _Entry {
        self.computePlaceHolder(context)
    }
    
    public func getSnapshot(for configuration: _Intent, in context: Context, completion: @escaping ComputedSnapshot) {
        completion(self.computeSnapshot((configuration,context)))
    }
    
    public func getTimeline(for configuration: _Intent, in context: Context, completion: @escaping ComputedTimeline) {
        completion(self.computeTimeline((configuration,context)))
    }
}

