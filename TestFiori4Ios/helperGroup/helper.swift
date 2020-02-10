//
//  helper.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 15/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import Foundation

struct place :Decodable{
    var etage : Int!
    var position : Int!
    var avaiability : Bool!
}

struct parking : Decodable {
    var nom : String!
    var adresse : String!
    var nbTot : Int!
}

struct Employé : Decodable {
    var nom : String!
    var prenom : String!
    var profilPict : String!
    var matricule : String!
    var ownedPlaces : [place]!
}


struct propositions : Decodable {
    var place : place!
    var date : String!
    var lodger : Employé!
    var parking : parking!
}

struct propositionsArray : Decodable {
    var proposition : [propositions]!
}

struct concludedPropositions : Decodable {
    var place : place!
    var date : Date!
    var lodger : Employé!
    var renter : Employé!
    var parking : parking!
}
