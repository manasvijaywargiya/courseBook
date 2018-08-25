//
//  CourseCell.swift
//  CourseBook
//
//  Created by MANAS VIJAYWARGIYA on 22/08/18.
//  Copyright © 2018 MANAS VIJAYWARGIYA. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseEmail: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    
    func fillCellWithData(course: Course){
        courseName.text = course.coursename
        courseEmail.text = course.email
        coursePrice.text = "$ \(course.price)"
        
        //TODO: Set Image later
        myImage.image = course.courseToImage?.image as? UIImage
    }
    
}
