////
////  AddProteryVC.swift
////  Real Estate
////
////  Created by Nayef Alotaibi on 8/13/18.
////  Copyright © 2018 Nayef Alotaibi. All rights reserved.
////
//
//import UIKit
//import Firebase
//import CoreLocation
//
//class AddProteryVC: UIViewController, CLLocationManagerDelegate{
//
//    @IBOutlet weak var typeTextField: UITextField!
//    @IBOutlet weak var bedroomsTextField: UITextField!
//    @IBOutlet weak var bathsTextField: UITextField!
//
//    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var propertyImage: UIImageView!
//
//
//    var imageArray = [UIImage]()
//    var locationManager:CLLocationManager!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        typeTextField.delegate = self
//        bedroomsTextField.delegate = self
//        bathsTextField.delegate = self
//        collectionView.delegate = self
//        collectionView.dataSource = self
//
//
//        determineMyCurrentLocation()
//        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//    }
//
//
//    func determineMyCurrentLocation() {
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.startUpdatingLocation()
//            //locationManager.startUpdatingHeading()
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let userLocation:CLLocation = locations[0] as CLLocation
//
//        // Call stopUpdatingLocation() to stop listening for location updates,
//        // other wise this function will be called every time when user location changes.
//
////        // manager.stopUpdatingLocation()
////        let latitude = userLocation.coordinate.latitude
////        let longitude = userLocation.coordinate.longitude
//
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
//    {
//        print("Error \(error)")
//    }
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if(status == CLAuthorizationStatus.denied) {
//            showLocationDisabledPopUp()
//        }
//    }
//
//    // Show the popup to the user if we have been deined access
//    func showLocationDisabledPopUp() {
//        let alertController = UIAlertController(title: "Background Location Access Disabled",
//                                                message: "Please enable location to access all feautres",
//                                                preferredStyle: .alert)
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//
//        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
//            if let url = URL(string: UIApplicationOpenSettingsURLString) {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        }
//        alertController.addAction(openAction)
//
//        self.present(alertController, animated: true, completion: nil)
//    }
//
//
//    @IBOutlet weak var savePropertyOutlet: DesignableButton!
////    @IBAction func SaveProperty(_ sender: Any) {
////        DataService.instance.uploadProperty(withImages: "addphoto", Type: typeTextField.text!, Bedrooms: bedroomsTextField.text!, Baths: bathsTextField.text!, forUID: (Auth.auth().currentUser?.uid)!) { (isComplete) in
////            if isComplete {
////                self.savePropertyOutlet.isEnabled = true
////                self.dismiss(animated: true, completion: nil)
////            } else {
////                self.savePropertyOutlet.isEnabled = true
////                print("There was an error!")
////            }
////        }
////    }
//    @IBAction func closeBtn(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
//
//    @IBAction func addPhotoBtn(_ sender: Any) {
//
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//
//        let actionSheet = UIAlertController(title: "Photo Source" , message: "Choose a source", preferredStyle: .actionSheet)
//
//        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
//            imagePicker.sourceType = .camera
//            self.present(imagePicker,animated: true, completion: nil)
//        }))
//
//        actionSheet.addAction(UIAlertAction(title: "Photo Libaray", style: .default, handler: { (action) in
//            imagePicker.sourceType = .photoLibrary
//            self.present(imagePicker,animated: true, completion: nil)
//        }))
//
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        present(actionSheet,animated: true,completion: nil)
//    }
//
//}
//
//extension AddProteryVC : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//        var selectedImageFromPicker: UIImage?
//
//        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
//            selectedImageFromPicker = editedImage
//        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
//
//            selectedImageFromPicker = originalImage
//        }
//
//        if let selectedImage = selectedImageFromPicker {
//            imageArray.append(selectedImage)
//        }
//
//        picker.dismiss(animated: true, completion: nil)
//        collectionView.reloadData()
//    }
//
//}
//
//
//
////extension AddProteryVC: UICollectionViewDelegate, UICollectionViewDataSource  {
////
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////
////        return imageArray.count
////    }
////
//////
//////    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//////      //  guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Cell else { return Cell() }
//////
//////        let image = imageArray[indexPath.item]
//////        let imageData: Data = UIImagePNGRepresentation(image)!
//////
//////        cell.updateCell(image: imageData)
//////        cell.layer.shadowRadius = 5
//////        cell.layer.shadowOffset = CGSize(width: 0, height: 0 )
//////        cell.layer.shadowOpacity = 0.1
//////
//////        return cell
//////
//////    }
////}
////
////    extension AddProteryVC: UITextFieldDelegate {
////
////        @objc func dismissKeyboard(){
////            typeTextField.resignFirstResponder()
////            bedroomsTextField.resignFirstResponder()
////            bathsTextField.resignFirstResponder()
////        }
////
////        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
////            typeTextField.resignFirstResponder()
////            bedroomsTextField.resignFirstResponder()
////            bathsTextField.resignFirstResponder()
////            return true
////        }
////
////
//////    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//////        self.indexCell = indexPath.item
//////        performSegue(withIdentifier: "myProteriesSegue", sender: self)
//////
//////    }
//////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//////        if let MoreDescriptionVC = segue.destination as? MoreDescription {
//////            MoreDescriptionVC.indexCell = self.indexCell
//////
//////        }
//////
//////    }
////
////}
////
////
////
//////    override func viewWillAppear(_ animated: Bool) {
//////        super.viewWillAppear(animated)
//////
//////        // Hide the navigation bar on the this view controller
//////        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//////    }
////
//////    override func viewWillDisappear(_ animated: Bool) {
//////        super.viewWillDisappear(animated)
//////
//////        // Show the navigation bar on other view controllers
//////        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//////    }
