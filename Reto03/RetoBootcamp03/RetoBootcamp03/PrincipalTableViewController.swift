//
//  PrincipalTableViewController.swift
//  RetoBootcamp03
//
//  Created by Maximo Josue Coronel Flores on 4/12/22.
//

import UIKit

class PrincipalTableViewController: UITableViewController {
    
    var Lista = [Descripcion(
            titulo: "REQ01 - Creacion FrontEnd",
            prioridad: "Media",
            personal: "Juan Jose Perez",
            descripcion: "Desarrollar el login, primeras vistas e implementar el diseño brindado por el cliente. "
        ),
        Descripcion(
            titulo: "REQ02 - Creacion BD",
            prioridad: "Alta",
            personal: "Pedro Antonio Marquez",
            descripcion: "Optimizar la Data brindada por el cliente y crear la base de datos relacional para el uso del proyecto"
        ),
        Descripcion(
            titulo: "REQ03 - Creacion BackEnd",
            prioridad: "Media",
            personal: "Marco Antonio Paredes",
            descripcion: "Crear los servicios API que se alimentara de la BD para proveer al Sistema Web"
        )
    ]

    @IBAction func agregarRegistroButton(_ sender: Any) {
        guard let formularioTableViewController = storyboard?.instantiateViewController(withIdentifier: "FormularioTableViewController") as? FormularioTableViewController else {return}
        let nav = UINavigationController(rootViewController: formularioTableViewController)
        present(nav, animated: true)
        formularioTableViewController.delegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Lista.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as? CustomTableViewCell{
            let lista = Lista[indexPath.row]
            cell.setup(lista: lista)
            return cell
        }else{
            return UITableViewCell()
        }

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}

extension PrincipalTableViewController: FormularioTableViewControllerDelegate{
    func FormularioTableViewController(_ ViewController: FormularioTableViewController, didCreateLista newLista: Descripcion) {
        Lista.append(newLista)
        tableView.reloadData()
    }
}
    
extension PrincipalTableViewController {
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let lista = Lista[indexPath.row]
            let indice = indexPath.row
            
            guard let detalleViewController = storyboard?.instantiateViewController(withIdentifier: "DetalleViewController") as? DetalleViewController else {return}
            
            detalleViewController.titulo = lista.titulo
            detalleViewController.prioridad = lista.prioridad
            detalleViewController.personal = lista.personal
            detalleViewController.descripcion = lista.descripcion
            detalleViewController.indice = indice
            
            present(detalleViewController, animated: true)
            detalleViewController.delegate = self
            
            print(Lista)
        }
}

extension PrincipalTableViewController: DetalleViewControllerDelegate{
    func eliminarLista(_ ViewController: DetalleViewController, indice: Int) {
        Lista.remove(at: indice)
        tableView.reloadData()
    }
}



