//
//  APIService.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    // Valorant
    var episodesURL: String?
    var patchNotesURL: String?
    var contentsURL: String?
    
    // LoL
    var seasonsURL: String?
    var patchesURL: String?
    var notesURL: String?
    
    init() {
        let memoryCapacity = 500 * 1024 * 1024 // 500 MB
        let diskCapacity = 500 * 1024 * 1024 // 500 MB
        let urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: nil)
        URLCache.shared = urlCache
        
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            // Valorant API
            episodesURL = dict["EpisodesURL"] as? String
            patchNotesURL = dict["PatchNotesURL"] as? String
            contentsURL = dict["ContentsURL"] as? String
            
            // LoL API
            seasonsURL = dict["SeasonsURL"] as? String
            patchesURL = dict["PatchesURL"] as? String
            notesURL = dict["NotesURL"] as? String
        }
    }
    
    func fetchEpisodes(completion: @escaping ([Episode]) -> Void) {
        guard let urlStr = episodesURL, let url = URL(string: urlStr) else {
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let episodes = try JSONDecoder().decode([Episode].self, from: data)
                    DispatchQueue.main.async {
                        completion(episodes)
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
    func fetchPatchNotes(completion: @escaping ([PatchNote]) -> Void) {
        guard let urlStr = patchNotesURL, let url = URL(string: urlStr) else {
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
        guard let urlStr = contentsURL,
              let url = URL(string: "\(urlStr)?patch_note=\(patchNote.id)") else {
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let contents = try JSONDecoder().decode([Content].self, from: data)
                    if let content = contents.first {
                        DispatchQueue.main.async {
                            completion(content)
                        }
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
    func fetchSeasons(completion: @escaping ([Season]) -> Void) {
        guard let urlStr = seasonsURL, let url = URL(string: urlStr) else {
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let patchNotes = try JSONDecoder().decode([Season].self, from: data)
                    DispatchQueue.main.async {
                        completion(patchNotes)
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    func fetchPatches(completion: @escaping ([Patch]) -> Void) {
        guard let urlStr = patchesURL, let url = URL(string: urlStr) else {
            return
        }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let patchNotes = try JSONDecoder().decode([Patch].self, from: data)
                    DispatchQueue.main.async {
                        completion(patchNotes)
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    func fetchNotes(for patch: Patch, completion: @escaping (Note) -> Void) {
        guard let urlStr = contentsURL,
              let url = URL(string: "\(urlStr)?patch=\(patch.id)") else {
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let contents = try JSONDecoder().decode([Content].self, from: data)
                    if let content = contents.first {
                        DispatchQueue.main.async {
                            completion(content)
                        }
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
