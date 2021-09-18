//
//  URLImage.swift
//  Pinnacle
//
//  Created by Victor Uemura on 2021-09-18.
//

import SwiftUI

class URLImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String
    var imageCache = ImageCache.getImageCache()
    
    init(url: String) {
        self.urlString = url
        loadImage()
    }
    
    func loadImage() {
        guard let url = URL(string: self.urlString) else { return }
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        let loadedImage = UIImage(data: data)
                        self.imageCache.set(forKey: self.urlString, image: loadedImage!)
                        self.image = loadedImage
                    }
                }
            }
            .resume()
            return
        }
        self.image = cacheImage
    }
}

struct URLImageView: View {
    @ObservedObject var urlImageModel: URLImageModel
    static var defaultImage = UIImage(named: "default")
    
    init(urlString: String) {
        self.urlImageModel = URLImageModel(url: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? URLImageView.defaultImage!)
            .resizable()
    }
}

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
