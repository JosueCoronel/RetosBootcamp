//
//  DetalleViewController.swift
//  RetoBootcamp03
//
//  Created by Maximo Josue Coronel Flores on 4/12/22.
//

import UIKit

//PROTOCOLOS
protocol DetalleViewControllerDelegate{
    func eliminarLista(_ ViewController: DetalleViewController, indice: Int)
}

class DetalleViewController: UIViewController {

    //VARIABLES DE SALIDA
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var prioridadLabel: UILabel!
    @IBOutlet weak var personalLabel: UILabel!
    @IBOutlet weak var descripcionTextView: UITextView!
    
    var delegate: DetalleViewControllerDelegate?
    
    var titulo: String?
    var prioridad: String?
    var personal: String?
    var descripcion: String?
    var indice: Int = 0
    
    //VARIABLES DE ACCION
    @IBAction func eliminarButton(_ sender: Any) {
        let indice = indice
        delegate?.eliminarLista(self, indice: indice)
        dismiss(animated: true)
    }
    
    @IBAction func cerrarButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        //ASIGNAR VALORES
        tituloLabel.text = titulo
        prioridadLabel.text = prioridad
        descripcionTextView.text = descripcion
        personalLabel.text = personal
        
        //MODO DE VISTA
        descripcionTextView.isEditable = false
        
        super.viewDidLoad()
    }
    

}
