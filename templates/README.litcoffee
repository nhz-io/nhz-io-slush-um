# <%= pkgDescription %>

[![Travis Build][travis]](https://travis-ci.org/nhz-io/nhz-io-<%= pkgNameSlug %>)
[![NPM Version][npm]](https://www.npmjs.com/package/@nhz.io/<%= pkgNameSlug %>)

## Install

```bash
npm i -S @nhz.io/<%= pkgNameSlug %>
```

## Usage
```bash
<%= pkgNameCamelCase %> = require('<%= pkgNameSlug %>')

...
```
## Imports

    # Package body here

## Exports

    module.exports = <%= pkgNameCamelCase %>

## Tests

    assert = require 'assert'

    # Tests here

    console.log 'pass'

## Version <%= pkgVersion %>

## License [MIT](LICENSE)

[travis]: https://img.shields.io/travis/nhz-io/nhz-io-<%= pkgNameSlug %>.svg?style=flat
[npm]: https://img.shields.io/npm/v/@nhz.io/<%= pkgNameSlug %>.svg?style=flat
