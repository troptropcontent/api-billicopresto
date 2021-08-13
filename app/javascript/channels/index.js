// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


document.body.addEventListener('click', function(e){
    var target = e.target;
    if(target.classList.contains('anim')) {
        setTimeout(function() {
            if(target.dataset) window.location = target.dataset.redirect;
            else window.location = target.getAttribute('href');
            }, 1000);
    }
}, false);