### Commit Format
The commit format should always be:

``<type>(<scope>): <message>``
You may add a long message after this initial format, after 2 new lines, which can be used to describe further what the commit does.

Each commit should be as small as possible for the given type and scope.

The type may be one of:
```
feat: a new feature
fix: a bug fix
perf: performance enhancement
docs: documentation update
refactor: refactoring
test: add/change/remove unit tests
style: style change (update indentation), change spaces to tabs, …)
chore: configuration update, code signing change, …
The refactor, test, style and chore type are hidden from the changelog in the product slack channel.
```

## Examples:
```
chore(*): run dart format
feat(settings/GAG-123): add toggle allowing user to switch to dark mode
fix(library/TAM-1010): fix issue where local storage success popup would not display on iphone 6+
perf(discover,library/TAM-1234): improve video playback performance by leveraging GPU
docs(readme): add architecture information
refactor(live-capture): de-dupe duplicated code
test(api): add tests related to API model parsing
style(*): convert spaces to tabs
chore(code-signing): fix code-signing issues
```


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutterapp/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- api/
    |- entities/(Model class for APIs)
    |- api_constants.dart
    |- api_names.dart
|- bloc/
|- core/
    |- cache/
    |- error/
    |- network/
    |- utils/
|- extension/
|- inject/
|- services/
|- ui/
|- main.dart
```

## Scripts:
Please execute `formatter.sh` to format dart files. The script must be executed this script before creating a PR.
```
./scripts/formatter.sh
```

Here is a script for generate `*.g.dart`
```
./scripts/build_runner.sh
```
