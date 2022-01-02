//
//  ContentView.swift
//  Shared
//
//  Created by Maxime Boucher on 25/12/2021.
//

import SwiftUI
import AVKit
import ffmpegkit

struct ContentView: View {
    @State private var presentImporter = false
    @State private var pathToOriginal: URL?
    
    var body: some View {
        VStack {
            Button("Open") {
                presentImporter = true
            }.fileImporter(isPresented: $presentImporter, allowedContentTypes: [.movie]) { result in
                switch result {
                    case .success(let url):
                        pathToOriginal = url
                        //use `url.startAccessingSecurityScopedResource()` if you are going to read the data
                    case .failure(let error):
                        print(error)
                }
            }
            videoPlayerURL(url: pathToOriginal)
            Button("Convert !", action: test)
            VideoPlayer(player: AVPlayer())
        }.padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func test() {
    
}

func videoPlayerURL(url: URL?) -> some View {
    if url == nil {
        return VideoPlayer(player: AVPlayer())
    } else {
        return VideoPlayer(player: AVPlayer(url: url!))
    }
}
