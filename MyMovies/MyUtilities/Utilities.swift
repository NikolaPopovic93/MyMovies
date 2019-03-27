//
//  Utilities.swift
//  MyMovies
//
//  Created by Nikola Popovic on 12/31/18.
//  Copyright © 2018 Nikola Popovic. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

open class Utilities : NSObject {
    
    class func getValidString(_ fromString: String?, defaultString: String) -> String {
        if (fromString == nil || fromString!.isEmpty) {
            return defaultString
        } else {
            return fromString!
        }
    }
    
    class func getValidBool(_ fromBool: Bool?, defaultBool: Bool) -> Bool {
        if (fromBool != nil) {
            return fromBool!
        } else {
            return defaultBool
        }
    }
    
    class func isStringValid (_ fromString: String?) ->Bool{
        if(fromString == nil || fromString!.isEmpty){
            return false
        }
        else{
            return true
        }
    }
    
    class func startProgress(){
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    class func stopProgress(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    class func getStringGenres(listOfIds : [Int]) -> String {
        var text = ""
        
        for index in listOfIds.indices {
            if index == listOfIds.count - 1 {
                text += "\(listOfIds[index])"
            } else {
                text += "\(listOfIds[index]),"
            }
        }
        return text
    }
    
    class func setStatusBarColor(color : UIColor) {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
    }
    
    class func getAbsolutPosterPath(imagePath : String) -> String {
        return String.init(format: posterPahtBase, imagePath)
    }
    
    class func getGenres(genersIds : [Int]) -> String {
        var text = ""
        var firstIteration = true
        for genreId in genersIds {
            for genreDataManager in SharedDataManager.sharedInstance.geners! {
                if genreId == genreDataManager.id {
                    if firstIteration {
                        text += "\(String(describing: genreDataManager.name!))"
                        firstIteration = false
                    } else {
                        text += ", \(String(describing: genreDataManager.name!))"
                    }
                }
            }
        }
        return text
    }
    
    class func convertDate(dateString : String) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"

        if let date = dateFormatterPrint.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMM yyyy"
            let dateString = dateFormatter.string(from: date)
            return dateString
        } else {
            return ""
        }
    }
    
    class func getDateStringForDiscover() -> String {
        var result = ""
        let date = Date()
    
        let currentCalendar = Calendar.current
        
        let year = currentCalendar.component(.year, from: date)
        let month = currentCalendar.component(.month, from: date)
        let day = currentCalendar.component(.day, from: date)
        
        var dateComponents = DateComponents()
        
        if month > 3 {
            dateComponents.month = month - 3
            dateComponents.year = year
        } else {
            dateComponents.year = year - 1
            dateComponents.month = 11
        }
        
        dateComponents.day = day
        
        let newCalendar = Calendar.current
        let newDateTime = newCalendar.date(from: dateComponents)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let newDate = newDateTime {
            result = formatter.string(from: newDate)
        }
        return result
    }
    
    class func secondsToHoursMinutesSeconds(seconds : Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    class func getEnglishName(iso : String) -> String {
        var englishName = ""
        if let languages = SharedDataManager.sharedInstance.languages {
            for language in languages {
                if language.iso == iso {
                    englishName = language.englishName
                    break
                }
            }
        }
        return englishName
    }
    
    class func getCountryImagePath(iso : String) -> String {
        var path = ""
        let countries = SharedDataManager.sharedInstance.countries
        if let countries = countries {
            for country in countries {
                if country.iso == iso {
                    path = country.iso
                    break
                }
            }
        }
        return path
    }
    
    class func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    class func getTextViewHeight(textView : UITextView) -> CGFloat {
        let maximumLabelSize = CGSize(width: Double(textView.frame.size.width), height: Double.greatestFiniteMagnitude)
        _ = UInt8(NSStringDrawingOptions.truncatesLastVisibleLine.rawValue) | UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue)
        let attribute = [NSAttributedString.Key.font: textView.font!]
        let str = NSString(string: Utilities.getValidString(textView.text, defaultString: ""))
        let labelBounds = str.boundingRect(with: maximumLabelSize,
                                           options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                           attributes: attribute,
                                           context: nil)
        let myTextHeight = CGFloat(ceilf(Float(labelBounds.height))) + 16
        return myTextHeight
    }
}
