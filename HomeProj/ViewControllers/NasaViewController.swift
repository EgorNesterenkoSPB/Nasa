//
//  MainViewController.swift
//  HomeProj
//
//  Created by MacBook Air 13 Retina 2018 on 24.12.2021.
//

import UIKit

class NasaViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
   
    var viewModel = NasaViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enterButton.layer.cornerRadius = 10
      
    }
  override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    viewModel.delegate = self
    }
    
    
    
    @IBOutlet weak var textDescription: UILabel!
    
    @IBAction func signOutPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    @IBAction func enterPressed(_ sender: UIButton) {
        if let text = dateTF.text {
            viewModel.fetchData(date: text)
        }
        else {
            present(errorAC(title: "Please fill in date text", message: "", buttonText: "Ok"), animated: true, completion: nil)
        }
    }
}

//MARK: - Extension NasaViewModelDelegate

extension NasaViewController:NasaViewModelDelegate
{
    func didFailWithError(error: Error) {
        present(errorAC(title: "Error", message: "Coudnt get data from this data,please check your data for the correctness", buttonText: "Ok"), animated: true, completion: nil)
    }
    func didUpdateData(_ nasaViewModel: NasaViewModel, data: NasaData) {
        DispatchQueue.main.async {
            self.textDescription.text = data.explanation
            self.title = data.title
            if let image = self.viewModel.getImage(from: data.hdurl){
            self.imageView.image = image
            }
        }
    }
}



