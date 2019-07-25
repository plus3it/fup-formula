#
# Salt state for downloading and installing a yum repository-
# definition RPM from a specified URL
#
#################################################################
{%- from tpldir ~ '/map.jinja' import join_domain with context %}

{#- Set location for helper-files #}
{%- set files = tpldir ~ '/files' %}

{#- fetch our rpms/urls as a dict #}
{%- set repo_dict = salt.grains.get(
    'custom-repos:lookup:pkgs',
    salt.pillar.get('custom-repos:lookup:pkgs')
) %}


{#- Iterate over the dict #}
{%- for rpm, repo in repo_dict.iteritems() %}
spelRepo-install-{{ rpm }}:
  pkg.installed:
    - sources:
      - {{ rpm }}: {{ repo }}
    - allow_updates: True
    - skip_verify: True
{%- endfor %}

