console.log("Loaded lastfmHelpers.js")

window.onload = wonload

function wonload() {
    let prevSize = "medium"
    document.querySelectorAll(`img[name=${prevSize}]`).forEach(img => {
        img.hidden = false;
    })
    document.querySelectorAll('input[name="imagesize"]').forEach(input => {
        input.addEventListener("change", function () {
            console.log("changed!")
            let size = lastfmImageSize();
            console.log(size)
            document.getElementById("size").innerText = size;
            document.querySelectorAll(`img[name=${prevSize}]`).forEach(img => {
                img.hidden = true;
            })
            document.querySelectorAll(`img[name=${size}]`).forEach(img => {
                img.hidden = false;
                prevSize = size;
            })
        })
    })
}

function lastfmImageSize() {
    if (document.querySelector('input[name="imagesize"]:checked')) {
        size = document.querySelector('input[name="imagesize"]:checked').value
        return size;
    }
    return "N/B"
}