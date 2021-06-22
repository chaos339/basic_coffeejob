# basic_coffeejob
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
git clone https://github.com/chaos339/basic_coffeejob
```
### Manually
- Download this resource and put it in your resources folder.

## Installation
- Add this to your `server.cfg`:

```
ensure basic_coffeejob
```
## Optional
* Run `coffeejob.sql` in your database to add items in your `items` table.

### License
basic_coffeejob - basic coffee job script for esx.


This script Is free: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This script is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
