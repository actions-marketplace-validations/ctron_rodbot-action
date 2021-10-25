# rodbot Action

Allows to easily run [Rodney Bot](https://github.com/ctron/rodbot).

## Example

~~~yaml
name: RodBot

on:
  issue_comment: {}

jobs:
  rodbot:
    runs-on: ubuntu-20.04

    env:
      GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}

    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - uses: ctron/rodbot-action@v0.1.1
~~~

With `rodbot.yaml` in the root of your repository:
~~~yaml
on:
  issue_comment:
    - if:
        - command: "test"
        - user_is: ["MEMBER", "OWNER"]
        - is_pr
      steps:
        - run: |
            gh pr comment ${{ github.event.issue.number }} -b "Aye, aye, captain!"
~~~