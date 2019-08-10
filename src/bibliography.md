---
layout: page
permalink: /bibliography/
---

# Публикации

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis 'aute irure dolor in reprehenderit in voluptate' {% cite derrida:purveyor %}
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
cupidatat non proident, 'sunt in culpa qui officia deserunt mollit anim id est
laborum' {% cite web:basegroup.ru:real_coded_ga %}.

[//]: # "This is a comment, it will not be included"
[//]: # "in  the output file unless you use it in"
[//]: # "a reference style link."
[//]: # "This may be the most platform independent comment"

Duis 'aute irure dolor in reprehenderit in voluptate' {% cite breton:surrealism %}
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
cupidatat non proident, 'sunt in culpa qui officia deserunt mollit anim id est
laborum' {% cite web:makeingsimpleGA %}.

Duis 'aute irure dolor in reprehenderit in voluptate' {% cite breton:surrealism %}
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
cupidatat non proident, 'sunt in culpa qui officia deserunt mollit anim id est
laborum' {% cite web:makeingsimpleGA ruby %}.

When quoting multiple items (see above) you can add multiple locators after the list of ids. For example, {% cite ruby microscope -l 2 -l 24 & 32 %}.

{% quote book:Matveev2008 %}
Lorem ipsum dolor sit amet, consectetur adipisicing elit,
sed do eiusmod tempor.

Lorem ipsum dolor sit amet, consectetur adipisicing.
{% endquote %}

## Только упоминаемые

{% bibliography --cited %}

## Список литературы полный

{% bibliography %}
