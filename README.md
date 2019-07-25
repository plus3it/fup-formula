# custom-yum-repo-formula

A [salt formula](https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html) to configure an Enterprise Linux (RHEL, CentOS, etc.) system to act as yum client for custom RPM repositories.

This formula is only designed to configure a host's yum repositories by way of repository-configuration RPMs. This formula does _not_ write `/etc/yum.repos.d` files, directly.

## Available States

###  custom-yum-repo

Set up customized yum repository definitions on Enterprise Linux

## Configuration

There is one configuration option:

*   `pkgs`

The `pkgs`, is a dictionary read from a salt grain (or pillar item of the same name) `custom-repos:lookup:pkgs`. The keys/values in this dictionary are the name of an RPM to be installed (e.g., `epel-release`) and the URL to that RPM (e.g., `https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm`)


The logic flow is as follows:

1.  If the `pkgs` grain has a non-null value, attempt to use the grain value(s) to install yum repository-definition RPMs
2.  Otherwise, if the `pkgs` pillar-item has a non-null value, attempt to use the pillar value(s) install yum repository-definition RPMs
3.  If neither of those conditions are met, exit silently
