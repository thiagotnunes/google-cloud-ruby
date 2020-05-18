## Migrating to google-cloud-os_login 1.0

The 1.0 release of the google-cloud-os_login client is a significant upgrade
based on a [next-gen code generator](https://github.com/googleapis/gapic-generator-ruby),
and includes substantial interface changes. Existing code written for earlier
versions of this library will likely require updates to use this version.
This document describes the changes that have been made, and what you need to
do to update your usage.

To summarize:

 *  The library has been broken out into three libraries. The new gems
    `google-cloud-os_login-v1` and `google-cloud-os_login-v1beta` contain the
    actual client classes for versions V1 and V1beta of the OS Login
    service, and the gem `google-cloud-os_login` now simply provides a
    convenience wrapper. See [Library Structure](#library-structure) for more
    info.
 *  The library uses a new configuration mechanism giving you closer control
    over endpoint address, network timeouts, and retry. See
    [Client Configuration](#client-configuration) for more info. Furthermore,
    when creating a client object, you can customize its configuration in a
    block rather than passing arguments to the constructor. See
    [Creating Clients](#creating-clients) for more info.
 *  Previously, positional arguments were used to indicate required arguments.
    Now, all method arguments are keyword arguments, with documentation that
    specifies whether they are required or optional. Additionally, you can pass
    a proto request object instead of separate arguments. See
    [Passing Arguments](#passing-arguments) for more info.
 *  Previously, some client classes included class methods for constructing
    resource paths. These paths are now instance methods on the client objects,
    and are also available in a separate paths module. See
    [Resource Path Helpers](#resource-path-helpers) for more info.
 *  Some classes have moved into different namespaces. See
    [Class Namespaces](#class-namespaces) for more info.

### Library Structure

Older 0.x releases of the `google-cloud-os_login` gem were all-in-one gems that
included potentially multiple clients for multiple versions of the OS Login
service. The `Google::Cloud::OsLogin.new` factory method would
return you an instance of a `Google::Cloud::OsLogin::V1::OsLoginServiceClient`
object for the V1 version of the service, or a
`Google::Cloud::OsLogin::V1beta::OsLoginServiceClient` object for the
V1beta version of the service. All these classes were defined in the same gem.

With the 1.0 release, the `google-cloud-os_login` gem still provides factory
methods for obtaining clients. (The method signatures will have changed. See
[Creating Clients](#creating-clients) for details.) However, the actual client
classes have been moved into separate gems, one per service version. The
`Google::Cloud::OsLogin::V1::OsLoginService::Client` class, along with its
helpers and data types, is now part of the `google-cloud-os_login-v1` gem.
Similarly, the `Google::Cloud::OsLogin::V1beta::OsLoginService::Client`
class is part of the `google-cloud-os_login-v1beta` gem. 

For normal usage, you can continue to install the `google-cloud-os_login` gem
(which will bring in the versioned client gems as dependencies) and continue to
use factory methods to create clients. However, you may alternatively choose to
install only one of the versioned gems. For example, if you know you will use only
`V1` of the service, you can install `google-cloud-os_login-v2` by itself, and
construct instances of the
`Google::Cloud::OsLogin::V1::OsLoginService::Client` client class directly.

### Client Configuration

In older releases, if you wanted to customize performance parameters or
low-level behavior of the client (such as credentials, timeouts, or
instrumentation), you would pass a variety of keyword arguments to the client
constructor. It was also extremely difficult to customize the default settings.

With the 1.0 release, a configuration interface provides control over these
parameters, including defaults for all instances of a client, and settings for
each specific client instance. For example, to set default credentials and
timeout for all OS Login V1 clients:

```
Google::Cloud::OsLogin::V1::OsLoginService::Client.configure do |config|
  config.credentials = "/path/to/credentials.json"
  config.timeout = 10.0
end
```

Individual RPCs can also be configured independently. For example, to set the
timeout for the `get_ssh_public_key` call:

```
Google::Cloud::OsLogin::V1::OsLoginService::Client.configure do |config|
  config.rpcs.get_ssh_public_key.timeout = 20.0
end
```

Defaults for certain configurations can be set for all OS Login versions
globally:

```
Google::Cloud::OsLogin.configure do |config|
  config.credentials = "/path/to/credentials.json"
  config.timeout = 10.0
end
```

Finally, you can override the configuration for each client instance. See the
next section on [Creating Clients](#creating-clients) for details.

### Creating Clients

In older releases, to create a client object, you would use the
`Google::Cloud::OsLogin.new` class method. Keyword arguments were available to
select a service version and to configure parameters such as credentials and
timeouts.

With the 1.0 release, use the `Google::Cloud::OsLogin.os_login_service` class
method to create a client object. You may select a service version using the
`:version` keyword argument. However, other configuration parameters should be
set in a configuration block when you create the client.

Old:
```
client = Google::Cloud::OsLogin.new credentials: "/path/to/credentials.json"
```

New:
```
client = Google::Cloud::OsLogin.os_login_service do |config|
  config.credentials = "/path/to/credentials.json"
end
```

The configuration block is optional. If you do not provide it, or you do not
set some configuration parameters, then the default configuration is used. See
[Client Configuration](#client-configuration).

### Passing Arguments

In older releases, required arguments would be passed as positional method
arguments, while most optional arguments would be passed as keyword arguments.

With the 1.0 release, all RPC arguments are passed as keyword arguments,
regardless of whether they are required or optional. For example:

Old:
```
client = Google::Cloud::OsLogin.new

key_name = "users/my-user/sshPublicKeys/12345"

# The key name is a positional argument.
response = client.get_ssh_public_key key_name
```

New:
```
client = Google::Cloud::OsLogin.os_login_service

key_name = "users/my-user/sshPublicKeys/12345"

# The key name is a keyword argument.
response = client.get_ssh_public_key name: key_name
```

In the 1.0 release, it is also possible to pass a request object, either
as a hash or as a protocol buffer.

New:
```
client = Google::Cloud::OsLogin.os_login_service

request = Google::Cloud::OsLogin::V1::GetSshPublicKeyRequest.new(
  name: "users/my-user/sshPublicKeys/12345"
)

# Pass a request object as a positional argument:
response = client.get_ssh_public_key request
```

Finally, in older releases, to provide call options, you would pass a
`Google::Gax::CallOptions` object with the `:options` keyword argument. In the
1.0 release, pass call options using a _second set_ of keyword arguments.

Old:
```
client = Google::Cloud::OsLogin.new

key_name = "users/my-user/sshPublicKeys/12345"

options = Google::Gax::CallOptions.new timeout: 10.0

response = client.get_ssh_public_key key_name, options: options
```

New:
```
client = Google::Cloud::OsLogin.os_login_service

key_name = "users/my-user/sshPublicKeys/12345"

# Use a hash to wrap the normal call arguments (or pass a request object), and
# then add further keyword arguments for the call options.
response = client.get_ssh_public_key({ name: key_name }, timeout: 10.0)
```

### Resource Path Helpers

The client library includes helper methods for generating the resource path
strings passed to many calls. These helpers have changed in two ways:

* In older releases, they are _class_ methods on the client class. In the 1.0
  release, they are _instance_ methods on the client. They are also available
  on a separate paths module that you can include elsewhere for convenience.
* In older releases, arguments to a resource path helper are passed as
  _positional_ arguments. In the 1.0 release, they are passed as named _keyword_
  arguments.

Following is an example involving using a resource path helper.

Old:
```
client = Google::Cloud::OsLogin.new

# Call the helper on the client class
key_name = Google::Cloud::OsLogin::V1::OsLoginServiceClient.ssh_public_key_path(
  "my-user", "12345"
)

response = client.get_ssh_public_key key_name
```

New:
```
client = Google::Cloud::OsLogin.os_login_service

# Call the helper on the client instance, and use keyword arguments
key_name = client.ssh_public_key_path user: "my-user", fingerprint: "12345"

response = client.get_ssh_public_key name: key_name
```

In the 1.0 client, you can also use the paths module as a convenience module.

New:
```
# Bring the session_path method into the current class
include Google::Cloud::OsLogin::V1::OsLoginService::Paths

def foo
  client = Google::Cloud::OsLogin.os_login_service

  # Call the included helper method
  key_name = ssh_public_key_path user: "my-user", fingerprint: "12345"

  response = client.get_ssh_public_key name: key_name

  # Do something with response...
end
```

### Class Namespaces

In older releases, some data type (protobuf) classes were located under the
module `Google::Cloud::Oslogin` (note lower-case "l"). In the 1.0 release,
these classes have been moved into the same `Google::Cloud::OsLogin` (note
upper-case "L") module by the client object, for consistency.

In older releases, the client object was of class
`Google::Cloud::OsLogin::V1::OsLoginServiceClient`.
In the 1.0 release, the client object is of class
`Google::Cloud::OsLogin::V1::OsLoginService::Client`.
Note that most users will use the `Google::Cloud::OsLogin.os_login_service`
factory method to create instances of the client object, so you may not need to
reference the actual class directly.
See [Creating Clients](#creating-clients).

In older releases, the credentials object was of class
`Google::Cloud::OsLogin::V1::Credentials`.
In the 1.0 release, the credentials object is of class
`Google::Cloud::OsLogin::V1::OsLoginService::Credentials`.
Again, most users will not need to reference this class directly.
See [Client Configuration](#client-configuration).