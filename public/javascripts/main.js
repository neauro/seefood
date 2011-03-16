function selectMenuItem(menu) {
  if ( menu.value == "other" ) {
    $('new-menu-item').removeClassName('hidden');
  } else {
    $('new-menu-item').addClassName('hidden');
  }
}
