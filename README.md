# esx_coffeejob
Basic coffee job script for esx.

## Features
* Easy Configurations. Read Comments in the files for more information.
* Possibility to add more items or change current items that can be used and made in the kitchen.

## Requirements
* [es_extended](https://github.com/esx-framework/es_extended/tree/v1-final).
* [esx_addonaccount](https://github.com/esx-framework/esx_addonaccount).
* [skinchanger](https://github.com/esx-framework/skinchanger).
* [esx_skin](https://github.com/esx-framework/esx_skin).

## Configurations
* In the coffeejob.lua, you can change the location of the working spots and the blip. You can add more working spots if you want to, You can also configure the menu whether you want
to add more items that can be created or remove some of it. Do not forget to change the 'x' in the job.name (Line 50, Line 74, Line 101) into whatever job you plan to set it to.
* You can also change the emote that will be executed when you decide to make an item. (Line 125, Line 132) In order to make it more realistic.
* Do not forget to add the items that will be used and will be made in your `items` table in your database. I had an sql file ready if you want to use it to add the items
to your database. OR you can just manually do it. The items are in the `server.lua` file.

## Download & Installation
### Using Git
```
cd resources
git clone https://github.com/chaos339/esx_coffeejob
```
### Manually
- Download this resource and put it in your resources folder.

## Installation
- Add this to your `server.cfg`:

```
ensure esx_coffeeshop
```
## Optional
* Run `coffeejob.sql` in your database to add items in your `items` table.
