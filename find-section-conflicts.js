// Find sections with same IDs which would cause incorrect anchor links
(function() {
  const sections = [...document.querySelectorAll('[id]')].map(e => e.id);

  const conflicts = sections.filter(section => {
      return !!sections.find(other => section.match(new RegExp(other + '-[0-9]')));
  });

  console.log('Conflicts: ', conflicts);
})();
