{%- from "kubernetes/map.jinja" import storage with context -%}

include:
  - .driver
  - .config
  - .namespace
  {%- if storage.openebs.get('mayastor', {'enabled': False}).enabled %}
  - .mayastor
  - .storageclass
  {%- else %}
  - .install
  - .cstor
  - .jiva
  {%- endif %}
  # - .ingress
  

