require 'octokit'
require 'date'
require 'time'
require 'active_support'
require 'active_support/time'

# Provide authentication credentials
client = Octokit::Client.new(ENV["GITHUB_ACCESS_TOKEN"])

# Fetch all open Rails issues
Octokit.auto_paginate = true
issues_and_prs = Octokit.issues 'rails/rails', state: "open", updated_at: "#{3.months.ago}", :pull_request => nil
puts issues_and_prs.last.updated_at
