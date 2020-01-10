# Copyright 2019 Google LLC
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


module Grafeas
  module V1
    # Metadata for any related URL information.
    # @!attribute [rw] url
    #   @return [String]
    #     Specific URL associated with the resource.
    # @!attribute [rw] label
    #   @return [String]
    #     Label to describe usage of the URL.
    class RelatedUrl; end

    # Verifiers (e.g. Kritis implementations) MUST verify signatures
    # with respect to the trust anchors defined in policy (e.g. a Kritis policy).
    # Typically this means that the verifier has been configured with a map from
    # `public_key_id` to public key material (and any required parameters, e.g.
    # signing algorithm).
    #
    # In particular, verification implementations MUST NOT treat the signature
    # `public_key_id` as anything more than a key lookup hint. The `public_key_id`
    # DOES NOT validate or authenticate a public key; it only provides a mechanism
    # for quickly selecting a public key ALREADY CONFIGURED on the verifier through
    # a trusted channel. Verification implementations MUST reject signatures in any
    # of the following circumstances:
    # * The `public_key_id` is not recognized by the verifier.
    #   * The public key that `public_key_id` refers to does not verify the
    #     signature with respect to the payload.
    #
    #   The `signature` contents SHOULD NOT be "attached" (where the payload is
    #   included with the serialized `signature` bytes). Verifiers MUST ignore any
    #   "attached" payload and only verify signatures with respect to explicitly
    #   provided payload (e.g. a `payload` field on the proto message that holds
    #   this Signature, or the canonical serialization of the proto message that
    #   holds this signature).
    # @!attribute [rw] signature
    #   @return [String]
    #     The content of the signature, an opaque bytestring.
    #     The payload that this signature verifies MUST be unambiguously provided
    #     with the Signature during verification. A wrapper message might provide
    #     the payload explicitly. Alternatively, a message might have a canonical
    #     serialization that can always be unambiguously computed to derive the
    #     payload.
    # @!attribute [rw] public_key_id
    #   @return [String]
    #     The identifier for the public key that verifies this signature.
    #     * The `public_key_id` is required.
    #       * The `public_key_id` MUST be an RFC3986 conformant URI.
    #       * When possible, the `public_key_id` SHOULD be an immutable reference,
    #         such as a cryptographic digest.
    #
    #       Examples of valid `public_key_id`s:
    #
    #     OpenPGP V4 public key fingerprint:
    #     * "openpgp4fpr:74FAF3B861BDA0870C7B6DEF607E48D2A663AEEA"
    #       See https://www.iana.org/assignments/uri-schemes/prov/openpgp4fpr for more
    #       details on this scheme.
    #
    #     RFC6920 digest-named SubjectPublicKeyInfo (digest of the DER
    #     serialization):
    #     * "ni:///sha-256;cD9o9Cq6LG3jD0iKXqEi_vdjJGecm_iXkbqVoScViaU"
    #       * "nih:///sha-256;703f68f42aba2c6de30f488a5ea122fef76324679c9bf89791ba95a1271589a5"
    class Signature; end

    # Kind represents the kinds of notes supported.
    module NoteKind
      # Unknown.
      NOTE_KIND_UNSPECIFIED = 0

      # The note and occurrence represent a package vulnerability.
      VULNERABILITY = 1

      # The note and occurrence assert build provenance.
      BUILD = 2

      # This represents an image basis relationship.
      IMAGE = 3

      # This represents a package installed via a package manager.
      PACKAGE = 4

      # The note and occurrence track deployment events.
      DEPLOYMENT = 5

      # The note and occurrence track the initial discovery status of a resource.
      DISCOVERY = 6

      # This represents a logical "role" that can attest to artifacts.
      ATTESTATION = 7

      # This represents an available package upgrade.
      UPGRADE = 8
    end
  end
end