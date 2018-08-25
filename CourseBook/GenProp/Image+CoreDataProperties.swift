//
//  Image+CoreDataProperties.swift
//  CourseBook
//
//  Created by MANAS VIJAYWARGIYA on 22/08/18.
//  Copyright © 2018 MANAS VIJAYWARGIYA. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var imageToCourse: Course?
    @NSManaged public var imageToCategory: Category?

}
