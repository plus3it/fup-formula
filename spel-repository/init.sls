#
# Salt state for downloading and installing a yum repository-
# definition RPM from a specified URL
#
#################################################################
{%- from tpldir ~ '/map.jinja' import join_domain with context %}

{#- Set location for helper-files #}
{%- set files = tpldir ~ '/files' %}

{%- set rpm_url = salt.grains.get(
    'spel-repository:lookup:repo_rpm_url',
    salt.pillar.get('spel-repository:lookup:repo_rpm_url')
) %}

{%- set rpm_name = salt.grains.get(
    'spel-repository:lookup:repo_rpm_name',
    salt.pillar.get('spel-repository:lookup:repo_rpm_name')
) %}


{%- if rpm_url %}
spelRepo-install:
  pkg.installed:
    - sources:
      - {{ rpm_name }}: {{ rpm_url }}
    - allow_updates: True
    - skip_verify: True

{%- endif %}

