# Micro module generator (@nhz.io scoped)

[![Travis Build][travis]](https://travis-ci.org/nhz-io/nhz-io-slush-um)
[![NPM Version][npm]](https://www.npmjs.com/package/@nhz.io/slush-um)

## You get:

* **TDD Dev environment configured for tiny packages**
* **Literate Coffeescript template to start with (README.litcoffee)**
>
* `npm start` - to start TDD
* `npm build`
>
* [coffeescript 2]
* [coffeelint]
* [coffeetape]
* [faucet]
* [tape-async]
* [chokidar-cli]
* [husky]
>
* `.travis.yml` for scoped publish (public) - just set `NPM_AUTH_TOKEN`

## Install

```bash
npm i -g slush @nhz.io/slush-um
```

## Usage
```bash
mkdir um && cd um

slush @nhz.io/um
```

## Literate Source

### Imports

> Builtins

    path     = require 'path'

> General

    gulp     = require 'gulp'
    pump     = require 'pump'
    inquirer = require 'inquirer'

> Gulp plugins

    install  = require 'gulp-install'
    conflict = require 'gulp-conflict'
    template = require 'gulp-template'
    rename   = require 'gulp-rename'

> String utils imports

    slugify   = require 'slugify'
    camelcase = require 'camelcase'

## Default task

    gulp.task 'default', ->

      answers = await inquirer.prompt [
        {
          name: 'pkgName'
          message: 'Package name?'

> Strip scope prefix from default package name

          default: (path.basename process.cwd()).replace /^(nhz-io-)?/, ''
        }
        {
          name: 'pkgDescription'
          message: 'Description?'
        }
        {
          name: 'pkgVersion'
          message: 'Version?'
          default: '0.0.0'
        }
        {
          type: 'confirm'
          name: 'continue'
          message: 'Continue?'
        }
      ]

      return done() unless answers.continue

> Strip scope prefix from package name

      answers.pkgName = answers.pkgName.replace(/^nhz-io-/, '')

> Slugify

      answers.pkgNameSlug = slugify answers.pkgName, '-'

> Camel Case

      answers.pkgNameCamelCase = camelcase answers.pkgName

> Generate package

      pump [
        gulp.src __dirname + '/templates/**'

        template answers

        rename (f) -> if f.basename[0] is '_' then f.basename = ".#{ f.basename.slice 1 }"

        conflict './'

        gulp.dest './'

        install()
      ]


## Version 1.1.5
## License [MIT](LICENSE)

[travis]: https://img.shields.io/travis/nhz-io/nhz-io-slush-um.svg?style=flat
[npm]: https://img.shields.io/npm/v/@nhz.io/slush-um.svg?style=flat

[coffeescript 2]: https://github.com/jashkenas/coffeescript
[coffeelint]: https://github.com/clutchski/coffeelint
[coffeetape]: https://github.com/nhz-io/coffeetape
[faucet]: https://github.com/substack/faucet
[tape-async]: https://github.com/parro-it/tape-async
[chokidar-cli]: https://github.com/kimmobrunfeldt/chokidar-cli
[husky]: https://github.com/typicode/husky
