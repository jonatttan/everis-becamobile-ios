//
//  ViewController.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 26/03/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    
    //MARK: - Variáveis
    var todosFilmes = [Filme]()
    var filmes = [Filme]()
    var contador = 0
    var pag = 1
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    @IBOutlet weak var labelStatusPagina: UILabel!
    @IBOutlet weak var searchFilmes: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFilmes.delegate = self
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self
        loadPage(pag)
    }

    
    //MARK: - Funções
    
    func loadPage(_ pagina:Int){
        RequestFilmesTendenciaSemanaAPI().obtemTendenciasSemana(pagina) { (listaFilmess) in
            self.todosFilmes = listaFilmess
            self.filmes = self.todosFilmes
            self.colecaoFilmes.reloadData()
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func btnPreviousPage(_ sender: Any) {
        if self.pag > 1 {
            self.pag = pag - 1
            labelStatusPagina.text = "Página \(self.pag)"
            loadPage(self.pag)
            self.collectionBackBegin()
        }
    }
    
    @IBAction func btnNextPage(_ sender: UIButton) {
        self.pag = pag + 1
        labelStatusPagina.text = "Página \(self.pag)"
        loadPage(self.pag)
        self.collectionBackBegin()
    }
    
    func collectionBackBegin(){
        let firstIndexPath = IndexPath(item: 0, section: 0)
        self.colecaoFilmes.scrollToItem(at: firstIndexPath, at: .top, animated: true)
    }
}
        

//MARK: - Extensions

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate{
    
    
    // MARK: - SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filmes = self.todosFilmes
        if searchText != "" {
            let pesquisa = NSPredicate(format: "titulo contains[cd] %@", searchText)
            let filmesFiltrados:[Filme] = (filmes as NSArray).filtered(using: pesquisa) as! Array
            filmes = filmesFiltrados
        }
        self.colecaoFilmes.reloadData()
       
        let firstIndexPath = IndexPath(item: 0, section: 0)
        self.colecaoFilmes.scrollToItem(at: firstIndexPath, at: .top, animated: true)
    }
    
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! ListaFilmesCollectionViewCell
        
        let filmeAtual = filmes[indexPath.item]
        celulaFilme.formatCelula(filmeAtual)
        
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var widthCell: CGFloat
        
        widthCell = (collectionView.bounds.width / 2) - 10
        return CGSize(width: widthCell, height: widthCell+80)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filmeEscolhido = filmes[indexPath.item]
        
        _ = UIStoryboard(name: "Main", bundle: nil)
        let controlador = storyboard?.instantiateViewController(withIdentifier: "filmeDetalheMVVM") as! DetalheFilmeViewModelViewController //"filmeDetalhes") as! DetalhesFilmeViewController
        controlador.filmeSelecionado = filmeEscolhido
        self.navigationController?.pushViewController(controlador, animated: true)
        
    }

}


