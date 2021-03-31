//
//  ViewController.swift
//  CineFlex
//
//  Created by Jonattan Moises Sousa on 26/03/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    
    //MARK: - Variáveis
    
    var filmes = [Filme]()
    var contador = 0
    var pag = 1
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    @IBOutlet weak var labelStatusPagina: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.requestApiAlamofire()
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self
        loadPage(pag)
    }

    
    //MARK: - Funções
    
    func loadPage(_ pagina:Int){
        RequestFilmesTendenciaSemanaAPI().obtemTendenciasSemana(pagina) { (listaFilmess) in
            self.filmes = listaFilmess
            self.colecaoFilmes.reloadData()
        }
    }
    
    // MARK: - IBOutlets
    
    @IBAction func btnPreviousPage(_ sender: Any) {
        if self.pag > 1 {
            self.pag = pag - 1
            labelStatusPagina.text = "Página \(self.pag)"
            loadPage(self.pag)
        }
    }
    
    @IBAction func btnNextPage(_ sender: UIButton) {
        self.pag = pag + 1
        labelStatusPagina.text = "Página \(self.pag)"
        loadPage(self.pag)
    }
}
        

//MARK: - Extensions

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
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
        let controlador = storyboard?.instantiateViewController(withIdentifier: "filmeDetalhes") as! DetalhesFilmeViewController
        controlador.filmeSelecionado = filmeEscolhido
        self.navigationController?.pushViewController(controlador, animated: true)
        
    }

}


