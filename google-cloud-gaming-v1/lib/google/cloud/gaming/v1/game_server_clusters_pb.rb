# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/gaming/v1/game_server_clusters.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/gaming/v1/common_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/timestamp_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/gaming/v1/game_server_clusters.proto", :syntax => :proto3) do
    add_message "google.cloud.gaming.v1.ListGameServerClustersRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
      optional :order_by, :string, 5
    end
    add_message "google.cloud.gaming.v1.ListGameServerClustersResponse" do
      repeated :game_server_clusters, :message, 1, "google.cloud.gaming.v1.GameServerCluster"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 4
    end
    add_message "google.cloud.gaming.v1.GetGameServerClusterRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.gaming.v1.CreateGameServerClusterRequest" do
      optional :parent, :string, 1
      optional :game_server_cluster_id, :string, 2
      optional :game_server_cluster, :message, 3, "google.cloud.gaming.v1.GameServerCluster"
    end
    add_message "google.cloud.gaming.v1.PreviewCreateGameServerClusterRequest" do
      optional :parent, :string, 1
      optional :game_server_cluster_id, :string, 2
      optional :game_server_cluster, :message, 3, "google.cloud.gaming.v1.GameServerCluster"
      optional :preview_time, :message, 4, "google.protobuf.Timestamp"
    end
    add_message "google.cloud.gaming.v1.PreviewCreateGameServerClusterResponse" do
      optional :etag, :string, 2
      optional :target_state, :message, 3, "google.cloud.gaming.v1.TargetState"
    end
    add_message "google.cloud.gaming.v1.DeleteGameServerClusterRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.gaming.v1.PreviewDeleteGameServerClusterRequest" do
      optional :name, :string, 1
      optional :preview_time, :message, 2, "google.protobuf.Timestamp"
    end
    add_message "google.cloud.gaming.v1.PreviewDeleteGameServerClusterResponse" do
      optional :etag, :string, 2
      optional :target_state, :message, 3, "google.cloud.gaming.v1.TargetState"
    end
    add_message "google.cloud.gaming.v1.UpdateGameServerClusterRequest" do
      optional :game_server_cluster, :message, 1, "google.cloud.gaming.v1.GameServerCluster"
      optional :update_mask, :message, 2, "google.protobuf.FieldMask"
    end
    add_message "google.cloud.gaming.v1.PreviewUpdateGameServerClusterRequest" do
      optional :game_server_cluster, :message, 1, "google.cloud.gaming.v1.GameServerCluster"
      optional :update_mask, :message, 2, "google.protobuf.FieldMask"
      optional :preview_time, :message, 3, "google.protobuf.Timestamp"
    end
    add_message "google.cloud.gaming.v1.PreviewUpdateGameServerClusterResponse" do
      optional :etag, :string, 2
      optional :target_state, :message, 3, "google.cloud.gaming.v1.TargetState"
    end
    add_message "google.cloud.gaming.v1.GameServerClusterConnectionInfo" do
      optional :namespace, :string, 5
      oneof :cluster_reference do
        optional :gke_cluster_reference, :message, 7, "google.cloud.gaming.v1.GkeClusterReference"
      end
    end
    add_message "google.cloud.gaming.v1.GkeClusterReference" do
      optional :cluster, :string, 1
    end
    add_message "google.cloud.gaming.v1.GameServerCluster" do
      optional :name, :string, 1
      optional :create_time, :message, 2, "google.protobuf.Timestamp"
      optional :update_time, :message, 3, "google.protobuf.Timestamp"
      map :labels, :string, :string, 4
      optional :connection_info, :message, 5, "google.cloud.gaming.v1.GameServerClusterConnectionInfo"
      optional :etag, :string, 6
      optional :description, :string, 7
    end
  end
end

module Google
  module Cloud
    module Gaming
      module V1
        ListGameServerClustersRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.ListGameServerClustersRequest").msgclass
        ListGameServerClustersResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.ListGameServerClustersResponse").msgclass
        GetGameServerClusterRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.GetGameServerClusterRequest").msgclass
        CreateGameServerClusterRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.CreateGameServerClusterRequest").msgclass
        PreviewCreateGameServerClusterRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.PreviewCreateGameServerClusterRequest").msgclass
        PreviewCreateGameServerClusterResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.PreviewCreateGameServerClusterResponse").msgclass
        DeleteGameServerClusterRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.DeleteGameServerClusterRequest").msgclass
        PreviewDeleteGameServerClusterRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.PreviewDeleteGameServerClusterRequest").msgclass
        PreviewDeleteGameServerClusterResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.PreviewDeleteGameServerClusterResponse").msgclass
        UpdateGameServerClusterRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.UpdateGameServerClusterRequest").msgclass
        PreviewUpdateGameServerClusterRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.PreviewUpdateGameServerClusterRequest").msgclass
        PreviewUpdateGameServerClusterResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.PreviewUpdateGameServerClusterResponse").msgclass
        GameServerClusterConnectionInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.GameServerClusterConnectionInfo").msgclass
        GkeClusterReference = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.GkeClusterReference").msgclass
        GameServerCluster = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.gaming.v1.GameServerCluster").msgclass
      end
    end
  end
end