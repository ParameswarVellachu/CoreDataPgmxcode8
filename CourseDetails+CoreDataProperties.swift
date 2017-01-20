//
//  CourseDetails+CoreDataProperties.swift
//  CoreDataPgmxcode8
//
//  Created by Paramswar on 10/01/17.
//  Copyright © 2017 MTPL. All rights reserved.
//

import Foundation
import CoreData


extension CourseDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CourseDetails> {
        return NSFetchRequest<CourseDetails>(entityName: "CourseDetails");
    }

    @NSManaged public var content: NSObject?
    @NSManaged public var userid: String?

}
