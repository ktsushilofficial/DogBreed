//
//  FavouriteDogs+CoreDataProperties.swift
//  Assingment
//
//  Created by Sushil on 20/02/23.
//
//

import Foundation
import CoreData


extension FavouriteDogs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteDogs> {
        return NSFetchRequest<FavouriteDogs>(entityName: "FavouriteDogs")
    }

    @NSManaged public var dogimage: Data?

}

extension FavouriteDogs : Identifiable {

}
