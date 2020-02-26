// ==UserScript==
// @name         fresh_refresher
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  refresh some websites every hour
// @author       You
// @match        https://blog.fefe.de/
// @match        https://altschauerberganzeiger.com/
// @match        https://kachelmannwetter.com/de/wetter/2886242-koeln
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    const dt = new Date();
    console.log('init refresh: ', dt.toLocaleTimeString('en-US'));

    dt.setHours(dt.getHours() + 1);
    console.log('next refresh at ', dt.toLocaleTimeString('en-US'));

    setTimeout(function(){ location.reload(); }, 60*60000);
})();
