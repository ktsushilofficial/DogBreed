//
//  FavouriteDogs+CoreDataClass.swift
//  Assingment
//
//  Created by Sushil on 20/02/23.
//
//

import Foundation
import CoreData

@objc(FavouriteDogs)
public class FavouriteDogs: NSManagedObject {
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
}
