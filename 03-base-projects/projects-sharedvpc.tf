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
  Shared VPC Projects
  Should cover projects that cover the scenario of Shared VPC
 *****************************************/

/******************************************
  Host
 *****************************************/

module "project_shared_vpc_host" {
  source = "github.com/john-hurringjr/gcp-modules//project-creation/simple/v1?ref=main"
  project_id_category = "host"
  project_id_unique   = var.project_id_unique
  folder_id           = data.terraform_remote_state.rs_02_folders_iam_policies.outputs.folder_ids.sharedvpc
  billing_account_id  = var.billing_account_id
  project_admin_id    = var.project_admin_id
}


module "shared_vpc_host_prj_vpc" {
  source = "github.com/john-hurringjr/gcp-modules//packaged-solutions/networking/vpc-iap-nat/v1?ref=main"
  project_id = module.project_shared_vpc_host.project_id
}

resource "google_compute_shared_vpc_host_project" "promote_to_host" {
  project = module.project_shared_vpc_host.project_id
}

/******************************************
  Host
 *****************************************/

module "project_shared_vpc_service" {
  source = "github.com/john-hurringjr/gcp-modules//project-creation/simple/v1?ref=main"
  project_id_category = "service"
  project_id_unique   = var.project_id_unique
  folder_id           = data.terraform_remote_state.rs_02_folders_iam_policies.outputs.folder_ids.sharedvpc
  billing_account_id  = var.billing_account_id
  project_admin_id    = var.project_admin_id
}

resource "google_compute_shared_vpc_service_project" "promote_to_service" {
  depends_on = [google_compute_shared_vpc_host_project.promote_to_host]
  host_project    = module.project_shared_vpc_host.project_id
  service_project = module.project_shared_vpc_service.project_id
}