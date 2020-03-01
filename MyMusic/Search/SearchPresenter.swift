//
//  SearchPresenter.swift
//  MyMusic
//
//  Created by Dennis Zubkoff on 01.03.2020.
//  Copyright (c) 2020 Denis Zubkov. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
    func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?
    
    func presentData(response: Search.Model.Response.ResponseType) {
        
        switch response {
            
        case .some:
            print("presenter .some")
        case .presentTracks:
            print("presenter .presentTracks")
            viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks)
            
        }
    }
    
}
