async function loadHome() {

    const urlParams = new URLSearchParams(window.location.search);

    const reqData = {
        id : urlParams.get('id'),
    }

    const response = await fetch("http://localhost:8080/loadProduct", {
        method: "POST",
        body: JSON.stringify(reqData),
        headers: {
            "Content-Type": "application/json",
        }
    });

    if (response.ok) {
        const data = await response.json();
        console.log(data);

        if(data.isSuccess){

            document.getElementById("pImg").src = data.product.image;
            startCountdown(data.product.time);
            document.getElementById("pTitle").innerHTML = data.product.name;
            document.getElementById("pDescr").innerHTML = data.product.description;
            document.getElementById("pPrice").innerHTML = "$"+ data.product.basePrice + ".00";
            document.getElementById("pBasePrice2").innerHTML = "$"+ data.product.basePrice + ".00";

            document.getElementById("pBasePrice").innerHTML = "$"+ data.product.basePrice;
            // document.getElementById("pCBid").innerHTML = "$"+ data.product.basePrice;

            document.getElementById("pBidCount1").innerHTML = data.product.bidHistory.length + " bids placed";
            document.getElementById("pBidCount2").innerHTML = data.product.bidHistory.length + " bids placed";

        }

    }
}

function startCountdown(endTimeStr) {
    const endTime = new Date(endTimeStr);
    const span = document.getElementById("pTime");

    function updateCountdown() {
        const now = new Date();
        const diff = endTime - now;

        if (diff <= 0) {
            span.textContent = "Auction ended";
            clearInterval(timer);
            return;
        }

        const minutes = Math.floor(diff / 1000 / 60);
        const seconds = Math.floor((diff / 1000) % 60);

        span.textContent = `Ends in ${minutes}m ${seconds}s`;
    }

    const timer = setInterval(updateCountdown, 1000);
    updateCountdown();
}
