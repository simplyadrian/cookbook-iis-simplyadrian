iis-simplyadrian Cookbook
====================
This cookbook configures a windows 2012 server with IIS roles and features. Creates IIS application pools which are configurable with attributes as well as IIS sites, which are also configurable by attributes.

Requirements
------------

#### cookbooks
- `iis` - iis-simplyadrian leverages the LWRP's in the community iis cookbook to perform the bulk of the configurations.
- `windows` - iis-simplyadrian requires the 'windows_feature' and 'windows_package' resources to install features and packages.

* Chef 11 or higher

#### Supported OS Distributions
Tested on:

* Windows Server 2012 R2 (windows 6.3.9600)

Recipes
----------
The provided recipes are:

* `iis-simplyadrian::default`: The main recipe that:
  * Installs Microsoft Web Deploy v 3.5
  * It also includes recipes iis-simplyadrian::add-windows-feature", "iis-simplyadrian::create-app-pool" and"iis-simplyadrian::create-config-sites"
* `iis-simplyadrian::add-windows-feature`:
  * Installs all windows features listed in the ['iis-simplyadrian']['features'] attribute listing.
* `iis-simplyadrian::config-iis-cmd`:
  * Runs a config command on your IIS instance. Using the "appcmd.exe set config" utility and syntax.
* `iis-simplyadrian::create-app-pool`:
  * Creates and configures the application pools defined in ['iis-simplyadrian']['enabled_pools'] attribute.
* `iis-simplyadrian::create-config-sites`:
  * Creates and configures the IIS sites defined in ['iis-simplyadrian']['enabled_sites'] attribute.
* `iis-simplyadrian::install-ARR-features`:
  * Installs the ARR feature manually.
* `iis-simplyadrian::install-ARR-helper`:
  * Installs the ARR Helper msi
  * Lays down a templated configuration schema.

Attributes
----------

#### iis-simplyadrian::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['features']</tt></td>
    <td>String</td>
    <td>A list of IIS features you want to have installed on your web server.</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['enabled_pools']</tt></td>
    <td>Array</td>
    <td>A set of key pair values that define the configuration of a application pool. Including :pool_name, :runtime_version, :pipeline_mode, :pool_username and :pool_password</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['enabled_sites']</tt></td>
    <td>Array</td>
    <td>A set of key pair values that define the configuration of a IIS site. Including :site_name, :protocol, :port, :path,:host_header, :pool_name</td>
    <td><tt>[]</tt></td>
  </tr>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['cfg_cmd']</tt></td>
    <td>Array</td>
    <td>Configuration commands passed to the iis_config resource. Example #node.default['iis-simplyadrian']['cfg_cmd'] = ["/section:handlers /+[name='svc-Integrated-4.0',path='*.svc',verb='*',type='ISAPI']"]</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['services']</tt></td>
    <td>Array</td>
    <td>Services that will be started and stopped during ARR install.</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['arr_helper']['schema_dir']</tt></td>
    <td>String</td>
    <td>The directory where the ARR helper schema configuration file is placed.</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['arr_helper']['x_forwarded_for_header_name']</tt></td>
    <td>String</td>
    <td>The header name for xForward protocol in the configuration schema for ARR helper.</td>
    <td><tt>simplyadrian-clientip</tt></td>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['arr_helper']['ssl_header_name']</tt></td>
    <td>String</td>
    <td>The ssl header name used in the configuration schema for the ARR helper.</td>
    <td><tt>X-ARR-SSL</tt></td>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['arr_helper']['client_header_name']</tt></td>
    <td>String</td>
    <td>The client header name used in the configuration schema for the ARR helper.</td>
    <td><tt>X-ARR-ClientCert</tt></td>
  </tr>
  <tr>
    <td><tt>['iis-simplyadrian']['arr_helper']['log_guid_name']</tt></td>
    <td>String</td>
    <td>The GUID name used for logging identification in the configuration schema for the ARR helper.</td>
    <td><tt>X-ARR-LOG-ID</tt></td>
  </tr>
</table>

Usage
-----
#### iis-simplyadrian::default

Just include `iis-simplyadrian` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[iis-simplyadrian]"
  ]
}
```

#### iis-simplyadrian::default + iis-simplyadrian::install-arr-features + iis-simplyadrian::install-arr-helper

Use the run_list example below to set up an IIS server with HAProxy support.:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[iis-simplyadrian]",
    "recipe[iis-simplyadrian::install-arr-features]",
    "recipe[iis-simplyadrian::install-arr-helper]"
  ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera (<simplyadrian@gmail.com>)