# spel-repository-formula
Enterprise Linux salt formula to configure a system to act as yum client for custom RPM repositories

## Available States

### spel-repository

Set up customized yum repository definitions on Enterprise Linux

## Configuration

There is one configuration option:

*   `repo_rpm_url`

The `repo_rpm_url`, is read from a salt grain, `spel-repository:repo_rpm`, or
a pillar key, `spel-repository:lookup:repo_rpm`.


The logic flow is as follows:

1.  If the repo_rpm grain has a value that matches the pattern, use the
    grain value.
2.  Otherwise, if the repo_rpm pillar has a value that matches the pattern,
    use the pillar value.
3.  If neither of those conditions are met, exit with failure condition.
