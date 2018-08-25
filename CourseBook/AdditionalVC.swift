//
//  AdditionalVC.swift
//  CourseBook
//
//  Created by MANAS VIJAYWARGIYA on 22/08/18.
//  Copyright © 2018 MANAS VIJAYWARGIYA. All rights reserved.
//

import UIKit
import CoreData

class AdditionalVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    var category = [Category]()
    
    //property - didSelectRow
    var existingCourse: Course?
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var courseName: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    //imagePicker declared
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        
//        getTestDataPi()
        
        getCateData()

        if existingCourse != nil {
            loadCourseInfo()
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func pickImageTapped(_ sender: Any) {
        present(imagePicker,animated: true,completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let ima = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImage.image = ima
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var saveBtnTapped: UIButton!
    @IBAction func saveBtnTapped(_ sender: Any) {
        var course: Course!
        let pic = Image(context: context)
        pic.image = myImage.image
        
        if existingCourse == nil {
            course = Course(context: context)
        }else{
            course = existingCourse
        }
        
        course.courseToImage = pic
        
        if let courseName = courseName.text {
            course.coursename = courseName
        }
        if let sureEmail = email.text {
            course.email = sureEmail
        }
        if let surePrice = price.text {
            course.price = (surePrice as NSString).doubleValue
        }
        
        course.courseToCategory = category[categoryPicker.selectedRow(inComponent: 0)]
        
        appdel.saveContext()
        
        //go back to mainVC
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
        if existingCourse != nil{
            context.delete(existingCourse!)
            appdel.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let category = self.category[row]
        return category.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }
    
    //Fetch category data from core data
    func getCateData(){
        let fetchMe: NSFetchRequest<Category> = Category.fetchRequest()
        do{
            self.category = try context.fetch(fetchMe)
            self.categoryPicker.reloadAllComponents()
        }catch{
            
        }
    }
    
    //Load Course info from main screen
    func loadCourseInfo(){
        if let course = existingCourse {
            courseName.text = course.coursename
            price.text = "\(course.price)"
            email.text = course.email
            
            myImage.image = course.courseToImage?.image as? UIImage
        }
    }
    
    func getTestDataPi(){
        let category = Category(context: context)
        category.name = "WebDev"
        
        let category1 = Category(context: context)
        category1.name = "iOS 12"
        
        let category2 = Category(context: context)
        category2.name = "Android"
        
        let category3 = Category(context: context)
        category3.name = "Ethical Hacking"
    
        let category4 = Category(context: context)
        category4.name = "Python"
        
        appdel.saveContext()
    }
    
}















