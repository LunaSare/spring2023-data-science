---
layout: page
title: Contact Us
---

{% if site.github.repo == 'https://github.com/datacarpentry/semester-biology' %}

: <a href="{{ site.github.repo }}">
  <i class="fa fa-github fa-fw"></i> On GitHub</a>
: <a href="mailto:{{ site.email }}">
  <i class="fa fa-envelope fa-fw"></i> Via Email</a>
{% else %}
With questions, issues, tips, tricks and more for: <br>

- this Course Website and Materials <a href="{{ site.github.repo }}">
  <i class="fa fa-github fa-fw"></i> On GitHub</a> |
  <a href="mailto:{{ site.email }}">
  <i class="fa fa-envelope fa-fw"></i> Via Email</a>
<br>

- the Original Course Website and Materials <a href="https://github.com/datacarpentry/semester-biology">
  <i class="fa fa-github fa-fw"></i> On GitHub</a> |
  <a href="mailto:datacarpentrysemester@weecology.org">
  <i class="fa fa-envelope fa-fw"></i> Via Email</a>
{% endif %}
