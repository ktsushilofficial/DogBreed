//
//  RandomDogModal.swift
//  Assingment
//
//  Created by Sushil on 20/02/23.
//

import Foundation

class RandomDogModal:Decodable
{
    var imgurl:String?
    private enum CodingKeys : String, CodingKey {
            case imgurl = "message"
        }
}
