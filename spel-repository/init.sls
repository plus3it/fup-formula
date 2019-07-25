#
# Salt state for downloading and installing a yum repository-
# definition RPM from a specified URL
#
#################################################################
{%- from tpldir ~ '/map.jinja' import join_domain with context %}

{#- Set location for helper-files #}
{%- set files = tpldir ~ '/files' %}

{%- if rpm_url %}
spelRepo-install:
  pkg.installed:
    - sources: {{ rpm_url|yaml }}
    - allow_updates: True
    - skip_verify: True

{%- endif %}

