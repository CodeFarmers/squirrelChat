//This is the client part of Faye. This code will be loaded by your browser.
//This function evaluates the data that the Faye server sends.
$(function() {
    var faye = new Faye.Client('http://localhost:9292/faye');
    faye.subscribe("/posts/new", function(data) {
        eval(data);
    })
})