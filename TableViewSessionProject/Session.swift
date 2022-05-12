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
