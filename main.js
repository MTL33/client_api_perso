const urlAPI = "http://localhost:8888/api_php-supra/"
const catListe = document.querySelector('.categories-list')
const catTitle = document.querySelector('.categories-title')
const prdListe = document.querySelector('.produits-list')
console.log(prdListe)

// Listing des catégories

fetch(urlAPI + 'categories')
    .then(response => response.json())
    .then(response => {
        console.log(response);
        let template = ''
        response.data.forEach(category => {
            template += `<li class="cat-items" data-id="${category.id}">${category.label}</li>`
        });
        catListe.innerHTML = template
    })

    .catch(error => console.error(error))

// récup d'une catégorie
const fetchCategory = (id = 1) => {
// Listing des catégories + PRODUIT
fetch(urlAPI + 'categories/' + id)
    .then(response => response.json())
    .then(response => {
        console.log(response);
        let template = ''
        if(response.produits.data) {
        
        response.produits.data.forEach(produits => {
            template += `<li data-id="${produits.id}">${produits.label}</li>`
        });
    }
        prdListe.innerHTML = template
        
        catTitle.innerText = `"${response.data[0].label}"`
    })

    .catch(error => console.error(error))
} 

fetchCategory()

catListe.addEventListener('click', (e) => {
    if (e.target.classList.contains('cat-items')) {
        //alert(e.target.dataset.id)
        fetchCategory(e.target.dataset.id)
    }
})