const urlAPI = "http://localhost:8888/api_php-supra/"
const connectForm = document.querySelector('.connexion')
console.log(connectForm);

connectForm.addEventListener('submit', (e) => {

        e.preventDefault()
        let ident = {
            login: document.querySelector('.login').value,
            password: document.querySelector('.password').value
        }
 
        console.log(ident);
        fetch(urlAPI + 'auth', {
            method: 'POST',
            headers: {
                'Content-Type' : 'application/json'
            },
            mode: "no-cors",
            body: JSON.stringify(ident)
        })
        .then(response => {
            response.json()
        })
        .then(response => {
            console.log(response)
        })
   .catch(error => console.error(error))

})
