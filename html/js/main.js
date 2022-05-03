$(function () {
	window.addEventListener('message', function (event) {
		var data = event.data;

		if (data.type === "online-count") {
			setCurrentOnlineCount(data.onlineCount);
		} else if (data.type === "online-id") {
			setCurrentOnlineID(data.onlineID);
		} else if (data.type === "money") {
			setCurrentMoney(data.money);
		} else if (data.type === "black_money") {
			setCurrentDirty(data.money);
		} else if (data.type === "bank") {
			setCurrentBank(data.money);
		} else if (data.action === "hideUi") {
			if (data.value === true) {
				$("#ui").hide();
			} else {
				$("#ui").show();
			}
		} else if (data.action === "fadeUi") {
			if (data.value === true) {
				$("#ui").hide(500);
			} else {
				$("#ui").show(500);
			}
		} 
	})
})

function setCurrentOnlineCount(onlineCount) {
    document.getElementById("online-count").innerHTML = onlineCount;
}

function setCurrentOnlineID(onlineID) {
    document.getElementById("online-id").innerHTML = onlineID;
}

function setCurrentMoney(money) {
    document.getElementById("hmoney").innerHTML = money;
}

function setCurrentBank(money) {
    document.getElementById("hbank").innerHTML = money;
}

function setCurrentDirty(money) {
    document.getElementById("hdark").innerHTML = money;
}