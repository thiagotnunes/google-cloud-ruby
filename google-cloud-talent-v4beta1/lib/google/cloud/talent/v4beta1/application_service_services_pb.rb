# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/talent/v4beta1/application_service.proto for package 'google.cloud.talent.v4beta1'
# Original file comments:
# Copyright 2020 Google LLC
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
#

require 'grpc'
require 'google/cloud/talent/v4beta1/application_service_pb'

module Google
  module Cloud
    module Talent
      module V4beta1
        module ApplicationService
          # A service that handles application management, including CRUD and
          # enumeration.
          class Service

            include GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.talent.v4beta1.ApplicationService'

            # Creates a new application entity.
            rpc :CreateApplication, ::Google::Cloud::Talent::V4beta1::CreateApplicationRequest, ::Google::Cloud::Talent::V4beta1::Application
            # Retrieves specified application.
            rpc :GetApplication, ::Google::Cloud::Talent::V4beta1::GetApplicationRequest, ::Google::Cloud::Talent::V4beta1::Application
            # Updates specified application.
            rpc :UpdateApplication, ::Google::Cloud::Talent::V4beta1::UpdateApplicationRequest, ::Google::Cloud::Talent::V4beta1::Application
            # Deletes specified application.
            rpc :DeleteApplication, ::Google::Cloud::Talent::V4beta1::DeleteApplicationRequest, ::Google::Protobuf::Empty
            # Lists all applications associated with the profile.
            rpc :ListApplications, ::Google::Cloud::Talent::V4beta1::ListApplicationsRequest, ::Google::Cloud::Talent::V4beta1::ListApplicationsResponse
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
