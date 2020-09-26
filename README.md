## EasyWidget

![License](https://img.shields.io/badge/license-GPL--3.0-red) ![Version](https://img.shields.io/badge/version-alpha-red)

Configuring a Widget has more to do with SiriKit than with the actual Widget.
This Source is to make Widget Configuration easier.


 
Here is the Smallest Widget:

    struct ExampleWidget: Widget {
        typealias widget = EasyWidget<Intent_Intent,BareEntry>
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

How to set it up:

Add the following line to ur Widget 

        typealias widget = EasyWidget<Intent,Entry>

and use widgets .body property to parse the WidgetConfiguration in ur Widget.

TODO:
-  Documentation
-  EasyIntents 
-  EasyTimeline & EasyIntentTimeline


## License
 EasyWidget  
 Copyright (C) 2020  github.com/ a1core

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details



