import Intents
import SwiftUI
import WidgetKit

public typealias TimeLineEntryViewable = TimelineEntry & Viewable

public struct EasyWidget<Intent,Entry>: Widget where Intent: INIntent, Entry: TimeLineEntryViewable {
    public typealias Provider = _Provider<Intent,Entry>
    public typealias EntryView = EasyEntryView<Entry>
    
    var provider: Provider
    var identifier: String
    public init(identifier: String,_ provider: Provider) {
        self.provider = provider
        self.identifier = identifier
    }
    
    // used for advanced setup later
//    public init<T: TimeLineEntryViewable>(identifier: String, entryType: T, provider: Provider) {
//        self.identifier = identifier
//        self.provider = provider
//    }
    
    public init() {
        self.identifier = "BareBoneWidget"
        self.provider = Provider(computeTimeline: { (tuple) -> Timeline<Entry> in
            Timeline(entries: [], policy: .never)
        }, computeSnapshot: { (tuple) -> Entry in
            EntryView(entry: nil) as! Entry
        }, computePlaceHolder: { (context) -> Entry in
            EntryView(entry: nil) as! Entry
        })
    }
    
    
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: identifier, intent: Intent.self, provider: provider) { entry in
            EntryView(entry: entry)
        }
    }
}



