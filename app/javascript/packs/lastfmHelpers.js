console.log("Loaded lastfmHelpers.js")

window.onpageshow = wonload

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
    document.querySelectorAll('div[name="trackWrapper"]').forEach(wrapper => {
        let trackName = wrapper.querySelector('span[class="trackName"]')
        let artist = wrapper.querySelector('span[class="artist"]')
        let moreTrackInfoWrapper = wrapper.querySelector('div[class="moreTrackInfoWrapper"]')
        let button = moreTrackInfoWrapper.querySelector('button[class="moreTrackInfoButton"]')
        button.addEventListener("click", function () {
            console.log("clicked")
            let moreTrackInfo = moreTrackInfoWrapper.querySelector('div[class="moreTrackInfo"]')
            if (moreTrackInfo.hidden === true) {
                fetch(`${window.location.protocol + "//" + window.location.host}/trackInfo?trackName=${encodeURIComponent(trackName.textContent.trim())}&artist=${encodeURIComponent(artist.textContent.trim())}`)
                    .then(response => response.json())
                    .then(data => {
                        console.log(data);
                        moreTrackInfo.textContent = '';
                        moreTrackInfo.appendChild(createH2("Artist:" + data.track.artist.name))
                        if (data.track.album) {
                            moreTrackInfo.appendChild(createH2("Album:" + data.track.album.title))
                        }
                        moreTrackInfo.appendChild(createH2("Playcount:" + data.track.playcount))
                        moreTrackInfo.appendChild(createH2("URL:" + data.track.url))
                    })
                    .catch(error => { console.log(error); moreTrackInfo.textContent = ''; });
            }
            moreTrackInfo.hidden = !moreTrackInfo.hidden
        })
    })
}

function createH2(text) {
    let h2 = document.createElement("h2");
    let textNode = document.createTextNode(text)
    h2.appendChild(textNode);
    return h2;
}

function createDiv() {
    let div = document.createElement("div");
    return div;
}

function lastfmImageSize() {
    if (document.querySelector('input[name="imagesize"]:checked')) {
        size = document.querySelector('input[name="imagesize"]:checked').value
        return size;
    }
    return "N/B"
}

