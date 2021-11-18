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
  Project that is subject to a unique org policy set at the folder level
 *****************************************/

module "project_subject_to_us_location_restriction" {
  source = "github.com/john-hurringjr/gcp-modules//project-creation/simple/v1?ref=main"
  project_id_category = "usonly"
  project_id_unique   = var.project_id_unique
  folder_id           = data.terraform_remote_state.rs_02_folders_iam_policies.outputs.folder_ids.unique
  billing_account_id  = var.billing_account_id
  project_admin_id    = var.project_admin_id
}


module "us_only_project_vpc" {
  source = "github.com/john-hurringjr/gcp-modules//packaged-solutions/networking/vpc-iap-nat/v1?ref=main"
  project_id = module.project_subject_to_us_location_restriction.project_id
}