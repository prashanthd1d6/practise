//
//  ViewController.swift
//  CollectionView
//
//  Created by Akula harish on 03/03/21.
//
import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    
    
    var firstViewController:MainTableViewController!
    var FNTextField:UITextField!
    var LNTextField:UITextField!
    var DOB:UITextField!
    var imageL:UIImage!
    var profTextField:UITextField!
    var saveBtn:UIButton!
    var datePicker = UIDatePicker()
    var allDetailsArray = [[String]]()
    var acObj:UIAlertController!
    var aaObj:UIAlertAction!
    
    var proPicker = UIPickerView()
    var profArr = [String]()
    var proffessionArr = ["BussinessMan","Cricketer","Politician","Actor"]
    
    @IBOutlet weak var imagView: UIImageView!
    
    
    @IBOutlet weak var imageButton: UIButton!
     
    
    @IBAction func imageAction(_ sender: Any) {
        showImagePickerController()
        
    }
    
    var labelArray = ["FirstNameTextField","LastNameTextField","DOB","Profession"]
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        proPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return profArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return profArr[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        profTextField.text = profArr[row]
        profTextField.resignFirstResponder()
    }
    func createUI(){
        var a = 0
        for i in 0..<labelArray.count{
            var TFLabel = UILabel()
            TFLabel.frame = CGRect(x: 30, y: 250+a, width: 200, height: 50)
            TFLabel.text = labelArray[i]
            TFLabel.textColor = .black
            view.addSubview(TFLabel)
            a += 100
        }
       
        FNTextField = UITextField(frame: CGRect(x: 30, y: 300, width: 350, height: 50))
        FNTextField.borderStyle = .roundedRect
        FNTextField.clearButtonMode = .whileEditing
        view.addSubview(FNTextField)
        
        LNTextField = UITextField(frame: CGRect(x: 30, y: 400, width: 350, height: 50))
        LNTextField.borderStyle = .roundedRect
        LNTextField.clearButtonMode = .whileEditing
        view.addSubview(LNTextField)
        
        DOB = UITextField(frame: CGRect(x: 30, y: 500, width: 350, height: 50))
        DOB.placeholder = "DD/MM/YYYY"
        DOB.borderStyle = .roundedRect
        DOB.clearButtonMode = .whileEditing
        
        view.addSubview(DOB)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        DOB.inputAccessoryView = toolbar
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButon = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButon], animated: false)
        DOB.inputView=datePicker
        
        profTextField = UITextField(frame: CGRect(x: 30, y: 600, width: 350, height: 50))
        profTextField.borderStyle = .roundedRect
        profTextField.clearButtonMode = .whileEditing
        view.addSubview(profTextField)
        profTextField.inputView = proPicker
        for i in proffessionArr{
            profArr.append("\(i)")
        }
        
        saveBtn = UIButton(type: UIButton.ButtonType.system)
        saveBtn.frame = CGRect(x: 130, y: 700, width: 150, height: 40)
        saveBtn.setTitle("SUBMIT", for: UIControl.State.normal)
        saveBtn.layer.cornerRadius = 10
        saveBtn.backgroundColor = .systemBlue
        saveBtn.tintColor = .white
        saveBtn.addTarget(self, action: #selector(saveBtnTap), for: UIControl.Event.touchUpInside)
        view.addSubview(saveBtn)
    
       imagView.layer.cornerRadius = imagView.bounds.width/2
    }
    @objc func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        DOB.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func showImagePickerController(){

        let imagePickerController = UIImagePickerController()

        imagePickerController.delegate = self

        imagePickerController.allowsEditing = true

        imagePickerController.sourceType = .photoLibrary
        
        present(imagePickerController, animated: true, completion: nil)

    }
    
 // should begin editing
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("should begin editing")
        var returnValue:Bool = false
        
        
    if (textField == FNTextField){
            returnValue = true
      }else if (textField == LNTextField){
        if (FNTextField.text!.count > 0){
            returnValue = true
        }else{
            returnValue = false
        }
        
      }else if (textField == DOB){
        if (LNTextField.text!.count > 0 && FNTextField.text!.count > 0)
        {
            returnValue = true
        }else{
            returnValue = false
        }
    
    }else if (textField == profTextField){
            if (LNTextField.text!.count > 0 && FNTextField.text!.count > 0 && DOB.text!.count == 4)
        {
            returnValue = true
        }else{
            returnValue = false
        }
    
    }

        return returnValue
}
    
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
            print("did end editing")
            
        if (profTextField.text!.count >= 10){
            saveBtn.isEnabled = true
        }else{
            saveBtn.isEnabled = false
        }
            
        }
//Save button objc
    @objc func saveBtnTap(){
     
        if (LNTextField.text!.count > 0 && FNTextField.text!.count > 0 && DOB.text!.count >= 4 && profTextField.text!.count <= 10)
        {
       
            let array = [FNTextField,LNTextField,DOB,profTextField].map{$0.text!}
                allDetailsArray.append(array)
                firstViewController.allDetailsArrayL.append(array)
               // firstViewController.imgArrayTV.append(imageL)
                print(allDetailsArray)
                clear()
       
        }
        else
        {
            acObj = UIAlertController(title: "error", message: "enter correct details", preferredStyle: UIAlertController.Style.alert)
            var okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive) { [self] (okAct) in
                   
                }
                acObj.addAction(okAction)

                present(acObj, animated: true, completion: nil)

        }

        navigationController?.popToRootViewController(animated: true)
       // firstViewController.allDetailsArrayL = allDetailsArray
        
  }
    
    func clear(){
        FNTextField.text = nil
        LNTextField.text = nil
        DOB.text = nil
        profTextField.text = nil
        
    }
        
}
extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if  let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{

           imagView.image = editedImage
            imageL = editedImage

        }else if  let originalImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{

           imagView.image = originalImage
            imageL = originalImage

        }

        print(info)

        picker.dismiss(animated: true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

        picker.dismiss(animated: true, completion: nil)

    }

}

