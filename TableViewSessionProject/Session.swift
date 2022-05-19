//
//  Session.swift
//  TableViewSessionProject
//
//  Created by 곽우종 on 2022/05/12.
//

import Foundation
import UIKit

class Session {
    func startLoad(url: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return
            }
            guard let data = data else {
                return
            }
            guard let image = UIImage(data: data) else {
                return
            }
            
            completion(image)
        }
        task.resume()
    }
}

final class ImageCacheManger {
    static let shared = NSCache<NSString, UIImage>()
}

extension UIImageView {
    func setImage(with string: String) {
        let nsString = NSString(string: string)
        if let uiImage = ImageCacheManger.shared.object(forKey: nsString) {
            self.image = uiImage
            return
        }
        guard let url = URL(string: string) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return
            }
            guard let data = data else {
                return
            }
            guard let uiImage = UIImage(data: data) else {
                return
            }
            ImageCacheManger.shared.setObject(uiImage, forKey: nsString)
            DispatchQueue.main.async {
                self.image = uiImage
            }
        }
        task.resume()
    }
}
