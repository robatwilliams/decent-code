# HTML

**Avoid using the `id` attribute, generally.** It's not valid to use the same id value multiple times on a page. In an application composed of multiple components, some having multiple instances, it's easy to violate that requirement. The attribute is however useful for links that scroll to specific locations on the page.

**Use semantic markup.** There are many elements other than `<div>` and `<span>`, which convey meaning. Use them where appropriate, for example: headings, sections, forms, and paragraphs.

**Avoid using classes for anything other than CSS.** Selectors using classes are often used to programmatically select particular elements, for example in JavaScript code or integration tests. When modifying markup and CSS, it's easy to forget these less-visible usages - leading to breakages. Use dedicated custom attributes (e.g. `data-id`, `test-id`) instead.
