# EasyWidget

Configuring a Widget has more to do with SiriKit than with the actual Widget.
This Source is to make Widget Configuration easier.


 
Here is the Smallest Widget:

    struct ExampleWidget: Widget {
        typealias widget = BareBoneWidget<Intent_Intent,BareEntry>
        var body: some WidgetConfiguration {
            widget(identifier: "AWidget", widget.Provider(computeTimeline: { (config) -> Timeline<BareEntry> in
                Timeline(entries: [BareEntry()], policy: .never)
            }, computeSnapshot: { (config) -> BareEntry in
                BareEntry()
            }, computePlaceHolder: { (context) -> BareEntry in
                BareEntry()
            })).body
        }
    }
    
or even smaller, but not very useful at the Moment:


    struct MiniWidget: Widget {
        var body: some WidgetConfiguration {
            EasyWidget<Intent,Entry>().body
        }
    }

How to set it up:

Add the following line to ur Widget 

        typealias widget = BareBoneWidget<Intent,Entry>

and use widgets .body property to parse the WidgetConfiguration in ur Widget.

TODO:
- [] Documentation
- [] EasyIntents 
- [] EasyTimeline & EasyIntentTimeline




