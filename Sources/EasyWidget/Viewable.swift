//
//  Viewable.swift
//  
//
//  Created by Marvin Kleinpass on 26.09.20.
//

import SwiftUI

public protocol Viewable {
    var view: AnyView { get }
}
extension Viewable {
    var view: AnyView {
        AnyView(erasing: Text(""))
    }
}
