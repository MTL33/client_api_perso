const urlAPI = "http://localhost:8888/api_php-supra/"
const catListe = document.querySelector('.categories-list')
console.log(catListe)

// Listing des catégories

fetch(urlAPI + 'categories')
    .then(response => response.json())
    .then(response => {
        console.log(response);
        let template = ''
        response.data.forEach(category => {
            template += `<li data-id="${category.id}">${category.label}</li>`
    });
    catListe.innerHTML = template
})

    .catch(error => console.error(error))

  
    

