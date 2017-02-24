//
//  Models.swift
//  Clico
//
//  Created by Mohamed on 28/08/2016.
//  Copyright © 2016 HACHFI. All rights reserved.
//

import Foundation

class Deal: NSObject {
    var title : String = ""
    var address : String = ""
    var startDate : String?
    var endDate : String?
    
    init(with title : String, address : String, startDate : String, endDate : String) {
        self.title = title
        self.address = address
        self.startDate = startDate
        self.endDate = endDate
        super.init()
    }
    
    class var deals : [Deal] {
        var list = [Deal]()
        list.append(Deal(with: "Promo chemises", address: "11 les sablons, Neuilly", startDate: "28/08/2016", endDate: "30/08/2016"));
        list.append(Deal(with: "Offre flash", address: "218 rue de la Tombe-Issoire 75014 Paris ", startDate: "21/08/2016", endDate: "24/08/2016"));
        list.append(Deal(with: "AccorHotels Inv", address: "78 rue Henry Ferman", startDate: "20/08/2016", endDate: "09/09/2016"));
        list.append(Deal(with: "Derniere demarque", address: "Les boutiques Zara", startDate: "20/08/2016", endDate: "21/08/2016"));
        list.append(Deal(with: "Formula petit-déj", address: "Tunis-Tunis, Belleville", startDate: "16/08/2016", endDate: "19/08/2016"));
        list.append(Deal(with: "Location voitures", address: "Hertz", startDate: "09/08/2016", endDate: "10/08/2016"));
        list.append(Deal(with: "Solde 50%", address: "Boutiques celio*", startDate: "03/08/2016", endDate: "07/08/2016"));
        list.append(Deal(with: "Chèques cadeaux", address: "Carrefour", startDate: "30/07/2016", endDate: "30/07/2016"));
        list.append(Deal(with:"Surprise", address: "4 Temps", startDate: "20/07/2016", endDate: "24/07/2016"));
        list.append(Deal(with: "Nouvelle collection", address: "Boutiques Jules", startDate: "15/07/2016", endDate: "16/07/2016"));
        list.append(Deal(with: "Baquette gratuite", address: "30 rue Alésia, Paris 75014", startDate: "01/07/2016", endDate: "11/07/2016"));
        list.append(Deal(with: "Promo Ramadhan", address: "Boucherie 100% halal", startDate: "04/06/2016", endDate: "10/07/2016"));
        list.append(Deal(with: "Promo Aid", address: "92 rue de la liberté, BelleVille", startDate: "04/06/2016", endDate: "07/06/2016"));
        return list
    }
}



class Client: NSObject {
    var name : String = ""
    var address : String = ""
    var startDate : String?
    var endDate : String?
    
    init(with name : String, address : String, startDate : String, endDate : String) {
        self.name = name
        self.address = address
        self.startDate = startDate
        self.endDate = endDate
        super.init()
    }
    
    class var clients : [Client] {
        var list = [Client]()
        list.append(Client(with: "Client 1", address: "11 les sablons, Neuilly", startDate: "28/08/2016", endDate: "30/08/2016"));
        list.append(Client(with: "Client 2", address: "218 rue de la Tombe-Issoire 75014 Paris ", startDate: "21/08/2016", endDate: "24/08/2016"));
        list.append(Client(with: "Client 3", address: "78 rue Henry Ferman", startDate: "20/08/2016", endDate: "09/09/2016"));
        list.append(Client(with: "Client 4", address: "Les boutiques Zara", startDate: "20/08/2016", endDate: "21/08/2016"));
        list.append(Client(with: "Client 5", address: "Tunis-Tunis, Belleville", startDate: "16/08/2016", endDate: "19/08/2016"));
        list.append(Client(with: "Client 6", address: "Hertz", startDate: "09/08/2016", endDate: "10/08/2016"));
        list.append(Client(with: "Client 7", address: "Boutiques celio*", startDate: "03/08/2016", endDate: "07/08/2016"));
        list.append(Client(with: "Client 8", address: "Carrefour", startDate: "30/07/2016", endDate: "30/07/2016"));
        list.append(Client(with: "Client 9", address: "4 Temps", startDate: "20/07/2016", endDate: "24/07/2016"));
        list.append(Client(with: "Client 10 collection", address: "Boutiques Jules", startDate: "15/07/2016", endDate: "16/07/2016"));
        list.append(Client(with: "Client 11", address: "30 rue Alésia, Paris 75014", startDate: "01/07/2016", endDate: "11/07/2016"));
        list.append(Client(with: "Client 12", address: "Boucherie 100% halal", startDate: "04/06/2016", endDate: "10/07/2016"));
        list.append(Client(with: "Client 13", address: "92 rue de la liberté, BelleVille", startDate: "04/06/2016", endDate: "07/06/2016"));
        return list
    }
}