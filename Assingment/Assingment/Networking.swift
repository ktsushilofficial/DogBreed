//
//  Networking.swift
//  Assingment
//
//  Created by Sushil on 20/02/23.
//

import Foundation
class Networking
{
    static func getResponseforRequest(urlReq:URLRequest, completion:@escaping (Data)->())
    {
        URLSession.shared.dataTask(with: urlReq) { data, res, error in
            if let data = data{
                completion(data)
            }
        }.resume()
    }
}
