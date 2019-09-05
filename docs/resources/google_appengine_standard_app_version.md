---
title: About the google_appengine_standard_app_version resource
platform: gcp
---

## Syntax
A `google_appengine_standard_app_version` is used to test a Google StandardAppVersion resource

## Examples
```

describe google_appengine_standard_app_version(project: 'chef-gcp-inspec', location: 'europe-west2', version_id: 'v2', service: 'default') do
  it { should exist }
  its('service') { should eq 'default' }
  its('version_id') { should eq 'v2' }
  its('runtime') { should eq 'nodejs10' }
end
```

## Properties
Properties that can be accessed from the `google_appengine_standard_app_version` resource:

  * `name`: Full path to the Version resource in the API. Example, "v1".

  * `version_id`: Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-". 

  * `runtime`: Desired runtime. Example python27.

  * `threadsafe`: Whether multiple requests can be dispatched to this version at once.

  * `runtime_api_version`: The version of the API in the given runtime environment.  Please see the app.yaml reference for valid values at https://cloud.google.com/appengine/docs/standard//config/appref

  * `handlers`: An ordered list of URL-matching patterns that should be applied to incoming requests.  The first matching URL handles the request and other request handlers are not attempted. 

    * `url_regex`: URL prefix. Uses regular expression syntax, which means regexp special characters must be escaped, but should not contain groupings.  All URLs that begin with this prefix are handled by this handler, using the portion of the URL after the prefix as part of the file path.

    * `security_level`: Security (HTTPS) enforcement for this URL.

    * `login`: Methods to restrict access to a URL based on login status.

    * `auth_fail_action`: Actions to take when the user is not logged in.

    * `redirect_http_response_code`: Redirect codes.

    * `script`: Executes a script to handle the requests that match this URL pattern.  Only the auto value is supported for Node.js in the App Engine standard environment, for example "script:" "auto".

    * `static_files`: Files served directly to the user for a given URL, such as images, CSS stylesheets, or JavaScript source files. Static file handlers describe which files in the application directory are static files, and which URLs serve them.

  * `libraries`: Configuration for third-party Python runtime libraries that are required by the application.

    * `name`: Name of the library. Example "django".

    * `version`: Version of the library to select, or "latest".

  * `env_variables`: Environment variables available to the application.

  * `deployment`: Code and application artifacts that make up this version.

    * `zip`: Zip File

    * `files`: Manifest of the files stored in Google Cloud Storage that are included as part of this version. All files must be readable using the credentials supplied with this call.

  * `entrypoint`: The entrypoint for the application.

    * `shell`: The format should be a shell command that can be fed to bash -c.

  * `service`: AppEngine service resource



## GCP Permissions

Ensure the [App Engine Admin API](https://console.cloud.google.com/apis/library/appengine.googleapis.com/) is enabled for the current project.
