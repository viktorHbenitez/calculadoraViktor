//
//  ViewController.swift
//  calcViktor
//
//  Created by Mac27 on 10/02/16.
//  Copyright © 2016 viktor. All rights reserved.
//

import UIKit
import Darwin

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
    var banderadot = false
    
    
    
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
        
        if banderadot == false{
            Screen.text = Screen.text! + dot!
            banderadot = true
        
        }
        
        
        
    }
    
    
    
    @IBAction func operaciones(sender: AnyObject) {
        opActual = sender.currentTitle!! //toma el tipo de operacion tecleada
        teclaNumero = false // se teclea operacion
        //convierte label a float
        
        firstNumber = (Screen.text! as NSString).floatValue //tomamos el numero tecleado
        banderadot = false

        
    }
    var bandera:Bool = false
    @IBAction func resultadoOp(sender: AnyObject) {
        secondNumber = (Screen.text! as NSString).floatValue
        var numAux: Float = firstNumber
        var fact: Float = 1
        
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
            
            case "cos":
            result = cos(firstNumber)
            break
            case "sin":
            result = sin(firstNumber)
            break
            case "ln":
            result = log(firstNumber)
            break

            case "x!":
                while numAux > 1{
                    fact=fact * numAux
                    numAux = numAux-1
                }
                result = fact
                
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

