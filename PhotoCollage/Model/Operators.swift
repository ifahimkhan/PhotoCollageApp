//
//  Operators.swift
//  PhotoCollage
//
//  Created by Fahim on 3/24/24.
//

import SwiftUI

func + (left:CGSize,right:CGSize) -> CGSize{
    CGSize(width: left.width+right.width,
           height: left.height+right.height)
}
