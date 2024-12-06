//
//  Choice.swift
//  slot-machine
//
//  Created by FURKAN AYAZ on 6.12.2024.
//

enum Choice: Int, Identifiable {
    var id: Int { self.rawValue }
    case success
    case failure
}
