# ReleaserKey

Tired to manually publish releases! Let this action publish releases on push when the commit message contains a given keyword. The keywork lookup is case insensitive.

## Environment Variables

-   `GITHUB_TOKEN` (Required) - Allows the action to authenticate with the GitHub API to create the release

## Arguments

-   (Required): The keyword to search for in the commit message that will trigger the release

## Examples

```yaml
name: Auto Release
on: push

jobs:
    release:
        runs-on: [ubuntu-latest]
        steps:
            - uses: action/checkout@v2
            - uses: StephenRoille/action-f9e67883be@master
              with:
                  args: "fix"
              env:
                  GITHUB_TOKEN: "${{ secrets.GITHUB_TOKEN }}"
```
