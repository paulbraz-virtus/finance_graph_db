# {{ domain_name }} TOC

## Business Processes
{% for i in business_processes %}
- [{{ i }}](/{{ i | replace(" ", "-") }}.md){% endfor %}

## Systems
{% for i in systems %}
- [{{ i }}](/{{ i | replace(" ", "-") }}.md){% endfor %}

## Applications
{% for i in applications %}
- [{{ i }}](/{{ i | replace(" ", "-") }}.md){% endfor %}

## Data
{% for i in data_domains %}
- [{{ i }}](/{{ i | replace(" ", "-") }}.md){% endfor %}
