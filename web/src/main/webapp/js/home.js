async function loadHome() {
    const response = await fetch("http://localhost:8080/loadHome",{
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        }
    });

    if(response.ok) {
        const data = await response.json();
        console.log(data);

        if(data.isSuccess){

            const container = document.getElementById("container");
            const product = document.getElementById("product");

            container.innerHTML="";

            data.products.forEach(item => {
                let pClone = product.cloneNode(true);

                pClone.querySelector("#pImg").src = item.image
                pClone.querySelector("#pTitle").innerHTML = item.name;
                pClone.querySelector("#pPrice").innerHTML = "$"+item.basePrice;
                pClone.querySelector("#pBtn").href = "http://localhost:8080/product.jsp?id=" + item.id;

                container.appendChild(pClone);
            });

        }

    }
}

async function login() {
    const email = document.getElementById("loginEmail").value;
    const password = document.getElementById("loginPassword").value;

    if(email == ""){
        alert("Please enter valid email");
        return;
    }else if(password == ""){
        alert("Please enter your password");
        return;
    }

    const reqData = {
        email: email,
        password: password
    };

    const response = await fetch("http://localhost:8080/login", {
        method: "POST",
        body: JSON.stringify(reqData),
        headers:{
            "Content-Type": "application/json"
        }
    });

    if (response.ok) {
        const data = await response.json();
        console.log(data);

        if(data){
            window.location.reload();
        }else{
            alert("Invalid login credentials");
        }
    }
}