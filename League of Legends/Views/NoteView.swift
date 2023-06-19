//
//  NoteView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 19/6/23.
//

import SwiftUI
import WebKit

struct LoLPatchNoteView: UIViewRepresentable {
    let htmlNote: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.loadHTMLString(htmlNote, baseURL: nil)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No hay necesidad de hacer nada ya que la vista no cambiará una vez creada.
    }
}

struct NoteView: View {
    var patch: Patch
    @State private var note: Note? = nil
    
    var body: some View {
        Group {
            if let note = note {
                LoLPatchNoteView(htmlNote: note.html)
            } else {
                Text("Loading...")
            }
        }.onAppear {
            APIService.shared.fetchNotes(for: patch) { fetchedNote in self.note = fetchedNote
            }
        }
    }
}
