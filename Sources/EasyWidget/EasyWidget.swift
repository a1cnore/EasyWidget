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
    public struct EasyEntry: TimeLineEntryViewable {
        public var date: Date
        public var view: AnyView
        init() {
            self.date = Date()
            self.view = AnyView(Text("\(Date())"))
        }
    }
   
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
}

