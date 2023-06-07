//
//  Test.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 7/6/23.
//

import Foundation

func printCacheUsage() {
    let currentMemoryUsage = URLCache.shared.currentMemoryUsage
    let currentDiskUsage = URLCache.shared.currentDiskUsage
    print("Uso actual de la memoria: \(currentMemoryUsage)")
    print("Uso actual del disco: \(currentDiskUsage)")
}
