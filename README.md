<h1 align="center">🐇 MerelyFmt.nvim</h1>

<p align="center">
	A NeoVim plugin for formatting code and managing formatters.
</p>

<p align="center">
    <a href="https://github.com/Pocco81/MerelyFmt.nvim/stargazers"
        ><img
            src="https://img.shields.io/github/stars/Pocco81/MerelyFmt.nvim"
            alt="Repository's starts"
    /></a>
    <a href="https://github.com/Pocco81/MerelyFmt.nvim/issues"
        ><img
            src="https://img.shields.io/github/issues-raw/Pocco81/MerelyFmt.nvim"
            alt="Issues"
    /></a>
    <a href="https://github.com/Pocco81/MerelyFmt.nvim/blob/main/LICENSE"
        ><img
            src="https://img.shields.io/github/license/Pocco81/MerelyFmt.nvim"
            alt="License"
    /><br />
    <a href="https://saythanks.io/to/Pocco81%40gmail.com"
        ><img
            src="https://img.shields.io/badge/say-thanks-modal.svg"
            alt="Say thanks"/></a
    ></a>    <a href="https://github.com/Pocco81/whid.nvim/commits/main"
    <a href="https://github.com/Pocco81/MerelyFmt.nvim/commits/main"
		><img
			src="https://img.shields.io/github/last-commit/Pocco81/MerelyFmt.nvim/dev"
			alt="Latest commit"
    /></a>
    <a href="https://github.com/Pocco81/MerelyFmt.nvim"
        ><img
            src="https://img.shields.io/github/repo-size/Pocco81/MerelyFmt.nvim"
            alt="GitHub repository size"
    /></a>
</p>


<kbd><img src ="https://i.imgur.com/QBqYyyn.gif"></kbd>
<p align="center">
	Demo
</p><hr>

# TL;DR

<div style="text-align: justify">
	MerelyFmt.nvim is a NeoVim plugin written in Lua that focuses on managing multiple formatters. Everything from installation, configuration, setup, etc... can be done using MerelyFmt.nvim. To get started, install it with your favorite plugin manager and then install the formatters you'd like to use using the ':MFInstall <formatter>'.
</div>

# 🌲 Table of Contents

* [Features](#-features)
* [Notices](#-notices)
* [Installation](#-installation)
	* [Prerequisites](#prerequisites)
	* [Adding the plugin](#adding-the-plugin)
	* [Setup Configuration](#setup-configuration)
		* [For init.lua](#for-initlua)
		* [For init.vim](#for-initvim)
	* [Updating](#updating)
* [Usage](#usage)
	* [Commands](#commands)
	* [Api](#api)
* [Configuration](#-configuration)
	* [General](#general)
	* [formatters](#formatters)
	* [List of formatters](#list-of-formatters)
* [Contribute](#-contribute)
	* [Need Help](#need-help)
* [Inspirations](#-inspirations)
* [License](#-license)
* [FAQ](#-faq)
* [To-Do](#-to-do)

# 🎁 Features
- (Un)Installs formatters
- List installed formatters
- Can manage the configuration of every formatter [individually]
- Supports a wide range of formatters
- User-friendly CLI

# 📺 Notices
Checkout the [CHANGELOG.md](https://github.com/Pocco81/MerelyFmt.nvim/blob/main/CHANGELOG.md) file for more information on the notices below:

# 📦 Installation

## Prerequisites

- [NeoVim 0.5+](https://github.com/neovim/neovim/releases/tag/v0.5.0)

## Adding the plugin
You can use your favorite plugin manager for this. Here are some examples with the most popular ones:

### Vim-plug

```lua
Plug 'Pocco81/MerelyFmt.nvim'
```
### Packer.nvim

```lua
use "Pocco81/MerelyFmt.nvim"
```

### Vundle

```lua
Plugin 'Pocco81/MerelyFmt.nvim'
```

### NeoBundle
```lua
NeoBundleFetch 'Pocco81/MerelyFmt.nvim'
```

## Setup (configuration)
As it's stated in the TL;DR, there are already some sane defaults that you may like, however you can change them to match your taste. These are the defaults:
```lua
installation_path = vim.fn.stdpath("data") .. "/merelyfmt/"
```

The way you setup the settings on your configuration varies on whether you are using vimL for this or Lua.


<details>
    <summary>For init.lua</summary>
<p>

```lua
local merelyfmt = require("merelyfmt")

merelyfmt.setup {
	installation_path = vim.fn.stdpath("data") .. "/merelyfmt/"
}
```
<br />
</details>

<details>
    <summary>For init.vim</summary>
<p>

```lua
lua << EOF
local merelyfmt = require("merelyfmt")

merelyfmt.setup {
	installation_path = vim.fn.stdpath("data") .. "/merelyfmt/"
}
EOF
```
<br />
</details>

For instructions on how to configure the plugin, check out the [configuration](#configuration) section.

## Updating
This depends on your plugin manager. If, for example, you are using Packer.nvim, you can update it with this command:
```lua
:PackerUpdate
```

# 🤖 Usage

## Commands

All the commands follow the *camel casing* naming convention and have the `MF` prefix so that it's easy to remember that they are part of the MerelyFmt.nvim plugin. These are all of them:

For managing the formatters:

+ `:FMInstall <formatter>` installs `<formatter>`.
+ `:FMUninstall <formatter>` uninstalls `<formatter>`.
+ `:FMList` lists installed formatters.

For using the formatters:

+ `:FMFormat <formatter>` formatters current buffer with `<formatter>`.

## API

The API can be accessed by requiring it:

```lua
local mf_api = require("merelyfmt.api.<module>")
```

### Modules:

Currently there is only one module available, and it's the `formatters` module which has the following functions

```lua
mf_api.get_formatters()
```
> Returns table of available formatters.

```lua
mf_api.get_formatters_by_lang()
```
> Returns a table with available formatters organized by langs.

# 🐬 Configuration
Although settings already have self-explanatory names, here is where you can find info about each one of them and their classifications! 

## General
This settings are unrelated to any group and are independent.
- `installation_path`: (String) path to where the formatters will be installed. The only condition is that the path **must** end with a forward slash ("/")

### List of formatters

| Formatter                                    | MF Name  | Languages | Status |
|----------------------------------------------|----------|-----------|--------|
| (lua-fmt)[https://github.com/trixnz/lua-fmt] | `luafmt` | lua       | Tested |

* `Tested`: Fully supported
* `Supported`: Fully supported, but needs testing.
* `Experimental`: Still on the works.
* `Legacy`: No longer supported, please migrate your configuration.
* `Retired`: No longer included or supported.
* `Unsupported`: No implementation whatsoever.

# 🙋 FAQ

- Q: ***"How can I view the doc from NeoVim?"***
- A: Use `:help MerelyFmt.nvim`

# 🫂 Contribute
Pull Requests are welcomed as long as they are properly justified and there are no conflicts. If your PR has something to do with the README or in general related with the documentation, I'll gladly merge it! Also, when writing code for the project **you must** use the [.editorconfig](https://github.com/Pocco81/MerelyFmt.nvim/blob/main/.editorconfig) file on your editor so as to "maintain consistent coding styles". For instructions on how to use this file refer to [EditorConfig's website](https://editorconfig.org/).

## Need help
This is a list of things we currently need help with:

1. Testing the installers and reporting back via an issue
2. Correcting the installers that are broken
3. Creating new formatters

# 💭 Inspirations

The following projects inspired the creation of MerelyFmt.nvim. If possible, go check them out to see why they are so amazing :]
- [kabouzeid/nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall): Provides the missing :LspInstall for nvim-lspconfig

# 📜 License

MerelyFmt.nvim is released under the GPL v3.0 license. It grants open-source permissions for users including:

- The right to download and run the software freely
- The right to make changes to the software as desired
- The right to redistribute copies of the software
- The right to modify and distribute copies of new versions of the software

For more convoluted language, see the [LICENSE file](https://github.com/Pocco81/MerelyFmt.nvim/blob/main/LICENSE.md).

# 📋 TO-DO

**High Priority**
- Create more formatters, specially for major programming langs (Python, JavaScript, Rust, Golang)

**Low Priority**
- Finish DOC

<hr>
<p align="center">
	Enjoy!
</p>
