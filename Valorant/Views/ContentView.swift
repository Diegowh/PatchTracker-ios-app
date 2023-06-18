//
//  PatchContentView.swift
//  PatchTrackerApp
//
//  Created by Diego García Pérez on 5/6/23.
//

import SwiftUI
import WebKit

struct PatchContentView: UIViewRepresentable {
    let htmlContent: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.loadHTMLString(htmlContent, baseURL: nil)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No hay necesidad de hacer nada aquí, ya que la vista no cambiará una vez creada.
    }
}

struct ContentView: View {
    var patchNote: PatchNote
    @State private var content: Content? = nil
    
    var body: some View {
        Group {
            if let content = content {
                // Aquí es donde se utiliza PatchContentView
                PatchContentView(htmlContent: content.html_content)
            } else {
                // Muestra algo mientras se carga el contenido, por ejemplo, un indicador de carga o un mensaje
                Text("Loading...")
            }
        }.onAppear {
            APIService.shared.fetchContent(for: patchNote) { fetchedContent in
                self.content = fetchedContent
            }
        }
    }
}


let html_template: String = """
<!DOCTYPE html>
<html>
<head>
<style>
body {
    font-family: -apple-system, sans-serif;
    font-size: 35px;
    line-height: 1.6;
    padding: 20px;
    border: 2px solid #000000;
}
</style>
</head>
<body>
<h3>Bug Fixes</h3>
<ul><li>Cypher's camera made less lethal under certain... circumstances
<ul><li><i>This is referring to a bug where the camera could be equipped with a sidearm that could be used whilst in control of the camera</i></li></ul></li>
<li>Patched a number of map exploits.</li>
<li>Fixed audio dropping after consecutive games.</li></ul>
</body>
</html>
"""



struct PatchContentView_Previews: PreviewProvider {
    static var previews: some View {
        PatchContentView(htmlContent: html_template)
    }
}
