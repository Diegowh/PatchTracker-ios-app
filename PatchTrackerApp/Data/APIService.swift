//
//  APIService.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import Foundation

let localhostEpisodesURL = "http://127.0.0.1:8000/ValorantPatchTracker/episodes/"
let localhostPatchNotesURL = "http://127.0.0.1:8000/ValorantPatchTracker/patchnotes/"
let localhostContentsURL = "http://127.0.0.1:8000/ValorantPatchTracker/contents/"

class APIService {
    static let shared = APIService()
    
    init() {
        let memoryCapacity = 500 * 1024 * 1024 // 500 MB
        let diskCapacity = 500 * 1024 * 1024 // 500 MB
        let urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: nil)
        URLCache.shared = urlCache
    }
    
    func fetchEpisodes(completion: @escaping ([Episode]) -> Void) {
        printCacheUsage()
        
        guard let url = URL(string: localhostEpisodesURL) else {
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let episodes = try JSONDecoder().decode([Episode].self, from: data)
                    DispatchQueue.main.async {
                        completion(episodes)
                        printCacheUsage()
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }

    func fetchPatchNotes(completion: @escaping ([PatchNote]) -> Void) {
        guard let url = URL(string: localhostPatchNotesURL) else {
            return
        }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let patchNotes = try JSONDecoder().decode([PatchNote].self, from: data)
                    DispatchQueue.main.async {
                        completion(patchNotes)
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
    func fetchContent(for patchNote: PatchNote, completion: @escaping (Content) -> Void) {
        printCacheUsage()
        let url = URL(string: "\(localhostContentsURL)?patch_note=\(patchNote.id)")
        
        guard let unwrappedUrl = url else {
            return
        }
        let request = URLRequest(url: unwrappedUrl, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let contents = try JSONDecoder().decode([Content].self, from: data)
                    if let content = contents.first {
                        DispatchQueue.main.async {
                            completion(content)
                            printCacheUsage()
                        }
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}

