//
//  Course+CoreDataProperties.swift
//  CourseBook
//
//  Created by MANAS VIJAYWARGIYA on 22/08/18.
//  Copyright © 2018 MANAS VIJAYWARGIYA. All rights reserved.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var publisheddate: NSDate?
    @NSManaged public var price: Double
    @NSManaged public var email: String?
    @NSManaged public var coursename: String?
    @NSManaged public var courseToCategory: Category?
    @NSManaged public var courseToImage: Image?

}
