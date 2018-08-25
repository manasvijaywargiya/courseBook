//
//  Category+CoreDataProperties.swift
//  CourseBook
//
//  Created by MANAS VIJAYWARGIYA on 22/08/18.
//  Copyright © 2018 MANAS VIJAYWARGIYA. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var categoryToCourse: Course?
    @NSManaged public var categoryToImage: Image?

}
