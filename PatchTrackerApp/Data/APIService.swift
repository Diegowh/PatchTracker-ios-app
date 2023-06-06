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
    
    func fetchEpisodes(completion: @escaping ([Episode]) -> Void) {
        guard let url = URL(string: localhostEpisodesURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
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
        guard let url = URL(string: localhostPatchNotesURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
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
        let url = URL(string: "\(localhostContentsURL)?patch_note=\(patchNote.id)")
        
        guard let unwrappedUrl = url else {
            return
        }
        
        URLSession.shared.dataTask(with: unwrappedUrl) { (data, response, error) in
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

