//
//  Extensions.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 20/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

extension String {
func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
    let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.text = self
    label.font = font
    label.sizeToFit()

    return label.frame.height
 }
}

extension UIImageView{
    func loadImage(imgUrl:String){
        let url = URL(string: imgUrl)
        self.image = UIImage(named: "ic_placeholder")

        if url != nil{
           let data = try? Data(contentsOf: url!)
            if data != nil{
                self.image = UIImage(data: data ?? Data())
            }
        }
    }
}
