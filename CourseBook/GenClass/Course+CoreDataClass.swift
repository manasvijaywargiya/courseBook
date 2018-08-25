//
//  Course+CoreDataClass.swift
//  CourseBook
//
//  Created by MANAS VIJAYWARGIYA on 22/08/18.
//  Copyright © 2018 MANAS VIJAYWARGIYA. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Course)
public class Course: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.publisheddate = NSDate()
    }
}
