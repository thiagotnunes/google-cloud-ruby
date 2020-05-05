# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/dataproc/v1beta2/autoscaling_policies_pb"
require "google/cloud/dataproc/v1beta2/autoscaling_policies_services_pb"
require "google/cloud/dataproc/v1beta2/autoscaling_policy_service"

class ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicyService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_create_autoscaling_policy
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicy.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    policy = {}

    create_autoscaling_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_autoscaling_policy, name
      assert_kind_of ::Google::Cloud::Dataproc::V1beta2::CreateAutoscalingPolicyRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicy), request.policy
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_autoscaling_policy_client_stub do
      # Create client
      client = ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicyService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_autoscaling_policy({ parent: parent, policy: policy }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_autoscaling_policy parent: parent, policy: policy do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_autoscaling_policy ::Google::Cloud::Dataproc::V1beta2::CreateAutoscalingPolicyRequest.new(parent: parent, policy: policy) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_autoscaling_policy({ parent: parent, policy: policy }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_autoscaling_policy ::Google::Cloud::Dataproc::V1beta2::CreateAutoscalingPolicyRequest.new(parent: parent, policy: policy), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_autoscaling_policy_client_stub.call_rpc_count
    end
  end

  def test_update_autoscaling_policy
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicy.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    policy = {}

    update_autoscaling_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_autoscaling_policy, name
      assert_kind_of ::Google::Cloud::Dataproc::V1beta2::UpdateAutoscalingPolicyRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicy), request.policy
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_autoscaling_policy_client_stub do
      # Create client
      client = ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicyService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_autoscaling_policy({ policy: policy }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_autoscaling_policy policy: policy do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_autoscaling_policy ::Google::Cloud::Dataproc::V1beta2::UpdateAutoscalingPolicyRequest.new(policy: policy) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_autoscaling_policy({ policy: policy }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_autoscaling_policy ::Google::Cloud::Dataproc::V1beta2::UpdateAutoscalingPolicyRequest.new(policy: policy), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_autoscaling_policy_client_stub.call_rpc_count
    end
  end

  def test_get_autoscaling_policy
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicy.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_autoscaling_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_autoscaling_policy, name
      assert_kind_of ::Google::Cloud::Dataproc::V1beta2::GetAutoscalingPolicyRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_autoscaling_policy_client_stub do
      # Create client
      client = ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicyService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_autoscaling_policy({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_autoscaling_policy name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_autoscaling_policy ::Google::Cloud::Dataproc::V1beta2::GetAutoscalingPolicyRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_autoscaling_policy({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_autoscaling_policy ::Google::Cloud::Dataproc::V1beta2::GetAutoscalingPolicyRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_autoscaling_policy_client_stub.call_rpc_count
    end
  end

  def test_list_autoscaling_policies
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Dataproc::V1beta2::ListAutoscalingPoliciesResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_autoscaling_policies_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_autoscaling_policies, name
      assert_kind_of ::Google::Cloud::Dataproc::V1beta2::ListAutoscalingPoliciesRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_autoscaling_policies_client_stub do
      # Create client
      client = ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicyService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_autoscaling_policies({ parent: parent, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_autoscaling_policies parent: parent, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_autoscaling_policies ::Google::Cloud::Dataproc::V1beta2::ListAutoscalingPoliciesRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_autoscaling_policies({ parent: parent, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_autoscaling_policies ::Google::Cloud::Dataproc::V1beta2::ListAutoscalingPoliciesRequest.new(parent: parent, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_autoscaling_policies_client_stub.call_rpc_count
    end
  end

  def test_delete_autoscaling_policy
    # Create GRPC objects.
    grpc_response = ::Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_autoscaling_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_autoscaling_policy, name
      assert_kind_of ::Google::Cloud::Dataproc::V1beta2::DeleteAutoscalingPolicyRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_autoscaling_policy_client_stub do
      # Create client
      client = ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicyService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_autoscaling_policy({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_autoscaling_policy name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_autoscaling_policy ::Google::Cloud::Dataproc::V1beta2::DeleteAutoscalingPolicyRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_autoscaling_policy({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_autoscaling_policy ::Google::Cloud::Dataproc::V1beta2::DeleteAutoscalingPolicyRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_autoscaling_policy_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicyService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Cloud::Dataproc::V1beta2::AutoscalingPolicyService::Client::Configuration, config
  end
end