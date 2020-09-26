import Intents
import SwiftUI
import WidgetKit

public struct EasyWidget<Intent,Entry>: Widget where Intent: INIntent, Entry: TimelineEntry & Viewable {
    public init() {
        self.identifier = "BareBoneWidget"
        self.provider = Provider(computeTimeline: { (tuple) -> Timeline<Entry> in
            Timeline(entries: [], policy: .never)
        }, computeSnapshot: { (tuple) -> Entry in
            EasyEntryView<Entry>(entry: nil) as! Entry
        }, computePlaceHolder: { (context) -> Entry in
            EasyEntryView<Entry>(entry: nil) as! Entry
        })
    }
    
    public typealias Provider = _Provider<Intent,Entry>
    
    var provider: Provider
    var identifier: String
    public init(identifier: String,_ provider: Provider) {
        self.provider = provider
        self.identifier = identifier
    }
    
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: identifier, intent: Intent.self, provider: provider) { entry in
            EasyEntryView<Entry>(entry: entry)
        }
    }
    
   
    public struct EasyEntryView<Entry: TimelineEntry & Viewable> : View {
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

