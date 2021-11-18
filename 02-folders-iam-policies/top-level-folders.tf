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
  Top Level Folders & IAM
 *****************************************/

/******************************************
  Misc Folder
 *****************************************/

# Create Folder
resource "google_folder" "misc_projects" {
  display_name = "Misc Projects"
  parent       = "organizations/${var.organization_id}"
}

# Folder IAM
resource "google_folder_iam_member" "misc_projects_iam" {
  for_each = local.project_create_iam
  folder = google_folder.misc_projects.id
  member = "serviceAccount:${var.base_projects_service_account_id}"
  role   = each.value
}


/******************************************
  Shared VPC
 *****************************************/
# Create Folder
resource "google_folder" "shared_vpc_setup" {
  display_name = "Shared VPC Projects"
  parent       = "organizations/${var.organization_id}"
}

# Folder IAM
resource "google_folder_iam_member" "shared_vpc_iam" {
  for_each = local.project_create_iam
  folder = google_folder.shared_vpc_setup.id
  member = "serviceAccount:${var.base_projects_service_account_id}"
  role   = each.value
}

/******************************************
  Unique Org Policies
 *****************************************/
# Create Folder
resource "google_folder" "unique_org_policies" {
  display_name = "Unique Org Policies"
  parent       = "organizations/${var.organization_id}"
}

# Folder IAM
resource "google_folder_iam_member" "unique_org_policies_iam" {
  for_each = local.project_create_iam
  folder = google_folder.unique_org_policies.id
  member = "serviceAccount:${var.base_projects_service_account_id}"
  role   = each.value
}