//
//  WidgetConfigurationRepository.swift
//  
//
//  Created by Marvin Kleinpass on 27.09.20.
//
import Intents
/*
 
 */
public protocol WidgetConfigurationRepository {
    associatedtype Intent
    associatedtype Entry
    static var  widgets: [Entry] { get }
    static func fetch_build(_ widgetConfiguration: Intent)->Entry
}
