
let productPrice;
let productEndTime;
let totBidCount;
let currentBid;

let maxBidAmount;
let isAutoBid = false;

const checkbox = document.getElementById('autobidToggle');

checkbox.addEventListener('change', function() {
    if (checkbox.checked) {
        startAutoBid();
    } else {
        endAutoBid();
    }
});

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

            productPrice = data.product.basePrice;
            productEndTime = data.product.time;
            totBidCount = data.product.bidHistory.length;

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

            const BidContainer = document.getElementById("bidContainer");
            const item = document.getElementById("idItem");

            let bidHistoryArray = data.product.bidHistory;

            if(bidHistoryArray.length == 0){
                let nextBid = data.product.basePrice + 10;
                document.getElementById("nextBid").innerHTML = "Next minimum bid: $"+nextBid+".00";
                document.getElementById("bidAmount").value = nextBid;
            }else{
                let bid = bidHistoryArray[bidHistoryArray.length-1]
                currentBid = bid.price;
                let nextBid = bid.price + 10;
                document.getElementById("nextBid").innerHTML = "Next minimum bid: $"+nextBid+".00";
                document.getElementById("bidAmount").value = nextBid;
                document.getElementById("pCBid").innerHTML = "$"+bid.price+".00";
                document.getElementById("cBid2").innerHTML = "$"+bid.price+".00";
            }




            data.product.bidHistory.forEach(bid => {
                let clone = item.cloneNode(true);

                clone.querySelector("#bidName").innerHTML = bid.user.name;
                clone.querySelector("#bidPrice").innerHTML = "$"+bid.price+".00";
                clone.querySelector("#bidTime").innerHTML = convertToShortTime(bid.time);

                clone.classList.remove("d-none");

                BidContainer.appendChild(clone);
            });

            scrollToBottom();

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

function startWebSocket() {

    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get('id');

    const socketUrl = `ws://localhost:8080/bids/${productId}`;
    socket = new WebSocket(socketUrl);

    socket.onopen = () => {
        console.log("WebSocket connected for product " + productId);
    };

    socket.onmessage = (event) => {

        const data = JSON.parse(event.data);

        currentBid = data.price;
        console.log("Received from server: ", data);

        const BidContainer = document.getElementById("bidContainer");
        const item = document.getElementById("idItem");

            let clone = item.cloneNode(true);

            clone.querySelector("#bidName").innerHTML = data.user.name;
            clone.querySelector("#bidPrice").innerHTML = "$"+data.price+".00";
            clone.querySelector("#bidTime").innerHTML = convertToShortTime(data.time);

            clone.classList.remove("d-none");

            BidContainer.appendChild(clone);

            scrollToBottom();

            document.getElementById("pCBid").innerHTML = "$"+data.price+".00";
            document.getElementById("cBid2").innerHTML = "$"+data.price+".00";

            let nextBid = data.price + 10;
            document.getElementById("nextBid").innerHTML = "Next minimum bid: $"+nextBid+".00";

            document.getElementById("bidAmount").value = nextBid;


        document.getElementById("pBidCount1").innerHTML = totBidCount+1 + " bids placed";
        document.getElementById("pBidCount2").innerHTML = totBidCount+1 + " bids placed";

        totBidCount = totBidCount+1;

        if(isAutoBid){
            if(data.price >= maxBidAmount){

                endAutoBid();

                Swal.fire({
                    icon: "info",
                    title: "AutoBid Ended!",
                    text: "Your max bid amount exceeded!",
                });

                isAutoBid = false;
                maxBidAmount = "";
                checkbox.checked = false;


            }
        }else{
            let price = data.price+50
            document.getElementById("maxBid").value = price;
        }

    };

    socket.onclose = () => {
        console.log("WebSocket connection closed");
    };

    socket.onerror = (error) => {
        console.error("WebSocket error: ", error);
    };

    return socket;
}

async function placeBid(){
    let amount = document.getElementById("bidAmount").value;
    const urlParams = new URLSearchParams(window.location.search);

    if(isTimePassed(productEndTime)){
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Auction ended!",
        });

        return;
    }

    if(amount <= currentBid){

        let next = currentBid+10

        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Bid amount should be at least $"+next+".00",
        });

        return;
    }

    if(amount <= productPrice){
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Invalid Bid amount!",
        });

        return;
    }

    const reqData = {
        pid : urlParams.get('id'),
        amount:amount,
    }

    const response = await fetch("http://localhost:8080/send", {
        method: "POST",
        body: JSON.stringify(reqData),
        headers: {
            "Content-Type": "application/json",
        }
    });

    if(response.ok) {
        const data = await response.json();
        console.log(data);

        if(data.isSuccess){
            Swal.fire({
                title: "Success",
                text: "Bids placed!",
                icon: "success"
            });
        }else{
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: data.msg+"!",
            });
        }

    }

}

function convertToShortTime(str) {
    const date = new Date(str);
    return date.toLocaleTimeString('en-US', {
        hour: 'numeric',
        minute: '2-digit',
        second: '2-digit',
        hour12: true
    });
}

function scrollToBottom() {
    const container = document.getElementById('bidContainer');
    container.scrollTop = container.scrollHeight;
}

function isTimePassed(timeStr) {
    const givenTime = new Date(timeStr);
    const now = new Date();
    return givenTime < now;
}

async function startAutoBid(){
    let amount = document.getElementById("maxBid").value;
    const urlParams = new URLSearchParams(window.location.search);

    if(isTimePassed(productEndTime)){
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Auction ended!",
        });
        checkbox.checked = false;
        return;
    }

    if(amount == ""){
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Please enter a max value!",
        });
        checkbox.checked = false;
        return;
    }

        let next = currentBid+50

    if(amount < next ){

        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Max amount should be at least $"+next+".00",
        });
        checkbox.checked = false;
        return;
    }


    const reqData = {
        pid : urlParams.get('id'),
        amount:amount,
    }

    const response = await fetch("http://localhost:8080/autoBid", {
        method: "POST",
        body: JSON.stringify(reqData),
        headers: {
            "Content-Type": "application/json",
        }
    });

    if(response.ok) {
        const data = await response.json();
        console.log(data);

        if(data.isSuccess){
            maxBidAmount = amount;
            isAutoBid = true;
            Swal.fire({
                title: "Success",
                text: "Auto bid started!",
                icon: "success"
            });
        }else{
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: data.msg+"!",
            });
        }
    }
}

async function endAutoBid(){
    const urlParams = new URLSearchParams(window.location.search);

    const reqData = {
        pid : urlParams.get('id'),
    }

    const response = await fetch("http://localhost:8080/autoBidEnd", {
        method: "POST",
        body: JSON.stringify(reqData),
        headers: {
            "Content-Type": "application/json",
        }
    });

    if(response.ok) {
        const data = await response.json();
        console.log(data);

    }
}

