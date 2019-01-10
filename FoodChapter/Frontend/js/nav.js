// Simple offscreen navigation menu

let menuSel    = '#menu-toggle';
let navbarSel  = '#navbar1';
let overlaySel = '#overlay';
let blurSel    = '#header';
let icon0 = 'fa-bars', icon1 = 'fa-times'; 

$(document)
  .on('click', menuSel+'[data-menu="closed"]', function() { // [ Show menu ]
    let i = 0;
    $(this).attr('data-menu', 'opened'); // Toggle menu state
    $(overlaySel).fadeIn(); // Show overlay
    $(navbarSel).find('li').each(function() { // Slide elements to view
      $(this).stop(true, true).delay((++i)*100)
             .animate({left : '0px'}, { duration : 400 })
             .fadeIn({queue: false});
    });
    $('.'+icon0).fadeOut(100, function() { // Switch menu icon
      $(this).removeClass(icon0).addClass(icon1).fadeIn(); 
    }); 
    $(blurSel).addClass('blur');
  })
  .on('click', menuSel + '[data-menu="opened"], ' + overlaySel, function() { // [ Hide menu ]
    $(menuSel).attr('data-menu', 'closed'); // Toggle menu state
    $(overlaySel).fadeOut(); // Remove overlay
    $(navbarSel).find('li') // Slide menu items back
      .animate( { left : '-40rem' }, { duration : 300 })
      .fadeOut({queue: false});
    
    $(menuSel + ' a').fadeOut(100, function() { // Switch menu icon
      $(this).find($('i')).removeClass(icon1).addClass(icon0);
      $(this).fadeIn();
    });
    $(blurSel).removeClass('blur');
  })