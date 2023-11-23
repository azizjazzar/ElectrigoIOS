//
//  Garage.swift
//  Electrigo
//
//  Created by hamza farhani on 12/11/2023.
//

import Foundation

class Garage: Identifiable {
    var id: Int
    var name: String
    var location: String
    var capacity: Int
    var phone : String
    var descritionG : String
    var pic :String
   


    init(id: Int , name: String , location: String , capacity: Int , phone : String , descritionG : String , pic :String) {
        self.id = id
        self.name = name
        self.location = location
        self.capacity = capacity
        self.phone = phone
        self.descritionG = descritionG
        self.pic = pic
       
    }
}

