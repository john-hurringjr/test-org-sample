/**
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/******************************************
  Locals
 *****************************************/

locals {
  // Add necessary roles here if your project creation (03) pipeline needs them
  project_create_iam_roles_list = [
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.projectDeleter",
    "roles/resourcemanager.projectIamAdmin",
    "roles/billing.projectManager",
    "roles/resourcemanager.projectMover",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/monitoring.admin",
    "roles/logging.admin",
    "roles/bigquery.admin",
    "roles/storage.admin",
    "roles/compute.admin",
    "roles/dns.admin",
    "roles/cloudbuild.builds.editor",
    "roles/containeranalysis.admin",
    "roles/container.admin",
    "roles/cloudfunctions.admin",
    "roles/run.admin",
    "roles/artifactregistry.admin",
    "roles/dataflow.admin",
    "roles/pubsub.admin",
    "roles/vpcaccess.admin",
    "roles/datacatalog.admin",
    "roles/secretmanager.admin",
    "roles/cloudkms.admin",
    "roles/servicedirectory.admin",
    "roles/networkmanagement.admin",
    "roles/networkconnectivity.hubAdmin",
    "roles/dlp.admin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/serviceusage.serviceUsageAdmin"
  ]

  project_create_iam = toset(local.project_create_iam_roles_list)

}
