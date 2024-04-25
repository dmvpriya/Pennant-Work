window.onload = function() {
    populateFromDropdown();
};

function populateFromDropdown() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var fromDropdown = document.getElementById("FromDropdown");
                var stations = xhr.responseText;
                fromDropdown.innerHTML = stations;
            } else {
                console.error('Error: ' + xhr.status);
            }
        }
    };

    xhr.open('POST', 'AllStationsServlet', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send();
}