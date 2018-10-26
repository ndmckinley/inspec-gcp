# Copyright 2017 Google Inc.
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

require 'google_compute_firewalls'

class FirewallsTest < Firewalls
  def fetch_resource(data)
    return data
  end
end

firewalls_fixture = {"kind"=>"compute#firewallList",
 "id"=>"projects/sam-inspec/global/firewalls",
 "items"=>
  [{"kind"=>"compute#firewall",
    "id"=>"2182788659368790689",
    "creationTimestamp"=>"2018-10-11T22:42:38.647-07:00",
    "name"=>"default-2wnao3jebww7ldrn463stwke",
    "description"=>
      "Desc",
    "network"=>
     "https://www.googleapis.com/compute/v1/projects/sam-inspec/global/networks/default",
    "priority"=>1000,
    "sourceRanges"=>
     ["103.104.152.0/22",
      "104.132.0.0/14",
      "113.197.104.0/22",
      "185.25.28.0/22",
      "193.200.222.0/24",
      "89.207.224.0/21"],
    "allowed"=>[{"IPProtocol"=>"tcp", "ports"=>["22", "3389"]}],
    "direction"=>"INGRESS",
    "disabled"=>false,
    "selfLink"=>
     "https://www.googleapis.com/compute/v1/projects/sam-inspec/global/firewalls/default-2wnao3jebww7ldrn463stwke"},
   {"kind"=>"compute#firewall",
    "id"=>"8832388878237010597",
    "creationTimestamp"=>"2018-10-11T22:42:34.846-07:00",
    "name"=>"default-7mzjmae3tlidh4yoidvnpe53",
    "description"=>
     "Description 2",
    "network"=>
     "https://www.googleapis.com/compute/v1/projects/sam-inspec/global/networks/default",
    "priority"=>1000,
    "sourceRanges"=>
     ["108.170.224.0/19",
      "108.177.8.0/21",
      "108.177.80.0/20",
      "108.177.96.0/19",
      "172.102.8.0/21",
      "172.217.0.0/19",
      "172.217.128.0/19",
      "172.217.160.0/20",
      "172.217.176.1/32",
      "172.217.176.2/32",
      "172.217.192.0/19",
      "172.217.64.0/18",
      "172.253.50.0/23",
      "172.253.64.0/20",
      "173.194.0.0/16",
      "185.150.148.0/22",
      "192.104.160.0/23",
      "209.107.176.0/20",
      "209.85.128.0/17",
      "216.239.32.0/19",
      "216.252.220.0/22",
      "216.58.192.0/19",
      "64.233.160.0/19",
      "66.102.0.0/20",
      "66.249.64.0/19",
      "72.14.192.0/18",
      "74.125.0.0/16",
      "8.8.4.0/24",
      "8.8.8.0/24"],
    "targetTags"=>["https-server"],
    "allowed"=>[{"IPProtocol"=>"tcp", "ports"=>["443"]}],
    "direction"=>"INGRESS",
    "disabled"=>false,
    "selfLink"=>
     "https://www.googleapis.com/compute/v1/projects/sam-inspec/global/firewalls/default-7mzjmae3tlidh4yoidvnpe53"},
   {"kind"=>"compute#firewall",
    "id"=>"8107033807488387752",
    "creationTimestamp"=>"2018-10-11T22:42:31.919-07:00",
    "name"=>"default-knsku4qwwbtr3bhcf3y6vcmu",
    "description"=>
     "Another description",
    "network"=>
     "https://www.googleapis.com/compute/v1/projects/sam-inspec/global/networks/default",
    "priority"=>1000,
    "sourceRanges"=>["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"],
    "allowed"=>[{"IPProtocol"=>"tcp"}, {"IPProtocol"=>"udp"}],
    "direction"=>"INGRESS",
    "disabled"=>false,
    "selfLink"=>
     "https://www.googleapis.com/compute/v1/projects/sam-inspec/global/firewalls/default-knsku4qwwbtr3bhcf3y6vcmu"}
   ],

 "selfLink"=>
  "https://www.googleapis.com/compute/v1/projects/sam-inspec/global/firewalls"}

RSpec.describe Firewalls, '#fetch_resource' do
  before do 
    @firewalls_mock = FirewallsTest.new(firewalls_fixture)
  end
  context 'firewalls plural' do
    it { expect(@firewalls_mock.names.size).to eq 3 }
    it { expect(@firewalls_mock.names).to include 'default-knsku4qwwbtr3bhcf3y6vcmu' }
    it { expect(@firewalls_mock.names).to include 'default-7mzjmae3tlidh4yoidvnpe53' }
    it { expect(@firewalls_mock.names).to include 'default-2wnao3jebww7ldrn463stwke' }
  end
end

no_firewalls_fixture = {"kind"=>"compute#firewallList",
 "id"=>"projects/sam-inspec/global/firewalls",
 "items"=>[],
 "selfLink"=>
  "https://www.googleapis.com/compute/v1/projects/sam-inspec/global/firewalls"}

no_firewalls = FirewallsTest.new(no_firewalls_fixture)
RSpec.describe Firewalls, "#fetch_resource" do
  it "no firewalls" do
    expect(no_firewalls.names.size).to eq 0
  end
end