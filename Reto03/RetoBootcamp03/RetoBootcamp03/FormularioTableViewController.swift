//
//  FormularioTableViewController.swift
//  RetoBootcamp03
//
//  Created by Maximo Josue Coronel Flores on 4/12/22.
//

import UIKit

//PROTOCOLOS
protocol FormularioTableViewControllerDelegate{
    func FormularioTableViewController(_ ViewController: FormularioTableViewController, didCreateLista newLista: Descripcion)
}

class FormularioTableViewController: UITableViewController {

    //DECLARAR VARIABLES DE SALIDA
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var prioridadTextField: UITextField!
    @IBOutlet weak var personalTextField: UITextField!
    @IBOutlet weak var descripcionTextField: UITextField!
    
    //DECLARAR FORMULARIO DELEGATE
    var delegate: FormularioTableViewControllerDelegate?
    
    //DECLARAR VARIABLES DE ACCION
    @IBAction func cerrarButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func agregarButton(_ sender: Any) {
        let tituloTf = tituloTextField.text
        let descripcionTf = descripcionTextField.text
        let prioridadTf = prioridadTextField.text
        let personalTf = personalTextField.text
        
        guard let titulo = tituloTf, !titulo.isEmpty else {return}
        guard let prioridad = prioridadTf, !prioridad.isEmpty else {return}
        guard let personal = personalTf, !personal.isEmpty else {return}
        guard let descripcion = descripcionTf, !descripcion.isEmpty else {return}
        
        let newLista = Descripcion(titulo: titulo, prioridad: prioridad, personal: personal, descripcion: descripcion )
        
        delegate?.FormularioTableViewController(self, didCreateLista: newLista)
        
        dismiss(animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
