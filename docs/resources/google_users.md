---
title: About the google_users Resource
platform: gcp
---

# google\_users

Use the `google_users` InSpec audit resource to test properties of all, or a filtered group of, GCP users.

<br>

## Syntax

A `google_users` resource block collects GCP users for the specified customer.  As documented [here](https://developers.google.com/admin-sdk/directory/v1/reference/users/list), this defaults to the `my_customer` alias to represent your account's `customerId`.

    describe google_users(customer: 'my_customer') do
      it { should exist }
    end

The `domain` argument can optionally be provided to get fields from only one domain. Either the customer or the domain parameter must be provided. 

    describe google_users(domain: 'my_domain.com') do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_user`.

    google_users(customer: 'my_customer').user_ids.each do |user_id|
      describe google_user(user_key: user_id) do
        it { should exist }
        it { should_not be_suspended }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of zones available for the project

    describe google_users(customer: 'my_customer') do
      its('count') { should be <= 100}
    end

### Test the exact number of zones in the project

    describe google_users(customer: 'my_customer') do
      its('zone_ids.count') { should cmp 9 }
    end

### Test that an expected zone is available for the project

    describe google_users(customer: 'my_customer') do
      its('zone_names') { should include "us-east1-b" }
    end

### Test whether any zones are in status "DOWN"

    describe google_users(customer: 'my_customer') do
      its('zone_statuses') { should_not include "DOWN" }
    end

### Test that a subset of all users with name matching "Batman" exists

    google_users(customer: 'my_customer').where(user_full_name: /Batman/).user_ids.each do |user_id|
      describe google_user(user_key: user_id) do
        it { should exist }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `user_id`; `user_full_name` and `user_email`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `user_ids` - an array of google_user identifier integers
*  `user_full_names` - an array of google_user full name strings
*  `user_emails`- an array of google_user primary email address strings

<br>


## GCP Permissions

Ensure the G Suite Admin SDK [Directory API](https://developers.google.com/admin-sdk/directory/) is enabled and you have sufficient privileges to list users.