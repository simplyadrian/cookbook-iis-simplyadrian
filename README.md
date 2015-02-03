iis-nativex Cookbook
====================
This cookbook configures a windows server with IIS roles and features for NativeX purposes

Requirements
------------

#### cookbooks
- `windows` - iis-nativex needs windows to install features and pacakages.

Attributes
----------

#### iis-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['iis-nativex']['features']</tt></td>
    <td>String</td>
    <td>A list of IIS features you want to have installed on your web server.</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

Usage
-----
#### iis-nativex::default

Just include `iis-nativex` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[iis-nativex]"
  ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera
