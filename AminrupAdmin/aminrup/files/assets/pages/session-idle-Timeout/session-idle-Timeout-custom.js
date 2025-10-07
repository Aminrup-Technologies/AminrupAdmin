'use strict';
$(document).ready(function() {

    // Idle timeout
    //$.sessionTimeout({
    //    heading: 'h5',
    //    title: 'Idle Timeout',
    //    message: 'Your session is about to expire due to inactivity. Do you want to stay connected?',
    //    warnAfter: 900000,
    //    redirAfter: 1200000,
    //    keepAliveUrl: 'KeepAlive.aspx',
    //    redirUrl: '../../lock_screen.aspx',
    //    logoutUrl: '../../index.aspx'
    //});
    
    // Idle timeout 
    $.sessionTimeout({ heading: 'h5', title: 'Idle Timeout', message: 'Your session is about to expire. Do you want to stay connected?', warnAfter: 3000, redirAfter: 10000, keepAliveUrl: 'KeepAlive.aspx', redirUrl: '../../lock_screen.aspx', logoutUrl: '../../index.aspx' });
});