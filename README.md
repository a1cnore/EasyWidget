## EasyWidget

![SVersion](https://img.shields.io/badge/Swift-5.3-orange)
![License](https://img.shields.io/badge/license-GPL--3.0-red) ![Version](https://img.shields.io/badge/version-alpha-red) 
![Tests](https://img.shields.io/badge/test%20coverage-0%25-red) 
![Docs](https://img.shields.io/badge/doc-0%25-red) 

Configuring a Widget has more to do with SiriKit than with the actual Widget.
This Source is to make Widget Configuration easier.


Conform to Widgetable:

    public protocol EasyWidgetable {
      associatedtype Intent: INIntent
      associatedtype Entry: TimeLineEntryViewable
      typealias Widget = EasyWidget<Intent,Entry>
    }
 
Timeline, Snapshot and Placeholder get computed by your closure.

    struct ExampleWidget: Widget {
           Widget(identifier: "Example",
            Widget.Provider(
               { _ in
                Timeline(entries: [Entry()], policy: .never)
            }, { _ in
                Entry()
            }, { _ in
                Entry()
           })).body
        }
    }
    

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



