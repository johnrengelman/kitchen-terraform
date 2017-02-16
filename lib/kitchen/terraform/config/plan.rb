# frozen_string_literal: true

# Copyright 2016 New Context Services, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require_relative "../config"
require_relative "contract/plan"
require_relative "operation"

::Kitchen::Terraform::Config::Plan =
  ::Class.new ::Kitchen::Terraform::Config::Operation do
    self["default"] = lambda do |plugin|
      plugin.instance_pathname filename: "terraform.tfplan"
    end
    self["key"] = :plan
    validate contract: ::Kitchen::Terraform::Config::Contract::Plan
  end