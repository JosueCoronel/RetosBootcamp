//
//  CustomTableViewCell.swift
//  RetoBootcamp03
//
//  Created by Maximo Josue Coronel Flores on 4/12/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var prioridadLabel: UILabel!
    
    @IBOutlet weak var descripcionTextView: UITextView!
    
    func setup(lista: Descripcion){
        //ASIGNAR VALORES
        tituloLabel.text = lista.titulo
        prioridadLabel.text = lista.prioridad
        descripcionTextView.text = lista.descripcion
        
        //MODO DE VISTA
        descripcionTextView.isEditable = false
    }
}
