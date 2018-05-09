(function () {
    window.onload = function () {
        var circle = document.getElementById('bar');
        console.log(circle)
        var progress = 0;
        var r = circle.getAttribute('r');
        var c = 2 * r * Math.PI;
        setInterval(() => {
            progress = (progress + 1) % 101;
            circle.style.strokeDashoffset = c - progress / 100 * c;
            this.document.getElementById('pct').setAttribute('data-pct', progress);
        }, 200);
    }
}).call(this);