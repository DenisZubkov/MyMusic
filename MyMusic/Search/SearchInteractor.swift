//
//  SearchInteractor.swift
//  MyMusic
//
//  Created by Dennis Zubkoff on 01.03.2020.
//  Copyright (c) 2020 Denis Zubkov. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
    func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {
    
    var presenter: SearchPresentationLogic?
    var service: SearchService?
    
    func makeRequest(request: Search.Model.Request.RequestType) {
        if service == nil {
            service = SearchService()
        }
        
        switch request {
            
        case .some:
            print("interactor .some")
            presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks)
        case .getTracks:
            print("interactor .getTracks")
            presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks)
            
        }
    }
    
}
