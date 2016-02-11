//
//  ViewController.swift
//  calcViktor
//
//  Created by Mac27 on 10/02/16.
//  Copyright © 2016 viktor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    //Muestra el resultado asociado al label
    @IBOutlet weak var Screen: UILabel!
    
    //Declaracion de las variables
    var firstNumber=Float()
    var secondNumber=Float()
    var result: Float = 0 //mostrar el resultadoen el label
    var numActual: Float = 0 //numero actual seleccionado pulsadp
    var opActual: String = ""  //operacion actual
    var teclaNumero = false
    
    
    
    //obtiene el numero oprimido
    @IBAction func numeros(sender: AnyObject) {
        
        let number = sender.currentTitle //Toma el titulo actual del label en este caso del numero
        //Screen.text = ""
        if teclaNumero == true {
            Screen.text = Screen.text! + number!!; //Se muestra el numero en el Label
        } else {
            Screen.text = number;
        }
        teclaNumero = true
        
    }
    
    
    
    @IBAction func puntoDecimal(sender: AnyObject) {
        let dot = sender.currentTitle!
        Screen.text = Screen.text! + dot!
        
    }
    
    
    
    @IBAction func operaciones(sender: AnyObject) {
        opActual = sender.currentTitle!! //toma el tipo de operacion tecleada
        teclaNumero = false // se teclea operacion
        //convierte label a float
        
        firstNumber = (Screen.text! as NSString).floatValue //tomamos el numero tecleado

        
    }
    var bandera:Bool = false
    @IBAction func resultadoOp(sender: AnyObject) {
        secondNumber = (Screen.text! as NSString).floatValue
        
        bandera = false
        
        switch opActual{
        
            case "+":
                result = firstNumber + secondNumber
            break
            case "-":
                result = firstNumber - secondNumber
            break
            case "X":
                result = firstNumber * secondNumber
            break
            case "/":
                if secondNumber != 0{
                    result = firstNumber / secondNumber
                    bandera = false
                }else{
                    result = -1
                    bandera = true
                }
                
            break
            case "%":
                 result = (firstNumber * secondNumber) / 100
            break
            case "sqr":
                result = sqrt(firstNumber)
            break
            
            default:
                "Error"
            break
        }
        
        
            if (bandera == false){
                Screen.text = "\(result)"

            }else{
                Screen.text = "Error division entre zero"
            }
        
    
        
        
    }
    
    @IBAction func limpiar(sender: AnyObject) {
        firstNumber = 0
        secondNumber = 0
        result = 0
        Screen.text = ""
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

